#!/usr/bin/env pwsh

param(
    [string]$InstallDir = 'C:\Setups'
)

$ErrorActionPreference = 'Stop'

$SopsPath = Join-Path $InstallDir 'sops.exe'

function Test-Sops {
    try {
        $version = & $SopsPath --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "SOPS already installed: $version"
            return $true
        }
    } catch {}
    return $false
}

# Ensure folder exists
if (-not (Test-Path $InstallDir)) {
    New-Item -ItemType Directory -Path $InstallDir | Out-Null
}

# Check existing
if (Test-Path $SopsPath) {
    if (Test-Sops) {
        return $SopsPath
    } else {
        Write-Warning "SOPS exists but not working. Reinstalling..."
        Remove-Item $SopsPath -Force
    }
}

Write-Host "Fetching latest SOPS release..."
$releaseApi = 'https://api.github.com/repos/getsops/sops/releases/latest'
$release = Invoke-RestMethod -Uri $releaseApi

$asset = $release.assets |
    Where-Object { $_.name -match '^sops-v[\d.]+\.amd64\.exe$' } |
    Select-Object -First 1

if (-not $asset) {
    throw "Cannot find Windows binary in release $($release.tag_name)"
}

Write-Host "Downloading SOPS $($release.tag_name)..."

Invoke-WebRequest `
    -Uri $asset.browser_download_url `
    -OutFile $SopsPath `
    -UseBasicParsing

if (-not (Test-Sops)) {
    throw "SOPS installation failed"
}

Write-Host "Installed at: $SopsPath"

# RETURN PATH (important)
return $SopsPath