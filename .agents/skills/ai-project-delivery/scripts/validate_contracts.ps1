[CmdletBinding()]
param(
    [string]$ProjectRoot = '.',
    [switch]$Strict
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ProjectRoot).Path
$contractRoot = Join-Path $root '03-Architecture-Design\contracts'
$errors = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

function Check-Contains([string]$Text, [string]$Pattern, [string]$Message) {
    if ($Text -notmatch $Pattern) { [void]$errors.Add($Message) }
}
function Check-Refs([string]$Text, [string]$Name) {
    foreach ($ref in [regex]::Matches($Text, '(?m)^\s*\$?ref:\s*["'']?#/components/[^\s"'']+')) {
        if ($ref.Value -match '#/components/([^\s"'']+)') {
            $target = $Matches[1]
            $leaf = ($target -split '/')[-1]
            if ($Text -notmatch "(?m)^\s{2,}$([regex]::Escape($leaf)):\s*$") { [void]$errors.Add("$Name unresolved local component reference: $target") }
        }
    }
}

$openapiPath = Join-Path $contractRoot 'openapi.yaml'
$asyncapiPath = Join-Path $contractRoot 'asyncapi.yaml'
if (-not (Test-Path -LiteralPath $openapiPath)) { [void]$errors.Add('Missing OpenAPI scaffold: 03-Architecture-Design/contracts/openapi.yaml') }
else {
    $text = [System.IO.File]::ReadAllText($openapiPath, [System.Text.Encoding]::UTF8)
    Check-Contains $text '^openapi:\s*3\.1' 'OpenAPI scaffold must declare version 3.1.'
    Check-Contains $text '(?m)^info:\s*$' 'OpenAPI scaffold missing info section.'
    Check-Contains $text '(?m)^paths:\s*$' 'OpenAPI scaffold missing paths section.'
    Check-Contains $text '(?m)^components:\s*$' 'OpenAPI scaffold missing components section.'
    Check-Contains $text '(?m)^\s+operationId:\s*\S+' 'OpenAPI scaffold must include operationId.'
    Check-Refs $text 'OpenAPI'
}
if (-not (Test-Path -LiteralPath $asyncapiPath)) { [void]$errors.Add('Missing AsyncAPI scaffold: 03-Architecture-Design/contracts/asyncapi.yaml') }
else {
    $text = [System.IO.File]::ReadAllText($asyncapiPath, [System.Text.Encoding]::UTF8)
    Check-Contains $text '^asyncapi:\s*3\.0' 'AsyncAPI scaffold must declare version 3.0.'
    Check-Contains $text '(?m)^info:\s*$' 'AsyncAPI scaffold missing info section.'
    Check-Contains $text '(?m)^channels:\s*$' 'AsyncAPI scaffold missing channels section.'
    Check-Contains $text '(?m)^operations:\s*$' 'AsyncAPI scaffold missing operations section.'
    Check-Contains $text '(?m)^components:\s*$' 'AsyncAPI scaffold missing components section.'
    Check-Refs $text 'AsyncAPI'
}

$result = [PSCustomObject]@{ ProjectRoot=$root; Errors=$errors.Count; Warnings=$warnings.Count; Valid=($errors.Count -eq 0); ErrorDetails=@($errors); WarningDetails=@($warnings) }
$result | ConvertTo-Json -Depth 5
if ($Strict -and $errors.Count -gt 0) { exit 1 }
