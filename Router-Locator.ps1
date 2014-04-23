<#
|===============================================================>|
   Router Locator by APoorv Verma [AP] on 8/20/2013
|===============================================================>|
      $) Helps Locate a router
      $) Color Scheming
      $) Best works with weak cards! -LOL
      $) Adjusts to Window Size
      $) Draws a wifi Router
      $) Smart aware of space, and has space conserving algorithms
      $) Aware about changes in signals
      $) Supports q, and esc as quit signals
      $) Supports migrating routers forward backward and randomly
      $) Allows Key Press Controls:
            @)'+','Right' : Next Router
            @)'-','Left'  : Prev Router
            @)'*'         : Rand Router
            @)'ESC'       : Quit Locating
|===============================================================>|
#>
param($Router,[Alias("TC","Console","Log")][Switch]$ThroughConsole)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.0] To Make this program independent of AP-Core Engine
# ==================================================================================================================|
function KeyPressed {
param([Parameter(Mandatory=$True)][String[]]$Key, $Store="^^^")

    if ($Store -eq "^^^" -and $Host.UI.RawUI.KeyAvailable) {$Store = $Host.UI.RawUI.ReadKey("IncludeKeyUp,NoEcho")} else {if ($Store -eq "^^^") {return $False}}
    $Ans = $False
    $Key | % {
        $SOURCE = $_
        try {
            $Ans = $Ans -or (KeyPressedCode $SOURCE $Store)
        } catch {
            Foreach ($K in $SOURCE) {
                [String]$K = $K
                if ($K.length -gt 4 -and ($K[0,1,-1,-2] -join("")) -eq "~~~~") {
                    $Ans = $ANS -or (KeyPressedCode (KeyTranslate($K)) $Store)
                } else {
                    $Ans = $ANS -or ($K.chars(0) -in $Store.Character)
                }
            }
        }
    }
    return $Ans
}

function Align-Text {
param([Parameter(Mandatory=$True)][String[]]$Text, [ValidateSet("Center","Right","Left")][String]$Align='Center')

    if ($Text.count -gt 1) {
        $ans = @()
        foreach ($ln in $Text) {$Ans += Align-Text $ln $Align}
        return ($ans)
    } else {
        $WinSize = $(Get-Host).UI.RawUI.WindowSize.Width
        if ((""+$Text).Length -ge $WinSize) {
            $Appender = @("");
            $j = 0
            foreach ($p in 0..((""+$Text).Length-1)){
                if (($p+1)%$winsize -eq 0) {$j++;$Appender += ""}
#                ""+$j+" - "+$p
                $Appender[$j] += $Text.chars($p)
            }
            return (Align-Text $Appender $Align)
        } else {
            if ($Align -eq "Center") {
                return (" "*[math]::truncate(($WinSize-(""+$Text).Length)/2)+$Text)
            } elseif ($Align -eq "Right") {
                return (" "*($WinSize-(""+$Text).Length-1)+$Text)
            } else {
                return ($Text)
            }
        }
    }
}

