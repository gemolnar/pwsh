
Write-Host "Hello, pwsh!"

# The original pwsh profile file can be found under {my-documents}\PowerShell\Microsoft.PowerShell_profile.ps1
# That file now does nothing but dot-sources this file.

oh-my-posh init pwsh --config "$env:USERPROFILE/src/pwsh/javelin.omp.json" | Invoke-Expression
$env:POSH_AZURE_ENABLED = $true

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

$PSStyle.FileInfo.Directory = "`e[36m"

Function gazc { Get-AzContext | Select-Object -Property Name,Subscription,Account | Format-List }
