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
            @)'ESC','x'   : Quit Locating
|===============================================================>|
#>
param($Router,[Alias("TC","Console","Log")][Switch]$ThroughConsole)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.0] To Make this program independent of AP-Core Engine
# ==================================================================================================================|
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkgewpwYXJhbShbYm9vbF0kZGVjaWRlciwgW3NjcmlwdGJsb2NrXSRpZnRydWUsIFtzY3JpcHRibG9ja10kaWZmYWxzZSkNCg0KICAgIGlmICgkZGVjaWRlcikgeyAmJGlmdHJ1ZX0gZWxzZSB7ICYkaWZmYWxzZSB9DQp9CgpmdW5jdGlvbiBLZXlQcmVzc2VkIHsKcGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kS2V5LCAkU3RvcmU9Il5eXiIpDQoNCiAgICBpZiAoJFN0b3JlIC1lcSAiXl5eIiAtYW5kICRIb3N0LlVJLlJhd1VJLktleUF2YWlsYWJsZSkgeyRTdG9yZSA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIkluY2x1ZGVLZXlVcCxOb0VjaG8iKX0gZWxzZSB7aWYgKCRTdG9yZSAtZXEgIl5eXiIpIHtyZXR1cm4gJEZhbHNlfX0NCiAgICAkQW5zID0gJEZhbHNlDQogICAgJEtleSB8ICUgew0KICAgICAgICAkU09VUkNFID0gJF8NCiAgICAgICAgdHJ5IHsNCiAgICAgICAgICAgICRBbnMgPSAkQW5zIC1vciAoS2V5UHJlc3NlZENvZGUgJFNPVVJDRSAkU3RvcmUpDQogICAgICAgIH0gY2F0Y2ggew0KICAgICAgICAgICAgRm9yZWFjaCAoJEsgaW4gJFNPVVJDRSkgew0KICAgICAgICAgICAgICAgIFtTdHJpbmddJEsgPSAkSw0KICAgICAgICAgICAgICAgIGlmICgkSy5sZW5ndGggLWd0IDQgLWFuZCAoJEtbMCwxLC0xLC0yXSAtam9pbigiIikpIC1lcSAifn5+fiIpIHsNCiAgICAgICAgICAgICAgICAgICAgJEFucyA9ICRBTlMgLW9yIChLZXlQcmVzc2VkQ29kZSAoS2V5VHJhbnNsYXRlKCRLKSkgJFN0b3JlKQ0KICAgICAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgICAgICAgICRBbnMgPSAkQU5TIC1vciAoJEsuY2hhcnMoMCkgLWluICRTdG9yZS5DaGFyYWN0ZXIpDQogICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KICAgIHJldHVybiAkQW5zDQp9CgpmdW5jdGlvbiBBbGlnbi1UZXh0IHsKcGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJykNCg0KICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAkYW5zID0gQCgpDQogICAgICAgIGZvcmVhY2ggKCRsbiBpbiAkVGV4dCkgeyRBbnMgKz0gQWxpZ24tVGV4dCAkbG4gJEFsaWdufQ0KICAgICAgICByZXR1cm4gKCRhbnMpDQogICAgfSBlbHNlIHsNCiAgICAgICAgJFdpblNpemUgPSAkKEdldC1Ib3N0KS5VSS5SYXdVSS5XaW5kb3dTaXplLldpZHRoDQogICAgICAgIGlmICgoIiIrJFRleHQpLkxlbmd0aCAtZ2UgJFdpblNpemUpIHsNCiAgICAgICAgICAgICRBcHBlbmRlciA9IEAoIiIpOw0KICAgICAgICAgICAgJGogPSAwDQogICAgICAgICAgICBmb3JlYWNoICgkcCBpbiAwLi4oKCIiKyRUZXh0KS5MZW5ndGgtMSkpew0KICAgICAgICAgICAgICAgIGlmICgoJHArMSklJHdpbnNpemUgLWVxIDApIHskaisrOyRBcHBlbmRlciArPSAiIn0NCiMgICAgICAgICAgICAgICAgIiIrJGorIiAtICIrJHANCiAgICAgICAgICAgICAgICAkQXBwZW5kZXJbJGpdICs9ICRUZXh0LmNoYXJzKCRwKQ0KICAgICAgICAgICAgfQ0KICAgICAgICAgICAgcmV0dXJuIChBbGlnbi1UZXh0ICRBcHBlbmRlciAkQWxpZ24pDQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBpZiAoJEFsaWduIC1lcSAiQ2VudGVyIikgew0KICAgICAgICAgICAgICAgIHJldHVybiAoIiAiKlttYXRoXTo6dHJ1bmNhdGUoKCRXaW5TaXplLSgiIiskVGV4dCkuTGVuZ3RoKS8yKSskVGV4dCkNCiAgICAgICAgICAgIH0gZWxzZWlmICgkQWxpZ24gLWVxICJSaWdodCIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIiooJFdpblNpemUtKCIiKyRUZXh0KS5MZW5ndGgtMSkrJFRleHQpDQogICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgIHJldHVybiAoJFRleHQpDQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQp9CgpmdW5jdGlvbiBXcml0ZS1BUCB7CnBhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRUZXh0KQ0KDQogICAgaWYgKCEkdGV4dCAtb3IgJHRleHQgLW1hdGNoICJeW1wrXC1cIVwqeFw+IF0rJCIpIHtyZXR1cm59DQogICAgJGFjYyAgPSBAKCgnKycsJzInKSwoJy0nLCcxMicpLCgnIScsJzE0JyksKCcqJywnMycpKQ0KICAgICR0YiAgID0gJyc7JGZ1bmMgICA9ICRmYWxzZQ0KICAgIHdoaWxlICgkVGV4dC5jaGFycygwKSAtZXEgJ3gnKSB7JGZ1bmMgPSAkdHJ1ZTsgJFRleHQgPSAkVGV4dC5zdWJzdHJpbmcoMSkudHJpbSgpfQ0KICAgIHdoaWxlICgkVGV4dC5jaGFycygwKSAtZXEgJz4nKSB7JHRiICs9ICIgICAgIjsgJFRleHQgPSAkVGV4dC5zdWJzdHJpbmcoMSkudHJpbSgpfQ0KICAgICRTaWduID0gJFRleHQuY2hhcnMoMCkNCiAgICAkVGV4dCA9ICRUZXh0LnN1YnN0cmluZygxKS50cmltKCkucmVwbGFjZSgnL3hcJywnJykucmVwbGFjZSgnWy5dJywnW0N1cnJlbnQgRGlyZWN0b3J5XScpDQogICAgJHZlcnMgPSAkZmFsc2UNCiAgICBmb3JlYWNoICgkYXIgaW4gJGFjYykge2lmICgkYXJbMF0gLWVxICRzaWduKSB7JHZlcnMgPSAkdHJ1ZTsgJGNsciA9ICRhclsxXTsgJFNpZ24gPSAiWyR7U2lnbn1dICJ9fQ0KICAgIGlmICghJHZlcnMpIHtUaHJvdyAiSW5jb3JyZWN0IFNpZ24gWyRTaWduXSBQYXNzZWQhIn0NCiAgICBXcml0ZS1Ib3N0IC1Ob05ld0xpbmU6JGZ1bmMgLWYgJGNsciAkdGIkU2lnbiRUZXh0DQp9CgpTZXQtQWxpYXMgPzogSW52b2tlLVRlcm5hcnk=")))
# ========================================END=OF=COMPILER===========================================================|
function DrawWifi($Str=0,$WifiLn) {
    $lBar = "( "*($str)
    $rBar = " )"*($str)
    $sp = $(?:($(Get-Host).UI.RawUI.WindowSize.Width%2 -eq 1){""}{"|"})
#    ▐▌
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
$END = $Null
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