function Write-AP {
param([Parameter(Mandatory=$True)][String]$Text)

    $acc  = @(('+','2'),('-','12'),('!','14'),('*','3'))
    $tb   = '';$func   = $false
    while ($Text.chars(0) -eq 'x') {$func = $true; $Text = $Text.substring(1).trim()}
    while ($Text.chars(0) -eq '>') {$tb += "    "; $Text = $Text.substring(1).trim()}
    $Sign = $Text.chars(0)
    $Text = $Text.substring(1).trim().replace('/x\','').replace('[.]','[Current Directory]')
    $vers = $false
    foreach ($ar in $acc) {if ($ar[0] -eq $sign) {$vers = $true; $clr = $ar[1]; $Sign = "[${Sign}] "}}
    if (!$vers) {Throw "Incorrect Sign [$Sign] Passed!"}
    if (!($Silent -and $Sign -eq '[*] ')) {if ($func)  {Write-Host -nonewline -f $clr $tb$Sign$Text} else {write-host -f $clr $tb$Sign$Text}}
}

# ========================================END=OF=COMPILER===========================================================|
function DrawWifi($Str=0,$WifiLn) {
    $lBar = "( "*($str)
    $rBar = " )"*($str)
    $sp = $(?:($(Get-Host).UI.RawUI.WindowSize.Width%2 -eq 1){""}{"|"})
#    ¦¦
    write-host -f 2 $("`n"*$WifiLn)`b$((Align-Text (
    "$lBar($(?:($(Get-Host).UI.RawUI.WindowSize.Width%2 -eq 1){"  "}{" o "}))$rBar",
    "/$sp\",
    "/ $sp \",
    "/  $sp  \",
    "/   $sp   \".replace(" ","_"))) -join ("`n"))
}
function RouterMove ([INT]$Type, $FromRouter) {
    Write-AP "!Moving to $(?:($Type -eq 0){"a Random"}{?:($Type -eq 1){"the Next"}{"the Previous"}}) Router. . ."
    $S = (Get-Networks).SSID | Sort
    If ($s -eq $Null) {
        Write-AP ">-No Other Routers Exist!";start-sleep -m 500
    } else {
        if ($type -eq 0) {$FromRouter = $S | ? {$_ -ne $FromRouter} | Get-Random} Else {
            $OP = -1
            $Reticle = ""
            foreach ($SSID in $S) {
                $OP++
                If ($FromRouter -eq $SSID) {
                    $OPn = ?: ($OP -eq 0) {$S.count-1}{$OP-1}
                    $OPp = ?: ($OP -eq ($S.count-1)) {0}{$OP+1}
                    $Reticle = $S[$OPn,$OP,$OPp]
                }
            }
            If ($type -eq 1) {$FromRouter = $Reticle[2]}
            If ($type -eq -1) {$FromRouter = $Reticle[0]}
        }
    }
    return $FromRouter
}
if (!$Router) {Write-AP "*Selecting Random Router . . .";$RTR = "<Get:Random>";$Router = (Get-Networks).SSID | Get-Random} else {
    $RTR = $Router
    Write-AP "*Detecting Router using Input . . ."
    if ($Router.getType().Name -eq "PSCustomObject") {$Router = $Router.SSID}
    try {$Router = ((Get-Networks) -imatch $Router)[0].SSID} catch {}
}
if (!$router) {Write-AP "-Router [$RTR] Does not exist in range!";exit}
Write-AP "+Router [$Router] found!"
$SignalGet = 101
$Stat = 101
$END = $null
Write-AP "*Loading Locator . . ."
while ($true) {
    $MSG = "Locating Router : [$Router]"
    $StatO = $Stat
    $SignalGetO = $SignalGet
    try {[INT]$SignalGet  = ((Get-Networks) -imatch $Router)[0].signal.trim('%')} catch [InvokeMethodOnNull] {Write-AP "-Signal Lost!";exit}
    If ($SignalGet -le 10) {$Col = ("Extremely Cold!","DarkBlue")}
    ElseIf ($SignalGet -le 30) {$Col = ("Very Cold!","Blue")}
    ElseIf ($SignalGet -le 50) {$Col = ("Cold!","cyan")}
    ElseIf ($SignalGet -le 70) {$Col = ("Warm!","Yellow")}
    ElseIf ($SignalGet -le 90) {$Col = ("Hot!","DarkYellow")}
    ElseIf ($SignalGet -le 95) {$Col = ("Very Hot!","red")}
    ElseIf ($SignalGet -le 98) {$Col = ("Extremly Hot!","darkred")}
    ElseIf ($SignalGet -le 100) {$Col = ("You Have Found [$Router]!","DarkGreen");$END = $True}
    if ($StatO -eq 101) {$Stat = ("Waiting","DarkYellow")}
    Elseif ($SignalGet -gt $SignalGetO) {$Stat = ("Getting Closer","02")}
    Elseif ($SignalGet -eq $SignalGetO) {$Stat = ("Static Signal","Gray")}
    Elseif ($SignalGet -lt $SignalGetO) {$Stat = ("Moving Away","darkcyan")}
    $WS = $(Get-Host).UI.RawUI.WindowSize
    $Len  = " "*(($WS.Width-$msg.length)/2-.51)
    $Len1 = " "*(($WS.Width-($Col[0].length+1+$Stat[0].length+1+2+2))/2-.51)
    $ENT  = "`n"*($WS.Height/2-1.51)
    if ($END){cls;Write-Host -f $Col[1] $ENT"`n"(Align-Text $Col[0]);exit}
    cls
    write-host -f DarkGray -NoNewLine $ENT$Len($MSG.split("[")[0])"`b[";write-host -f Yellow -NoNewLine $MSG.split("[")[1].trim("]");write-host -f DarkGray "]`n"
    write-host -f $Col[1] -NoNewLine $Len1($Col[0])
    write-host -f $Stat[1] " ["$Stat[0]"]"
    $Test = $WS.Height/2-2-6
    if ($Test -ge 0) {
        DrawWifi (?:($SignalGet -in 0..33){0}{?:($SignalGet -in 34..66){1}{?:($SignalGet -in 67..99){2}{3}}}) $Test
    }
    if ($Host.UI.RawUI.KeyAvailable) {$Store = $Host.UI.RawUI.ReadKey("IncludeKeyUp,NoEcho")}
    if (KeyPressed 'x','q',"~~ESCAPE~~" $Store) {Write-AP "!Quit Signal, exiting . . .";exit}
    if (KeyPressed 'p',"-","~~Left~~","~~Up~~" $Store) {$Router = RouterMove -1 $Router;$Stat = 101}
    if (KeyPressed 'r',"*" $Store) {$Router = RouterMove 0 $Router;$Stat = 101}
    if (KeyPressed 'n',"+","~~Right~~","~~Down~~" $Store) {$Router = RouterMove 1 $Router;$Stat = 101}
    $Store = $null
}
