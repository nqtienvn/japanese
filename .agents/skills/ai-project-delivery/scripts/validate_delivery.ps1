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
    '00-Governance-Policy' = @('README.md', 'PROJECT_CHARTER.md', 'STATEMENT_OF_WORK.md', 'GOVERNANCE_AND_RACI.md', 'ENGINEERING_POLICY.md', 'SECURITY_AND_PRIVACY_STANDARD.md', 'BANK_SECURITY_REFERENCE_BASELINE.md', 'FRONT_MATTER_STANDARD.md', 'REUSABLE_QUALITY_PATTERNS.md', 'HUMAN_AI_COLLABORATION_PROTOCOL.md', 'DOCUMENT_QUALITY_STANDARD.md', 'STANDARDS_ALIGNMENT_MATRIX.md', 'CHANGE_REQUEST_TEMPLATE.md', 'COMMERCIAL_AND_ACCEPTANCE_MODEL.md')
    '01-Planning' = @('README.md', 'DISCOVERY_LOG.md', 'PROJECT_PLAN.md', 'RISK_REGISTER.md', 'BROWNFIELD_AUDIT.md', 'COST_FINOPS_CAPACITY_LIFECYCLE.md')
    '02-Requirements' = @('README.md', 'BRD.md', 'SRS.md', 'FEATURE_CATALOG.md', 'USE_CASE_SPECIFICATION.md', 'BPMN_WORKFLOW.md', 'CRUD_FUNCTIONAL_MATRIX.md', 'REQUIREMENT_ITEM_TEMPLATE.md', 'REQUIREMENTS_REVIEW.md', 'TRACEABILITY_MATRIX.md')
    '03-Architecture-Design' = @('README.md', 'SOFTWARE_ARCHITECTURE.md', 'DOMAIN_MODEL.md', 'DATA_MODEL_ERD.md', 'PHYSICAL_DATABASE_DESIGN.md', 'API_SPECIFICATION.md', 'CONTRACT_VALIDATION.md', 'ADR_TEMPLATE.md', 'ENGINEERING_DESIGN_SPEC.md', 'THREAT_MODEL.md', 'PERMISSION_MATRIX.md', 'ASVS_MAPPING.md', 'SECURITY_ADOPTION_RECORD.md', 'UI_UX_SPECIFICATION.md', 'DESIGN_REVIEW.md')
    '04-Implementation' = @('README.md', 'IMPLEMENTATION_PLAN.md', 'ENVIRONMENT_SETUP.md', 'MIGRATION_REGISTRY.md', 'WORK_ITEM_TEMPLATE.md', 'MIGRATION_RELEASE_ROLLBACK.md', 'CHANGELOG.md')
    '05-Development' = @('README.md', 'PROJECT_STRUCTURE.md', 'DEVELOPMENT_WORKFLOW.md', 'DEVOPS_IAC_AND_PIPELINE.md', 'CONTAINER_SECURITY_PROFILE.md', 'CODE_REVIEW_CHECKLIST.md', 'PULL_REQUEST_TEMPLATE.md', 'TECH_DEBT_REGISTER.md')
    '06-Testing' = @('README.md', 'TEST_POLICY.md', 'TEST_STRATEGY_AND_PLAN.md', 'TEST_SPECIFICATION.md', 'TEST_CASE_TEMPLATE.md', 'TDD_SPECIFICATION.md', 'TEST_STATUS_REPORT.md', 'TEST_REPORT.md', 'TEST_TRACEABILITY_MATRIX.md', 'SECURITY_VERIFICATION_MATRIX.md', 'DR_RESTORE_FAILOVER_EXERCISE.md', 'DEFECT_REGISTER.md', 'UAT_AND_ACCEPTANCE.md', 'DOCUMENT_QUALITY_AUDIT.md', 'FIELD_VALIDATION_REPORT.md')
    '07-Reports' = @('README.md', 'STATUS_AND_SPRINT_REPORT.md', 'READINESS_DASHBOARD.md', 'RELEASE_REPORT.md', 'INCIDENT_AND_PIR.md', 'LESSONS_LEARNED.md', 'FINAL_REPORT.md')
    '08-Document-References' = @('README.md', 'DOCUMENT_INDEX.md', 'DEPLOYMENT_GUIDE.md', 'USER_GUIDE.md', 'OPERATIONS_RUNBOOK.md', 'DR_BCP_AND_CRISIS_PLAN.md', 'HANDOVER_CHECKLIST.md', 'MEETING_MINUTES.md', 'GLOSSARY_AND_REFERENCES.md', 'TERM_STANDARDIZATION.md', 'SECURITY_REFERENCE_INDEX.md')
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

foreach ($securityGuide in @(
    '.agents\skills\ai-project-delivery\references\security-adoption-workflow.md',
    '.agents\skills\ai-project-delivery\references\security-portability-matrix.md'
)) {
    if (-not (Test-Path -LiteralPath (Join-Path $root $securityGuide) -PathType Leaf)) {
        $errors.Add("Missing security workflow guide: $securityGuide")
    }
}

