[CmdletBinding()]
param(
    [string]$ProjectRoot = '.',
    [switch]$StrictDelivery
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ProjectRoot).Path
$errors = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

function Add-Finding([System.Collections.Generic.List[string]]$List, [string]$Message) { [void]$List.Add($Message) }
function Semantic-Finding([string]$Message) {
    if ($StrictDelivery) { Add-Finding $errors $Message } else { Add-Finding $warnings $Message }
}
function Normalize-Ascii([string]$Text) {
    $normalized = $Text.Normalize([System.Text.NormalizationForm]::FormD)
    $builder = [System.Text.StringBuilder]::new()
    foreach ($ch in $normalized.ToCharArray()) {
        if ([System.Globalization.CharUnicodeInfo]::GetUnicodeCategory($ch) -ne [System.Globalization.UnicodeCategory]::NonSpacingMark) { [void]$builder.Append($ch) }
    }
    return $builder.ToString().Normalize([System.Text.NormalizationForm]::FormC).Replace([char]0x0111,'d').Replace([char]0x0110,'D')
}
function Is-TemplateValue([string]$Value) {
    $placeholder = $Value -match '(?i)\{\{|XXX|TBD|Pending|Not Run|N/A'
    return [string]::IsNullOrWhiteSpace($Value) -or $placeholder -or $Value.Contains([char]0x2014) -or $Value.Contains([char]0x2013)
}
function Get-TableRows([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path)) { return @() }
    return @(Get-Content -LiteralPath $Path -Encoding UTF8 | Where-Object {
        $_ -match '^\s*\|.*\|\s*$' -and $_ -notmatch '^\s*\|\s*:?-{2}'
    })
}
function Get-CoreTableRows([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path)) { return @() }
    $rows = @()
    foreach ($line in Get-Content -LiteralPath $Path -Encoding UTF8) {
        if ($line -match '(?i)^##\s+Template-maintenance') { break }
        if ($line -match '^\s*\|.*\|\s*$' -and $line -notmatch '^\s*\|\s*:?-{2}') { $rows += $line }
    }
    return $rows
}
function Get-RowIds([string]$Line) {
    $pattern = '(?i)\b(?:OBJ|STK|BR|FR|NFR|REQ|UC|US|ADR|DES|WI|TC|DEF|REL|RISK|DEC|SEC|THR|PERM|DATA-RULE|BPMN|TASK|GATE|MSG|API|EVT|MIG|SCR|NAV|ASVS|DOC|CR|Q|OQ)-[A-Z0-9][A-Z0-9_.-]*\b'
    return @([regex]::Matches($Line, $pattern) | ForEach-Object { $_.Value })
}
function Rel([string]$Path) { return $Path.Substring($root.Length + 1).Replace('\','/') }

$phaseNames = @('00-Governance-Policy','01-Planning','02-Requirements','03-Architecture-Design','04-Implementation','05-Development','06-Testing','07-Reports','08-Document-References')
$projectMd = @()
$projectMd += @(Get-ChildItem -LiteralPath $root -File -Filter '*.md' -ErrorAction SilentlyContinue)
foreach ($phase in $phaseNames) {
    $phasePath = Join-Path $root $phase
    if (Test-Path -LiteralPath $phasePath) { $projectMd += @(Get-ChildItem -LiteralPath $phasePath -Recurse -File -Filter '*.md') }
}
$projectMd = @($projectMd | Sort-Object FullName -Unique)
foreach ($file in $projectMd) {
    $text = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    if ($text -notmatch '^(?s)---\r?\n.*?\r?\n---\r?\n') {
        Add-Finding $warnings "Missing front matter: $(Rel $file.FullName)"
        continue
    }
    foreach ($key in @('artifact_id','phase','artifact_type','owner','version','status','ids','dependencies','last_verified')) {
        if ($text -notmatch "(?m)^${key}:\s*.+$") { Add-Finding $warnings "Front matter missing key '$key': $(Rel $file.FullName)" }
    }
}

# Requirement semantics inspect only Markdown table rows, never instructional prose.
$requirementNames = @('BRD.md','SRS.md','FEATURE_CATALOG.md','USE_CASE_SPECIFICATION.md')
$requirementRows = @()
foreach ($name in $requirementNames) {
    $file = Join-Path $root "02-Requirements\$name"
    foreach ($row in (Get-TableRows $file)) {
        $ids = @(Get-RowIds $row | Where-Object { $_ -match '^(?i:BR|FR|NFR|REQ)-' -and $_ -notmatch '(?i)XXX' } | Select-Object -Unique)
        if ($ids.Count -eq 0) { continue }
        $asciiRow = Normalize-Ascii $row
        if ($asciiRow -notmatch '(?i)\b(SHALL|SHOULD|MAY|PHAI|NEN|CO THE)\b') { Add-Finding $warnings "Requirement row lacks normative keyword: $(Rel $file)" }
        if ($row -match '(?i)\{\{|\bTBD\b|\bXXX\b') { Add-Finding $warnings "Requirement row has unresolved value: $(Rel $file)" }
        if ($row -match '(?i)\{\{|\bTBD\b|\bXXX\b') { continue }
        $requirementRows += [PSCustomObject]@{ Path=$file; Row=$row; Ids=$ids }
        foreach ($id in $ids) { if ($id -notmatch '^(?i:(BR|FR|NFR|REQ)-[A-Z0-9][A-Z0-9_.-]*)$') { Add-Finding $errors "Invalid requirement ID format: $id in $(Rel $file)" } }
    }
}
$definitions = @{}
foreach ($entry in $requirementRows) {
    foreach ($id in $entry.Ids) {
        if (-not $definitions.ContainsKey($id)) { $definitions[$id] = [System.Collections.Generic.List[string]]::new() }
        [void]$definitions[$id].Add((Rel $entry.Path))
    }
}
foreach ($item in $definitions.GetEnumerator()) { if (($item.Value | Sort-Object -Unique).Count -gt 1) { Semantic-Finding "Duplicate requirement definition across artifacts: $($item.Key)" } }

$rtmPath = Join-Path $root '02-Requirements\TRACEABILITY_MATRIX.md'
$testRtmPath = Join-Path $root '06-Testing\TEST_TRACEABILITY_MATRIX.md'
$definedIds = @($definitions.Keys)
foreach ($row in (Get-CoreTableRows $rtmPath)) {
    if ($row -match '(?i)Template-maintenance|^\s*\|\s*Objective') { continue }
    if ($row -match '(?i)\{\{|\bXXX\b|\bTBD\b') { continue }
    $ids = @(Get-RowIds $row | Where-Object { $_ -match '^(?i:BR|FR|NFR|REQ)-' } | Select-Object -Unique)
    foreach ($id in $ids) {
        if ($definedIds -notcontains $id) { Semantic-Finding "RTM orphan requirement: $id" }
        if ($row -match '(?i)\|\s*(Verified|Accepted)\s*\|' -and (Is-TemplateValue $row)) { Add-Finding $errors "Verified/Accepted RTM row lacks concrete evidence: $id" }
    }
}
foreach ($row in (Get-CoreTableRows $testRtmPath)) {
    if ($row -match '(?i)Template-maintenance|^\s*\|\s*SRS/') { continue }
    if ($row -match '(?i)\{\{|\bXXX\b|\bTBD\b') { continue }
    $ids = @(Get-RowIds $row | Where-Object { $_ -match '^(?i:BR|FR|NFR|REQ)-' } | Select-Object -Unique)
    if ($ids.Count -gt 0 -and $row -notmatch '(?i)\bTC-[A-Z0-9-]+\b') { Semantic-Finding "Test RTM row lacks Test Case ID: $($ids -join ',')" }
    if ($ids.Count -gt 0 -and $row -match '(?i)Verified|Accepted' -and (Is-TemplateValue $row)) { Add-Finding $errors "Verified/Accepted Test RTM row lacks execution evidence: $($ids -join ',')" }
}

foreach ($file in $projectMd) {
    $text = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    foreach ($match in [regex]::Matches($text, '\]\(([^)]+)\)')) {
        $link = ($match.Groups[1].Value -split '#')[0]
        if ([string]::IsNullOrWhiteSpace($link) -or $link -match '^(https?://|mailto:|#)') { continue }
        $candidate = Join-Path $file.DirectoryName ($link -replace '/','\')
        if (-not (Test-Path -LiteralPath $candidate)) { Add-Finding $errors "Broken internal evidence/document link: $(Rel $file.FullName) -> $link" }
    }
}

$signoffNames = @('GOVERNANCE_AND_RACI.md','THREAT_MODEL.md','TEST_REPORT.md','UAT_AND_ACCEPTANCE.md','RELEASE_REPORT.md','HANDOVER_CHECKLIST.md')
foreach ($name in $signoffNames) {
    foreach ($file in @(Get-ChildItem -LiteralPath $root -Recurse -File -Filter $name -ErrorAction SilentlyContinue)) {
        $text = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        if ($text -notmatch '(?i)sign[- ]?off|approver|decision|role') { Add-Finding $warnings "Missing sign-off structure: $(Rel $file.FullName)" }
        if ($text -match '(?i)Pending|\{\{APPROVER|\{\{OWNER') { Add-Finding $warnings "Sign-off unresolved: $(Rel $file.FullName)" }
    }
}

$gatePath = Join-Path $root '.agents\skills\ai-project-delivery\references\phase-gates.md'
if (Test-Path -LiteralPath $gatePath) {
    $gateText = [System.IO.File]::ReadAllText($gatePath, [System.Text.Encoding]::UTF8)
    for ($i=0; $i -le 8; $i++) {
        $label = ('{0:D2}' -f $i)
        if ($gateText -notmatch "(?m)^### Gate $label\s+") { Add-Finding $errors "Missing gate definition: Gate $label" }
    }
}
$statePath = Join-Path $root 'PROJECT_STATE.md'
if (Test-Path -LiteralPath $statePath) {
    foreach ($line in (Get-Content -LiteralPath $statePath -Encoding UTF8 | Where-Object { $_ -match '^\|\s*0[0-8]' })) {
        if ($line -match '\|\s*Passed\s*\|') {
            $cells = @($line -split '\|') | ForEach-Object { $_.Trim() }
            $evidence = if ($cells.Count -ge 5) { $cells[4] } else { '' }
            if (Is-TemplateValue $evidence) { Add-Finding $errors "Phase marked Passed without concrete evidence: $line" }
        }
    }
}

$raciPath = Join-Path $root '00-Governance-Policy\GOVERNANCE_AND_RACI.md'
if (Test-Path -LiteralPath $raciPath) {
    $raciRows = @(Get-Content -LiteralPath $raciPath -Encoding UTF8 | Where-Object { $_ -match '(?i)High residual security risk acceptance' })
    if ($raciRows.Count -ne 1) { Add-Finding $errors 'RACI must contain exactly one High residual security risk acceptance row.' }
    elseif (([regex]::Matches($raciRows[0], '(?i)\|\s*A\s*\|')).Count -ne 1) { Add-Finding $errors 'High residual security risk acceptance must have exactly one A in RACI.' }
}

$result = [PSCustomObject]@{ ProjectRoot=$root; Errors=$errors.Count; Warnings=$warnings.Count; Valid=($errors.Count -eq 0); ErrorDetails=@($errors); WarningDetails=@($warnings) }
$result | ConvertTo-Json -Depth 5
if ($errors.Count -gt 0) { exit 1 }
