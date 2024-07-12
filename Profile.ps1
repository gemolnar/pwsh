#
# The original pwsh profile file can be found under {my-documents}\PowerShell\Microsoft.PowerShell_profile.ps1
# That file now does nothing but dot-sources this file.
#

Write-Host "Initializing oh-my-posh..."
oh-my-posh init pwsh --config "$env:USERPROFILE/src/pwsh/javelin.omp.json" | Invoke-Expression
$env:POSH_AZURE_ENABLED = $true

Write-Host "Importing module Az.Tools.Predictor..."
Import-Module Az.Tools.Predictor

Write-Host "Importing module CompletionPredictor..."
Import-Module CompletionPredictor

Write-Host "Setting PSReadLineOptions..."
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
#Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

$PSStyle.FileInfo.Directory = "`e[36m"

Write-Host "Importing module posh-git..."
Import-Module posh-git

function gazc {
	Get-AzContext | Select-Object -Property Name,Subscription,Account | Format-List
}
