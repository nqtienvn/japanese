[CmdletBinding(SupportsShouldProcess)]
param(
    [string]$ProjectRoot = '.',
    [switch]$IncludeExampleProject
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ProjectRoot).Path
$phaseNames = @('00-Governance-Policy','01-Planning','02-Requirements','03-Architecture-Design','04-Implementation','05-Development','06-Testing','07-Reports','08-Document-References')
$artifactType = @{
    '00-Governance-Policy'='governance'; '01-Planning'='planning'; '02-Requirements'='requirements';
    '03-Architecture-Design'='design'; '04-Implementation'='implementation'; '05-Development'='development';
    '06-Testing'='testing'; '07-Reports'='report'; '08-Document-References'='handover'; 'ROOT'='orchestration'
}
$files = @()
$files += @(Get-ChildItem -LiteralPath $root -File -Filter '*.md')
foreach ($phase in $phaseNames) {
    $path = Join-Path $root $phase
    if (Test-Path -LiteralPath $path) { $files += @(Get-ChildItem -LiteralPath $path -Recurse -File -Filter '*.md') }
}
if ($IncludeExampleProject) {
    $examplePath = Join-Path $root '09-Example-Project'
    if (Test-Path -LiteralPath $examplePath) { $files += @(Get-ChildItem -LiteralPath $examplePath -Recurse -File -Filter '*.md') }
}

$changed = 0
foreach ($file in ($files | Sort-Object FullName -Unique)) {
    $text = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    if ($text -match '^(?s)---\r?\n.*?\r?\n---\r?\n') { continue }
    $relative = $file.FullName.Substring($root.Length + 1).Replace('\','/')
    $parts = $relative.Split('/')
    $phase = if ($parts.Count -gt 1 -and $phaseNames -contains $parts[0]) { $parts[0] } elseif ($parts[0] -eq '09-Example-Project') { '09-Example-Project' } else { 'ROOT' }
    $slug = ([regex]::Replace($relative.ToUpperInvariant(), '[^A-Z0-9]+', '-')).Trim('-')
    $id = "DOC-$slug"
    $type = if ($artifactType.ContainsKey($phase)) { $artifactType[$phase] } else { 'example' }
    $frontMatter = @(
        '---',
        "artifact_id: $id",
        "phase: `"$phase`"",
        "artifact_type: $type",
        'owner: "{{OWNER}}"',
        'version: "0.1"',
        'status: Template',
        'ids: []',
        'dependencies: []',
        'last_verified: "{{DATE}}"',
        '---',
        ''
    ) -join "`n"
    if ($PSCmdlet.ShouldProcess($relative, 'Add machine-readable front matter')) {
        [System.IO.File]::WriteAllText($file.FullName, $frontMatter + $text, [System.Text.UTF8Encoding]::new($false))
        $changed++
    }
}
[PSCustomObject]@{ ProjectRoot=$root; Changed=$changed; IncludeExampleProject=[bool]$IncludeExampleProject } | ConvertTo-Json
