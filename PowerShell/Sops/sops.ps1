#!/usr/bin/env pwsh

param(
    [Parameter(Mandatory)]
    [ValidateSet('encrypt', 'decrypt')]
    [string]$Action,

    [switch]$RunInPipeline,

    # NEW: input file
    [string]$InputFile,

    # NEW: output file
    [string]$OutputFile
)

$ErrorActionPreference = 'Stop'

# Use pipeline sops or local
if ($RunInPipeline) {
    $SopsExe = 'C:\tools\sops.exe'
} else {
    $SopsExe = & "$PSScriptRoot\install-sops.ps1"
}

$AzureKvKey = 'https://mykeyvault.vault.azure.net/keys/sops'

# =========================
# MODE 1: Custom file input
# =========================
if ($InputFile) {

    if (-not (Test-Path $InputFile)) {
        throw "Input file not found: $InputFile"
    }

    # Auto-generate output if not provided
    if (-not $OutputFile) {
        if ($Action -eq 'encrypt') {
            $OutputFile = "$InputFile.enc"
        } else {
            $OutputFile = $InputFile -replace '\.enc', ''
        }
    }

    Write-Host "$Action file:"
    Write-Host "  Input : $InputFile"
    Write-Host "  Output: $OutputFile"

    if ($Action -eq 'encrypt') {
        & $SopsExe encrypt --azure-kv $AzureKvKey $InputFile |
            Set-Content $OutputFile -Encoding UTF8
    }
    else {
        & $SopsExe decrypt $InputFile |
            Set-Content $OutputFile -Encoding UTF8
    }

    Write-Host "Done."
    return
}

# =========================
# MODE 2: Original batch mode
# =========================

$KeyvaultDir = Join-Path $PSScriptRoot 'keyvault'

$Files = @(
    'keyvault - kv-aks-weu-dev' 
)

foreach ($name in $Files) {
    $plain = Join-Path $KeyvaultDir "$name.json"
    $enc   = Join-Path $KeyvaultDir "$name.enc.json"

    switch ($Action) {
        'encrypt' {
            if (-not (Test-Path $plain)) {
                Write-Warning "SKIP: $plain not found"
                continue
            }

            Write-Host "Encrypting: $plain"
            & $SopsExe encrypt --azure-kv $AzureKvKey $plain |
                Set-Content $enc -Encoding utf8NoBOM
        }

        'decrypt' {
            if (-not (Test-Path $enc)) {
                Write-Warning "SKIP: $enc not found"
                continue
            }

            Write-Host "Decrypting: $enc"
            & $SopsExe decrypt $enc |
                Set-Content $plain -Encoding utf8NoBOM
        }
    }
}

Write-Host "Done (batch mode)."