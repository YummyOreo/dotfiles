oh-my-posh.exe init pwsh --config "PATH\star.omp.json" | Invoke-Expression
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

$SHELL_HISTORY=(Get-PSReadlineOption).HistorySavePath
Set-Alias -Name vim -Value nvim
Set-Alias -Name touch -Value New-Item
Set-Alias -Name spotify -Value spt
function where_command($value) {
	(Get-Command $value).path
}

function gd {
    git diff
}

function exa {
    wsl exa
}
function exal {
    wsl exa --long --all
}
function xplr {
    wsl xplr
}

function ati_full($path) {
    ascii-image-converter -C --color-bg --complex --full $path
}

function ati($path) {
    ascii-image-converter -C --color-bg --complex $path
}

function play($path) {
    mplayer $path
}

function chrome($path) {
    docker run -ti fathyb/carbonyl $path
}

Set-Alias -Name ls -Value exa -Option AllScope -Scope Global -Force
Set-Alias -Name ll -Value exal -Option AllScope -Scope Global -Force
Set-Alias -Name grep -Value rg -Option AllScope -Scope Global -Force

# ZOXIDE STUFF TOKEN OUT
#
# To initialize zoxide, add this to your configuration (find it by running
# `echo $profile` in PowerShell):
#
# Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --hook $hook | Out-String) })

if ('' + (Get-Location) + '' -eq 'C:\Windows\System32') {
	cd 'Desktop 2'
}
if ('' + (Get-Location) + '' -eq 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Alacritty') {
	cd 'Desktop 2'
}
if ('' + (Get-Location) + '' -eq 'C:\Program Files\Rainmeter') {
	cd 'Desktop 2'
}

clear