# Run semantic delivery lint and contract checks in addition to file-presence checks.
$semanticLintPath = Join-Path $root '.agents\skills\ai-project-delivery\scripts\lint_delivery.ps1'
if (Test-Path -LiteralPath $semanticLintPath) {
    $lintOutput = (& $semanticLintPath -ProjectRoot $root -StrictDelivery:$StrictDelivery 2>&1 | Out-String)
    try {
        $lint = $lintOutput | ConvertFrom-Json
        foreach ($detail in @($lint.ErrorDetails)) { $errors.Add("Semantic lint: $detail") }
        foreach ($detail in @($lint.WarningDetails)) { $warnings.Add("Semantic lint: $detail") }
    } catch {
        $errors.Add("Semantic linter did not return valid JSON: $($_.Exception.Message)")
    }
} else {
    $errors.Add('Missing semantic delivery linter: .agents/skills/ai-project-delivery/scripts/lint_delivery.ps1')
}
$contractValidatorPath = Join-Path $root '.agents\skills\ai-project-delivery\scripts\validate_contracts.ps1'
if (Test-Path -LiteralPath $contractValidatorPath) {
    $contractOutput = (& $contractValidatorPath -ProjectRoot $root -Strict 2>&1 | Out-String)
    try {
        $contract = $contractOutput | ConvertFrom-Json
        foreach ($detail in @($contract.ErrorDetails)) { $errors.Add("Contract validation: $detail") }
        foreach ($detail in @($contract.WarningDetails)) { $warnings.Add("Contract validation: $detail") }
    } catch {
        $errors.Add("Contract validator did not return valid JSON: $($_.Exception.Message)")
    }
} else {
    $errors.Add('Missing contract validator: .agents/skills/ai-project-delivery/scripts/validate_contracts.ps1')
}

$securityReferenceRoot = Join-Path $root '.agents\skills\ai-project-delivery\assets\security-reference'
$securityReferenceFiles = @(
    'README.md',
    'MANIFEST.md',
    'SECURITY_REVIEW.md',
    'legacy-bank-security\pom.xml',
    'legacy-bank-security\src\main\resources\application-sec.yml',
    'mb-security-starter\pom.xml',
    'mb-security-starter\src\main\resources\application-example.yml',
    'mb-security-starter\templates\application.yml'
)
foreach ($relativePath in $securityReferenceFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $securityReferenceRoot $relativePath) -PathType Leaf)) {
        $errors.Add("Missing security reference artifact: $relativePath")
    }
}

if (Test-Path -LiteralPath $securityReferenceRoot -PathType Container) {
    $legacyJavaRoot = Join-Path $securityReferenceRoot 'legacy-bank-security\src\main\java'
    $starterJavaRoot = Join-Path $securityReferenceRoot 'mb-security-starter\src\main\java'
    $starterTemplateRoot = Join-Path $securityReferenceRoot 'mb-security-starter\templates'
    $legacyJavaCount = @(Get-ChildItem -LiteralPath $legacyJavaRoot -Recurse -File -Filter '*.java' -ErrorAction SilentlyContinue).Count
    $starterJavaCount = @(Get-ChildItem -LiteralPath $starterJavaRoot -Recurse -File -Filter '*.java' -ErrorAction SilentlyContinue).Count
    $starterTemplateJavaCount = @(Get-ChildItem -LiteralPath $starterTemplateRoot -File -Filter '*.java' -ErrorAction SilentlyContinue).Count
    if ($legacyJavaCount -ne 23) { $errors.Add("Legacy security snapshot must contain 23 Java files; found $legacyJavaCount.") }
    if (($starterJavaCount + $starterTemplateJavaCount) -ne 18) { $errors.Add("Starter security snapshot must contain 18 Java files; found $($starterJavaCount + $starterTemplateJavaCount).") }

    $sanitizedConfigPaths = @(
        (Join-Path $securityReferenceRoot 'legacy-bank-security\src\main\resources\application-sec.yml'),
        (Join-Path $securityReferenceRoot 'mb-security-starter\src\main\resources\application-example.yml'),
        (Join-Path $securityReferenceRoot 'mb-security-starter\templates\application.yml')
    )
    $unsafeConfigPattern = '(?im)PBEWithMD5AndTripleDES|^\s*(password|secret)\s*:\s*(password|[A-Za-z0-9+/]{24,}={0,2})\s*$|\$\{JWT_SECRET:[^}]+\}|ddl-auto\s*:\s*update|show-sql\s*:\s*true|include-message\s*:\s*always'
    foreach ($configPath in $sanitizedConfigPaths) {
        if ((Test-Path -LiteralPath $configPath) -and ([System.IO.File]::ReadAllText($configPath) -match $unsafeConfigPattern)) {
            $errors.Add("Unsafe value/default found in sanitized security config: $($configPath.Substring($root.Length + 1))")
        }
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
            # Only requirement table rows are normative inputs. Instructional prose may mention IDs
            # and SHALL/PHẢI, but it is not a requirement definition and must not affect validation.
            if ($line -notmatch '^\s*\|.*\|\s*$' -or $line -match '^\s*\|\s*:?-{2,}') { continue }
            $asciiLine = ConvertTo-AsciiText -Text $line
            if (($asciiLine -match '(?i)\b(BR|FR|NFR|SEC|REQ)-[A-Z0-9-]+\b') -and ($asciiLine -match '(?i)\b(SHALL|SHALL NOT|PHAI|KHONG DUOC)\b')) {
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
