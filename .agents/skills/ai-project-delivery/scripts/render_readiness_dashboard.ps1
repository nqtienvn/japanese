[CmdletBinding(SupportsShouldProcess)]
param(
    [string]$ProjectRoot = '.',
    [string]$OutputPath = '07-Reports/READINESS_DASHBOARD.generated.md'
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ProjectRoot).Path
$statePath = Join-Path $root 'PROJECT_STATE.md'
$dashboard = Join-Path $root ($OutputPath -replace '/','\')
$rows = @()
if (Test-Path -LiteralPath $statePath) {
    foreach ($line in Get-Content -LiteralPath $statePath -Encoding UTF8 | Where-Object { $_ -match '^\|\s*0[0-8]' }) {
        $cells = @($line -split '\|') | ForEach-Object { $_.Trim() }
        if ($cells.Count -ge 6) {
            $phase = $cells[1]; $status = $cells[2]; $gate = $cells[3]; $evidence = $cells[4]
            $hasEvidence = -not [string]::IsNullOrWhiteSpace($evidence) -and $evidence -notmatch '(?i)\{\{|Not Run|TBD|XXX' -and -not $evidence.Contains([char]0x2014) -and -not $evidence.Contains([char]0x2013)
            $readiness = if ($status -eq 'Passed' -and $hasEvidence) { 'Evidence-backed candidate' } elseif ($status -eq 'Passed') { 'Blocked: evidence missing' } else { 'Not passed' }
            $rows += [PSCustomObject]@{ Phase=$phase; Status=$status; Gate=$gate; Evidence=$evidence; Readiness=$readiness }
        }
    }
}
$lines = [System.Collections.Generic.List[string]]::new()
[void]$lines.Add('---')
[void]$lines.Add('artifact_id: REPORT-READINESS-DASHBOARD-GENERATED')
[void]$lines.Add('phase: "07-Reports"')
[void]$lines.Add('artifact_type: report')
[void]$lines.Add('owner: "Delivery Lead"')
[void]$lines.Add('version: "generated"')
[void]$lines.Add('status: Generated')
[void]$lines.Add('ids: [GATE-READINESS-GENERATED]')
[void]$lines.Add('dependencies: [PROJECT_STATE.md, READINESS_DASHBOARD.md]')
[void]$lines.Add('last_verified: "generated-at-run-time"')
[void]$lines.Add('---')
[void]$lines.Add('# Generated readiness snapshot')
[void]$lines.Add('')
[void]$lines.Add('| Phase | Status | Gate | Evidence | Readiness |')
[void]$lines.Add('| :--- | :--- | :--- | :--- | :--- |')
foreach ($row in $rows) { [void]$lines.Add("| $($row.Phase) | $($row.Status) | $($row.Gate) | $($row.Evidence) | $($row.Readiness) |") }
if ($PSCmdlet.ShouldProcess($dashboard, 'Write generated readiness dashboard')) {
    $parent = Split-Path -Parent $dashboard
    if (-not (Test-Path $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
    [System.IO.File]::WriteAllLines($dashboard, $lines, [System.Text.UTF8Encoding]::new($false))
}
[PSCustomObject]@{ OutputPath=$dashboard; PhaseRows=$rows.Count } | ConvertTo-Json
