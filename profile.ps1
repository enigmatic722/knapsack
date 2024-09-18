$sticky = Get-Process Microsoft.Notes -ErrorAction SilentlyContinue
if ($sticky) {
    Stop-Process -name Microsoft.Notes
}
Remove-Variable sticky

# Vi-Mode
Set-PSReadlineOption -EditMode vi
Write-Host -NoNewLine "`e[5 q"

function setViCommandMode{
    [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
}

function OnViModeChange {
    if ($args[0] -eq 'Command') {
        Write-Host -NoNewLine "`e[1 q"
    } else {
        Write-Host -NoNewLine "`e[5 q"
    }
}

Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange

Set-PSReadLineKeyHandler -Key 'v' -Function CaptureScreen -ViMode Command
Set-PSReadLineKeyHandler -Key 'V' -Function SelectAll -ViMode Command

Set-PSReadlineKeyHandler -Chord Ctrl+Oem4 -Function ViCommandMode
Set-PSReadlineKeyHandler -Chord alt+l -Function ViCommandMode
# Get-PSReadLineKeyHandler -Bound -Unbound
# Set-PSReadLineKeyHandler -Key 'ctrl+[' -Function ViCommandMode -ViMode Insert

Set-PSReadLineKeyHandler -Key 'shift+end' -Function SelectLine -ViMode Command
Set-PSReadLineKeyHandler -Key 'shift+end' -Function SelectLine -ViMode Insert

Set-PSReadLineKeyHandler -Key 'shift+home' -Function SelectBackwardsLine -ViMode Command
Set-PSReadLineKeyHandler -Key 'shift+home' -Function SelectBackwardsLine -ViMode Insert

Set-PSReadLineKeyHandler -Key 'ctrl+n' -Function NextHistory -ViMode Insert
Set-PSReadLineKeyHandler -Key 'ctrl+p' -Function PreviousHistory -ViMode Insert

Set-PSReadLineKeyHandler -Key 'ctrl+n' -Function NextHistory -ViMode Command
Set-PSReadLineKeyHandler -Key 'ctrl+p' -Function PreviousHistory -ViMode Command

Set-PSReadLineKeyHandler -Key 'ctrl+shift+leftArrow' -Function SelectBackwardWord -ViMode Command
Set-PSReadLineKeyHandler -Key 'ctrl+shift+leftArrow' -Function SelectBackwardWord -ViMode Insert

Set-PSReadLineKeyHandler -Key 'ctrl+shift+rightArrow' -Function SelectForwardWord -ViMode Command
Set-PSReadLineKeyHandler -Key 'ctrl+shift+rightArrow' -Function SelectForwardWord -ViMode Insert

Set-PSReadLineKeyHandler -Key 'shift+rightArrow' -Function SelectForwardChar -ViMode Command
Set-PSReadLineKeyHandler -Key 'shift+rightArrow' -Function SelectForwardChar -ViMode Insert

Set-PSReadLineKeyHandler -Key 'shift+leftArrow' -Function SelectBackwardChar -ViMode Command
Set-PSReadLineKeyHandler -Key 'shift+leftArrow' -Function SelectBackwardChar -ViMode Insert

Set-PSReadLineKeyHandler -Key 'd,m' -Function ViDeleteBrace -ViMode Command

Set-PSReadLineKeyHandler -Key 'ctrl+m' -Function GotoBrace -ViMode Command
Set-PSReadLineKeyHandler -Key 'ctrl+m' -Function ViGotoBrace -ViMode Insert

Set-PSReadLineKeyHandler -Key 'z' -Function ClearScreen -ViMode Command

Set-PSReadLineKeyHandler -Key "'" -Function RepeatLastCharSearchBackwards -ViMode Command
Set-PSReadLineKeyHandler -Key 'ctrl+w' -Function BackwardDeleteWord -ViMode Insert
Remove-PSReadLineKeyHandler -Key 'ctrl+w' -ViMode Command

Set-PSReadLineKeyHandler -Key 'y' -Function Copy -ViMode Command
Set-PSReadLineKeyHandler -Chord 'Y' -ViMode Command -ScriptBlock {
	[Microsoft.PowerShell.PSConsoleReadLine]::SelectLine()
	[Microsoft.PowerShell.PSConsoleReadLine]::Copy()
}
Set-PSReadLineKeyHandler -Chord 'y,e' -ViMode Command -ScriptBlock {
	[Microsoft.PowerShell.PSConsoleReadLine]::SelectForwardWord()
	[Microsoft.PowerShell.PSConsoleReadLine]::Copy()
	[Microsoft.PowerShell.PSConsoleReadLine]::ViBackwardWord()
}
Set-PSReadLineKeyHandler -Chord 'y,y' -ViMode Command -ScriptBlock {
	[Microsoft.PowerShell.PSConsoleReadLine]::SelectAll()
	[Microsoft.PowerShell.PSConsoleReadLine]::Copy()
}
Set-PSReadLineKeyHandler -Key 'P' -Function Paste -ViMode Command
Set-PSReadLineKeyHandler -Chord 'p' -ViMode Command -ScriptBlock {
	[Microsoft.PowerShell.PSConsoleReadLine]::ViInsertWithAppend()
	[Microsoft.PowerShell.PSConsoleReadLine]::Paste()
    [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
}
Set-PSReadLineKeyHandler -Chord 'g,p' -ViMode Command -ScriptBlock {
	[Microsoft.PowerShell.PSConsoleReadLine]::ViInsertMode()
	[Microsoft.PowerShell.PSConsoleReadLine]::SelectForwardWord()
	[Microsoft.PowerShell.PSConsoleReadLine]::Paste()
    [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
}
Set-PSReadLineKeyHandler -Key 'ctrl+x' -Function Cut -ViMode Insert
Set-PSReadLineKeyHandler -Key 'ctrl+r' -Function Redo -ViMode Command

function vihelp {
	 Get-PSReadLineKeyHandler -Bound -Unbound
}

################

Import-Module oh-my-posh
Import-Module posh-git
Import-Module Terminal-Icons

Set-PoshPrompt -Theme slim

Set-Alias grep select-string
Set-Alias k kubectl
Set-Alias v nvim
Set-Alias n notepad++
Set-Alias vs code
Set-Alias e eclipse
Set-Alias py ipython
Set-Alias i idea64
Set-Alias envad SystemPropertiesAdvanced
Set-Alias ch 'C:\Program Files\Google\Chrome\Application\chrome.exe'

##var##
$nvimdir = "~\AppData\Local\nvim"
$dd = "d:/"

# Set-Alias -name ll -value "Get-ChildItem;(Get-ChildItem|Measure-Object).Count"
function ll {
    $files = Get-ChildItem $args[0]
    $files
    Write-Host "total: $(($files|Measure-Object).Count)"
}

function touch {set-content -Path ($args[0]) -Value ($null)}

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# Autocompletion for arrow keys
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadlineOption -BellStyle None

## tool
function psupdate {
	winget install --id Microsoft.Powershell --source winget
}

function env {
  rundll32 sysdm.cpl,EditEnvironmentVariables
}

function countf {
     (Get-ChildItem -File -recurse | Measure-Object).Count
}

function countd {
     (Get-ChildItem -Directory | Measure-Object).Count
}

function re {
    @(
        $Profile.AllUsersAllHosts,
        $Profile.AllUsersCurrentHost,
        $Profile.CurrentUserAllHosts,
        $Profile.CurrentUserCurrentHost
    ) | % {
        if(Test-Path $_){
            Write-Verbose "Running $_"
            . $_
        }
    }    
}

function which ($command) {
   Get-Command -Name $command -ErrorAction SilentlyContinue |
            Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function pwd {
	(pwd).path
}

function find([System.Object]$arg0) {
	Get-ChildItem -Path . -Filter $arg0 -Recurse -Name
}

function grepl { # findby
    $txt = $args[0]
    $file = $args[1]
	Get-ChildItem -Path . -Filter $file -Recurse | Select-String $txt -List | Select Path
}


function als {
    nvim $HOME\Documents\PowerShell\profile.ps1
}

function p {
  appwiz.cpl
}

function hosts {
  v C:/Windows/System32/drivers/etc/hosts
}

function nvdir {
	cd ~\AppData\Local\nvim\
}

function nvrc {
    nvim $HOME\AppData\Local\nvim\init.vim
}

function nvcl {
	rm ~\AppData\Local\nvim-data\shada\ -r -fo
}

## ahk
function cdahk {
    cd D:\autohotkey
}
function ahk {
    v 'D:\autohotkey\vim.ahk'
}
function ahkm {
    v 'D:\autohotkey\modal.ahk'
}
function ahkc {
	v 'D:\autohotkey\capslock_mac.ahk'
}

function vset {
	v ~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
}

## cp path
function cpd {
	$d = (pwd).path 
    $d.replace("\","/") | Set-Clipboard
}

function cpdw {
	$d = (pwd).path 
    $d | Set-Clipboard
}

function cpdu {
	$d = (pwd).path
    $tail = $d.replace("\","/").replace(":","").substring(1)
    $head = $d.substring(0,1)
    if($head -eq "D") {
        $dir = "/mnt/d$tail"
    } else {
        $dir = "/mnt/c$tail"
    }
    $dir | Set-Clipboard
}


function cpf {
    Get-ChildItem -Path "$args" | %{($_.Fullname).Replace("\","/")} | Set-Clipboard
}

function cpfw {
    Get-ChildItem -Path "$args" | %{$_.Fullname} | Set-Clipboard
}

function cpn {
    (Get-Item $args).Name | Set-Clipboard
}


## cd path
$dl = "~\Downloads\"
function dl {
	ii ~\Downloads\
}

function cddl {
	cd ~\Downloads\
}

$d = "~/Desktop"
function d {
    ii ~/Desktop
}

function dd {
    ii d:\
}
function c {
	ii C:\
}

function rmCpToBk {
    $disk = (get-location).Drive.Name
    $time = (Get-Date).ToString("yyyyMMddHHmmss")

    $files = Get-Item $args[0]
    
    foreach($src in $files) {
        $basename = $src.Basename
        $ext = $src.Extension

        $target = "$basename.$time$ext"
        
        if(!$ext -and !($src -is [System.IO.DirectoryInfo])) {
            $target = ".$time.$basename"
        }
        
        move-item $src "$disk`:/`_recycle/$target" -force
    }
    ll
}

Set-Alias -Name rm -Value rmCpToBk -Option AllScope -Force

function cdrec {
    cd "c:/_recycle"
}

function cdred {
    cd "d:/_recycle"
}

function lt {
    gci $args[0] | sort LastWriteTime
}

function cdl {
    pushd $args[0];ll; (pwd).path | export-clixml -path D:\dir.xml
}
Set-Alias -Name cd -Value cdl  -Option AllScope -Force
#Set-Alias cd cdl -Option AllScope  -force

function mvll {
    $tgrtdir = Split-Path $args[1] -Parent
    Move-Item $args[0] $args[1] && ll #&& ll $args[1]
}
Set-Alias -Name mv -Value mvll  -Option AllScope -Force

function mvfll {
    $tgrtdir = Split-Path $args[1] -Parent
    Move-Item $args[0] $args[1] -force && ll && lt $args[1]
}
Set-Alias -Name mvf -Value mvfll  -Option AllScope -Force

function cpll {
    Copy-Item $args[0] $args[1] -Recurse
    ll
}
Set-Alias -Name cp -Value cpll  -Option AllScope -Force


function mkdirNcd {
    $dir = $args[0]
    New-Item -Path "$dir" -ItemType Directory ; cd $args[0]
}

Set-Alias -Name mkdir -Value mkdirNcd -Option AllScope -Force

function uz {
    $file = $args[0]
    $dir = $args[1]
    
    unzip $file -d $dir ; cd $dir
}

function unzip {
  $src = $args[0]
  $trgt = $args[1]

  Expand-Archive -Path $src -DestinationPath $trgt
}

function mklnk {
	$lnk = $args[0]
	$trgt = $args[1]
	New-Item -ItemType SymbolicLink  -Path $lnk  -Target "$trgt"
}

## Git
function ga {
	git add $args
}

function gcmsg {
	git commit -m $args
}

function gco {
	git checkout $args
}

function gst {
	git status	
}

function g {
	git log --all --decorate --oneline --graph
}

function ad {
	Start-Process -Verb RunAs pwsh -ArgumentList "-WindowStyle Maximized"
}

function fmt {
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [object[]]$text
    )
    process {
        Format-Table -AutoSize -Wrap $text
    }
}

## cd
function u {
    wsl --cd "~"
}

function cdd {
    cd ~/Desktop
}

function cddd {
    cd d:/
}

function cdc {
    cd c:/
}

function cdp {
    cd ~\Documents\PowerShell\
}

function cdln($target)
{
    if($target.EndsWith(".lnk"))
    {
        $sh = new-object -com wscript.shell
        $fullpath = resolve-path $target
        $targetpath = $sh.CreateShortcut($fullpath).TargetPath
        set-location $targetpath
    }
    else {
        set-location $target
    }
}

##################
# Variables
## Profile Path
$scriptFolder = Split-Path -Parent $MyInvocation.MyCommand.Path
$global:DefaultUser = [System.Environment]::UserName
$env:POSH_SESSION_DEFAULT_USER = [System.Environment]::UserName


function size {
    gci -force "$args" -ErrorAction SilentlyContinue | ? { $_ -is [io.directoryinfo] } | % {
        $len = 0
        gci -recurse -force $_.fullname -ErrorAction SilentlyContinue | % { $len += $_.length }
        # echo $len
        if($len -gt 10Mb) {
            $_.fullname, "`t`t`{0:N2} GB" -f ($len / 1Gb)
        }
    } 
}

function Enable-AutoHideTaskBar {
    #This will configure the Windows taskbar to auto-hide
    [cmdletbinding(SupportsShouldProcess)]
    [Alias("Hide-TaskBar")]
    [OutputType("None")]
    Param()

    Begin {
        Write-Verbose "[$((Get-Date).TimeofDay) BEGIN  ] Starting $($myinvocation.mycommand)"
        $RegPath = 'HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3'
    } #begin
    Process {
        if (Test-Path $regpath) {
            Write-Verbose "[$((Get-Date).TimeofDay) PROCESS] Auto Hiding Windows 10 TaskBar"
            $RegValues = (Get-ItemProperty -Path $RegPath).Settings
            $RegValues[8] = 3

            Set-ItemProperty -Path $RegPath -Name Settings -Value $RegValues

            if ($PSCmdlet.ShouldProcess("Explorer", "Restart")) {
                #Kill the Explorer process to force the change
                Stop-Process -Name explorer -Force
            }
        }
        else {
            Write-Warning "Can't find registry location $regpath."
        }
    } #process
    End {
        Write-Verbose "[$((Get-Date).TimeofDay) END    ] Ending $($myinvocation.mycommand)"
    } #end

}

Function Disable-AutoHideTaskBar {
    #This will disable the Windows taskbar auto-hide setting
    [cmdletbinding(SupportsShouldProcess)]
    [Alias("Show-TaskBar")]
    [OutputType("None")]
    Param()

    Begin {
        Write-Verbose "[$((Get-Date).TimeofDay) BEGIN  ] Starting $($myinvocation.mycommand)"
        $RegPath = 'HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3'
    } #begin
    Process {
        if (Test-Path $regpath) {
            Write-Verbose "[$((Get-Date).TimeofDay) PROCESS] Auto Hiding Windows 10 TaskBar"
            $RegValues = (Get-ItemProperty -Path $RegPath).Settings
            $RegValues[8] = 2

            Set-ItemProperty -Path $RegPath -Name Settings -Value $RegValues

            if ($PSCmdlet.ShouldProcess("Explorer", "Restart")) {
                #Kill the Explorer process to force the change
                Stop-Process -Name explorer -Force
            }
        }
        else {
            Write-Warning "Can't find registry location $regpath."
        }
    } #process
    End {
        Write-Verbose "[$((Get-Date).TimeofDay) END    ] Ending $($myinvocation.mycommand)"
    } #end

}


. ~\Documents\PowerShell\dir.ps1
. ~\Documents\PowerShell\tool.ps1
. ~\Documents\PowerShell\docker.ps1
. ~\Documents\PowerShell\mvn.ps1

if(test-path "D:\dir.xml") {
    $dir = import-clixml -Path D:\dir.xml
    Set-Location -path $dir
}

## lang 
function initpy {
    ipython profile create 
    ipython locate profile
}

<#
function Invoke-Greeting {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]$Name
    )
    process {
        Write-Output "Hello $Name!"
    }
}
#>


## Set Environment Var
#  set-content env:RAVEDUDE_PORT 'COM4'

### Useful Command ###
#wt -w 0 -d .
