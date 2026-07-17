[CmdletBinding()]
param(
    [string]$ProjectRoot = '.',
    [switch]$StrictDelivery
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ProjectRoot).Path

function ConvertTo-AsciiText {
    param([string]$Text)
    $normalized = $Text.Normalize([System.Text.NormalizationForm]::FormD)
    $builder = [System.Text.StringBuilder]::new()
    foreach ($character in $normalized.ToCharArray()) {
        $category = [System.Globalization.CharUnicodeInfo]::GetUnicodeCategory($character)
        if ($category -ne [System.Globalization.UnicodeCategory]::NonSpacingMark) {
            [void]$builder.Append($character)
        }
    }
    $result = $builder.ToString().Normalize([System.Text.NormalizationForm]::FormC)
    $result = $result.Replace([char]0x0111, 'd').Replace([char]0x0110, 'D')
    return $result
}
$required = [ordered]@{
    '00-Governance-Policy' = @('README.md', 'PROJECT_CHARTER.md', 'GOVERNANCE_AND_RACI.md', 'ENGINEERING_POLICY.md', 'DOCUMENT_QUALITY_STANDARD.md', 'STANDARDS_ALIGNMENT_MATRIX.md')
    '01-Planning' = @('README.md', 'DISCOVERY_LOG.md', 'PROJECT_PLAN.md', 'RISK_REGISTER.md')
    '02-Requirements' = @('README.md', 'BRD.md', 'SRS.md', 'FEATURE_CATALOG.md', 'USE_CASE_SPECIFICATION.md', 'REQUIREMENT_ITEM_TEMPLATE.md', 'TRACEABILITY_MATRIX.md')
    '03-Architecture-Design' = @('README.md', 'SOFTWARE_ARCHITECTURE.md', 'DATA_MODEL_ERD.md', 'API_SPECIFICATION.md', 'ADR_TEMPLATE.md', 'ENGINEERING_DESIGN_SPEC.md', 'DESIGN_REVIEW.md')
    '04-Implementation' = @('README.md', 'IMPLEMENTATION_PLAN.md', 'WORK_ITEM_TEMPLATE.md', 'MIGRATION_RELEASE_ROLLBACK.md', 'CHANGELOG.md')
    '05-Development' = @('README.md', 'PROJECT_STRUCTURE.md', 'DEVELOPMENT_WORKFLOW.md', 'CODE_REVIEW_CHECKLIST.md', 'TECH_DEBT_REGISTER.md')
    '06-Testing' = @('README.md', 'TEST_POLICY.md', 'TEST_STRATEGY_AND_PLAN.md', 'TEST_SPECIFICATION.md', 'TEST_CASE_TEMPLATE.md', 'TEST_STATUS_REPORT.md', 'TEST_REPORT.md', 'TEST_TRACEABILITY_MATRIX.md', 'DEFECT_REGISTER.md', 'DOCUMENT_QUALITY_AUDIT.md', 'FIELD_VALIDATION_REPORT.md')
    '07-Reports' = @('README.md', 'STATUS_AND_SPRINT_REPORT.md', 'RELEASE_REPORT.md', 'FINAL_REPORT.md')
    '08-Document-References' = @('README.md', 'DOCUMENT_INDEX.md', 'DEPLOYMENT_GUIDE.md', 'USER_GUIDE.md', 'OPERATIONS_RUNBOOK.md', 'HANDOVER_CHECKLIST.md')
}

$errors = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

foreach ($phase in $required.GetEnumerator()) {
    $phasePath = Join-Path $root $phase.Key
    if (-not (Test-Path -LiteralPath $phasePath -PathType Container)) {
        $errors.Add("Missing phase directory: $($phase.Key)")
        continue
    }
    foreach ($file in $phase.Value) {
        $artifact = Join-Path $phasePath $file
        if (-not (Test-Path -LiteralPath $artifact -PathType Leaf)) {
            $errors.Add("Missing required artifact: $($phase.Key)/$file")
        }
    }
}

foreach ($rootFile in @('README.md', 'START.md', 'MASTER_PROMPT.md', 'USAGE_GUIDE.md', 'AGENTS.md', 'PROJECT_PROFILE.md', 'PROJECT_STATE.md')) {
    if (-not (Test-Path -LiteralPath (Join-Path $root $rootFile) -PathType Leaf)) {
        $errors.Add("Missing root artifact: $rootFile")
    }
}

$markdownFiles = @(Get-ChildItem -LiteralPath $root -Recurse -File -Filter '*.md' -ErrorAction SilentlyContinue)
$placeholderCount = 0
foreach ($file in $markdownFiles) {
    $matches = [regex]::Matches([System.IO.File]::ReadAllText($file.FullName), '\{\{[A-Z0-9_]+\}\}')
    $placeholderCount += $matches.Count
}
if ($placeholderCount -gt 0) {
    $message = "Unresolved template placeholders: $placeholderCount"
    if ($StrictDelivery) { $errors.Add($message) } else { $warnings.Add($message) }
}

$statePath = Join-Path $root 'PROJECT_STATE.md'
if ($StrictDelivery -and (Test-Path -LiteralPath $statePath)) {
    $state = [System.IO.File]::ReadAllText($statePath)
    $passedCount = ([regex]::Matches($state, '(?im)^\|\s*0[0-8][^|]*\|\s*Passed\s*\|')).Count
    if ($passedCount -ne 9) {
        $errors.Add("Strict delivery requires 9 phase rows with status Passed; found $passedCount.")
    }
}

if ($StrictDelivery) {
    $requirementFiles = @(
        (Join-Path $root '02-Requirements\BRD.md'),
        (Join-Path $root '02-Requirements\SRS.md')
    )
    $normativeLines = [System.Collections.Generic.List[string]]::new()
    foreach ($requirementFile in $requirementFiles) {
        if (-not (Test-Path -LiteralPath $requirementFile)) { continue }
        foreach ($line in [System.IO.File]::ReadAllLines($requirementFile)) {
            $asciiLine = ConvertTo-AsciiText -Text $line
            if ($asciiLine -match '(?i)\b(SHALL|SHALL NOT|PHAI|KHONG DUOC)\b') {
                $normativeLines.Add($asciiLine)
            }
        }
    }
    if ($normativeLines.Count -eq 0) {
        $errors.Add('Strict delivery requires at least one explicit SHALL/PHAI normative requirement in BRD/SRS.')
    }

    $vaguePattern = '(?i)\b(nhanh|dep|muot ma|than thien|toi uu|som nhat|hop ly|day du|fast|beautiful|smooth|user-friendly|optimized|as soon as possible)\b'
    $vagueLines = @($normativeLines | Where-Object { $_ -match $vaguePattern })
    if ($vagueLines.Count -gt 0) {
        $errors.Add("Ambiguous qualitative terms found in normative requirements: $($vagueLines.Count).")
    }

    $atomicCandidates = @($normativeLines | Where-Object { $_ -match '(?i)\s(va|hoac|and|or)\s' })
    if ($atomicCandidates.Count -gt 0) {
        $warnings.Add("Potential non-atomic normative requirements containing conjunctions: $($atomicCandidates.Count); review DOCUMENT_QUALITY_AUDIT.md.")
    }
}

$result = [PSCustomObject]@{
    ProjectRoot = $root
    RequiredPhaseCount = $required.Count
    Errors = $errors.Count
    Warnings = $warnings.Count
    PlaceholderCount = $placeholderCount
    ErrorDetails = @($errors)
    WarningDetails = @($warnings)
    Valid = ($errors.Count -eq 0)
}

$result | ConvertTo-Json -Depth 5
if ($errors.Count -gt 0) { exit 1 }
