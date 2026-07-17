[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$ProjectName,

    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[A-Za-z0-9_-]+$')]
    [string]$ProjectCode,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$Destination,

    [string]$ProjectOwner = 'TBD',

    [ValidateSet('Greenfield', 'Brownfield')]
    [string]$Mode = 'Greenfield'
)

$ErrorActionPreference = 'Stop'
$skillRoot = Split-Path -Parent $PSScriptRoot
$templateRoot = (Resolve-Path -LiteralPath (Join-Path $skillRoot '..\..\..')).Path
$destinationPath = [System.IO.Path]::GetFullPath($Destination)

if ($destinationPath.StartsWith($templateRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Destination must not be inside the template: $templateRoot"
}

if (Test-Path -LiteralPath $destinationPath) {
    $existingItems = @(Get-ChildItem -LiteralPath $destinationPath -Force -ErrorAction Stop)
    if ($Mode -eq 'Greenfield' -and $existingItems.Count -gt 0) {
        throw "Greenfield destination must be empty: $destinationPath"
    }
} else {
    New-Item -ItemType Directory -Path $destinationPath | Out-Null
}

$copiedFiles = [System.Collections.Generic.List[string]]::new()
$skippedFiles = [System.Collections.Generic.List[string]]::new()
$agentInstructionsNeedMerge = $false

Get-ChildItem -LiteralPath $templateRoot -Recurse -Force | ForEach-Object {
    $relative = $_.FullName.Substring($templateRoot.Length).TrimStart('\', '/')
    $target = Join-Path $destinationPath $relative

    if ($_.PSIsContainer) {
        if (-not (Test-Path -LiteralPath $target)) {
            New-Item -ItemType Directory -Path $target | Out-Null
        }
        return
    }

    $targetParent = Split-Path -Parent $target
    if (-not (Test-Path -LiteralPath $targetParent)) {
        New-Item -ItemType Directory -Path $targetParent | Out-Null
    }

    if (Test-Path -LiteralPath $target) {
        if ($Mode -eq 'Brownfield' -and $relative -eq 'AGENTS.md') {
            $companionTarget = Join-Path $destinationPath 'AGENTS.ai-project-delivery.md'
            if (-not (Test-Path -LiteralPath $companionTarget)) {
                Copy-Item -LiteralPath $_.FullName -Destination $companionTarget
                $copiedFiles.Add($companionTarget)
            }
            $agentInstructionsNeedMerge = $true
        }
        $skippedFiles.Add($target)
    } else {
        Copy-Item -LiteralPath $_.FullName -Destination $target
        $copiedFiles.Add($target)
    }
}

$replacements = [ordered]@{
    '{{PROJECT_NAME}}' = $ProjectName
    '{{PROJECT_CODE}}' = $ProjectCode.ToUpperInvariant()
    '{{PROJECT_OWNER}}' = $ProjectOwner
    '{{DATE}}' = (Get-Date -Format 'yyyy-MM-dd')
}

$textExtensions = @('.md', '.txt', '.example', '.yaml', '.yml', '.json')
foreach ($file in $copiedFiles) {
    if ([System.IO.Path]::GetExtension($file) -notin $textExtensions) {
        continue
    }
    $content = [System.IO.File]::ReadAllText($file)
    foreach ($entry in $replacements.GetEnumerator()) {
        $content = $content.Replace($entry.Key, $entry.Value)
    }
    [System.IO.File]::WriteAllText($file, $content, [System.Text.UTF8Encoding]::new($false))
}

[PSCustomObject]@{
    Project = $ProjectName
    Code = $ProjectCode.ToUpperInvariant()
    Mode = $Mode
    Destination = $destinationPath
    CopiedFiles = $copiedFiles.Count
    SkippedExistingFiles = $skippedFiles.Count
    AgentInstructionsNeedMerge = $agentInstructionsNeedMerge
    NextPrompt = if ($agentInstructionsNeedMerge) {
        'Review AGENTS.ai-project-delivery.md, merge compatible rules into AGENTS.md, then read and execute MASTER_PROMPT.md with PROJECT_MODE = BROWNFIELD.'
    } else {
        'Read and execute MASTER_PROMPT.md with PROJECT_MODE = GREENFIELD, BROWNFIELD, CHANGE, or AUTO as appropriate.'
    }
} | Format-List
