To run the script please use command such as:
./sops.ps1 -Action encrypt -InputFile secret.json

C:\Setups\sops.exe --set '["SendGridApiKey"] "mykey"' "./keyvault/keyvault - kv-aks-weu-uat.enc.json"

(C:\Setups\sops.exe -d ".//keyvault/keyvault - kv-aks-weu-uat.enc.json" | ConvertFrom-Json).SendGridApiKey