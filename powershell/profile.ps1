oh-my-posh.exe init pwsh --config "Your Path\takuya.omp.json" | Invoke-Expression
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

# Set-Alias -Name opacity -Value "D:\\Python\\python.exe" 'C:\\Users\\OreoD\\AppData\\Roaming\\alacritty\\change_o.py'
function ocacity($value) {
	python 'C:\\Users\\OreoD\\AppData\\Roaming\\alacritty\\change_o.py' $value
}
# Set-Alias -Name cat -Value Get-Content

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on zoxide's format.
function __zoxide_pwd {
    $cwd = Get-Location
    if ($cwd.Provider.Name -eq "FileSystem") {
        $cwd.ProviderPath
    }
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd($dir, $literal) {
    $dir = if ($literal) {
        Set-Location -LiteralPath $dir -Passthru -ErrorAction Stop
    } else {
        Set-Location -Path $dir -Passthru -ErrorAction Stop
    }
}

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on zoxide's format.
function __zoxide_pwd {
    $cwd = Get-Location
    if ($cwd.Provider.Name -eq "FileSystem") {
        $cwd.ProviderPath
    }
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd($dir, $literal) {
    $dir = if ($literal) {
        Set-Location -LiteralPath $dir -Passthru -ErrorAction Stop
    } else {
        Set-Location -Path $dir -Passthru -ErrorAction Stop
    }
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook {
    $result = __zoxide_pwd
    if ($null -ne $result) {
        zoxide add -- $result
    }
}

# Initialize hook.

$__zoxide_hooked = (Get-Variable __zoxide_hooked -ValueOnly -ErrorAction SilentlyContinue)
if ($__zoxide_hooked -ne 1) {
    $__zoxide_hooked = 1
    $prompt_old = $function:prompt
    function prompt {
        $null = __zoxide_hook
        & $prompt_old
    }
}

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

# Jump to a directory using only keywords.
function __zoxide_z {
    if ($args.Length -eq 0) {
        __zoxide_cd ~ $true
    }
    elseif (
        $args.Length -eq 1 -and
        (($args[0] -eq '-' -or $args[0] -eq '+') -or (Test-Path $args[0] -PathType Container))
    ) {
        __zoxide_cd $args[0] $false
    }
    else {
        $result = __zoxide_pwd
        if ($null -ne $result) {
            $result = zoxide query --exclude $result -- @args
        }
        else {
            $result = zoxide query -- @args
        }
        if ($LASTEXITCODE -eq 0) {
            __zoxide_cd $result $true
        }
    }
}

# Jump to a directory using interactive search.
function __zoxide_zi {
    $result = zoxide query -i -- @args
    if ($LASTEXITCODE -eq 0) {
        __zoxide_cd $result $true
    }
}

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

Set-Alias -Name cd -Value __zoxide_z -Option AllScope -Scope Global -Force
Set-Alias -Name cdi -Value __zoxide_zi -Option AllScope -Scope Global -Force

# =============================================================================
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
