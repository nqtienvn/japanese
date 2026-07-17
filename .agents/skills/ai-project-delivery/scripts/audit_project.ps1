[CmdletBinding()]
param(
    [string]$ProjectRoot = '.',
    [string]$OutputPath
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ProjectRoot).Path
$excludedPattern = '[\\/](\.git|node_modules|vendor|dist|build|target|coverage|\.next|bin|obj)([\\/]|$)'
$files = @(Get-ChildItem -LiteralPath $root -Recurse -File -Force -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -notmatch $excludedPattern })

$extensionSummary = @($files |
    Group-Object { if ([string]::IsNullOrWhiteSpace($_.Extension)) { '[none]' } else { $_.Extension.ToLowerInvariant() } } |
    Sort-Object Count -Descending |
    Select-Object -First 20 @{Name='Extension';Expression={$_.Name}}, Count)

$manifestNames = @(
    'package.json', 'pnpm-lock.yaml', 'yarn.lock', 'package-lock.json',
    'pom.xml', 'build.gradle', 'build.gradle.kts', 'requirements.txt',
    'pyproject.toml', 'Pipfile', 'go.mod', 'Cargo.toml', '*.sln', '*.csproj',
    'Dockerfile', 'docker-compose.yml', 'docker-compose.yaml', 'Makefile'
)
$manifests = @($files | Where-Object {
    $name = $_.Name
    foreach ($pattern in $manifestNames) {
        if ($name -like $pattern) { return $true }
    }
    return $false
} | ForEach-Object { $_.FullName.Substring($root.Length).TrimStart('\', '/') })

$testFiles = @($files | Where-Object {
    $_.Name -match '(?i)(test|spec)' -or $_.DirectoryName -match '(?i)[\\/](test|tests|spec|specs)([\\/]|$)'
})

$documentation = @($files | Where-Object {
    $_.Extension -in @('.md', '.rst', '.adoc', '.pdf', '.docx')
} | Select-Object -First 100 | ForEach-Object { $_.FullName.Substring($root.Length).TrimStart('\', '/') })

$git = [ordered]@{ Available = $false; Branch = $null; Status = @(); Head = $null }
if ((Get-Command git -ErrorAction SilentlyContinue) -and (Test-Path -LiteralPath (Join-Path $root '.git'))) {
    $inside = (& git -C $root rev-parse --is-inside-work-tree 2>$null)
    if ($LASTEXITCODE -eq 0 -and $inside -eq 'true') {
        $git.Available = $true
        $git.Branch = (& git -C $root branch --show-current 2>$null)
        $git.Head = (& git -C $root rev-parse --short HEAD 2>$null)
        $git.Status = @(& git -C $root status --short 2>$null)
    }
}

$result = [ordered]@{
    ProjectRoot = $root
    AuditedAt = (Get-Date).ToString('o')
    FileCountExcludingGenerated = $files.Count
    ExtensionSummary = $extensionSummary
    Manifests = $manifests
    DocumentationSample = $documentation
    TestFileCount = $testFiles.Count
    HasAgentInstructions = Test-Path -LiteralPath (Join-Path $root 'AGENTS.md')
    HasProjectState = Test-Path -LiteralPath (Join-Path $root 'PROJECT_STATE.md')
    Git = $git
    Warnings = @(
        'Inventory only: inspect manifests and repository instructions before running build or migration commands.',
        'File contents and secret values were not read by this script.'
    )
}

$json = $result | ConvertTo-Json -Depth 8
if ($OutputPath) {
    $resolvedOutput = [System.IO.Path]::GetFullPath((Join-Path $root $OutputPath))
    $outputParent = Split-Path -Parent $resolvedOutput
    if (-not (Test-Path -LiteralPath $outputParent)) {
        New-Item -ItemType Directory -Path $outputParent | Out-Null
    }
    [System.IO.File]::WriteAllText($resolvedOutput, $json, [System.Text.UTF8Encoding]::new($false))
    Write-Output $resolvedOutput
} else {
    Write-Output $json
}
