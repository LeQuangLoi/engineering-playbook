# SOPS Secret Management

SOPS helpers for encrypting and decrypting JSON configuration with an Azure Key Vault key.

## Prerequisites

- PowerShell 7 or later.
- Access to the configured Azure Key Vault key.
- SOPS installed with [InstallSops.ps1](InstallSops.ps1).

## Usage

Provide the Azure Key Vault key through a parameter or the `SOPS_AZURE_KEY` environment variable:

```powershell
$env:SOPS_AZURE_KEY = 'https://<key-vault-name>.vault.azure.net/keys/<key-name>'
./sops.ps1 -Action encrypt -InputFile secret.json
./sops.ps1 -Action decrypt -InputFile secret.json.enc
```

The script can also process the configured batch file under `keyvault/`. Never commit plaintext secrets or decrypted output.

## Files

- [InstallSops.ps1](InstallSops.ps1): Downloads and validates the SOPS executable.
- [sops.ps1](sops.ps1): Encrypts or decrypts individual files and configured batch files.
