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
#    The Following Code was added by AP-Compiler Version [1.2] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gS2V5UHJlc3NlZENvZGUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bSW50XSRLZXksICRTdG9yZT0iXl5eIikNCg0KICAgIGlmICghJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlIC1hbmQgJFN0b3JlIC1lcSAiXl5eIikge1JldHVybiAkRmFsc2V9DQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9DQogICAgcmV0dXJuICgkS2V5IC1pbiAkU3RvcmUuVmlydHVhbEtleUNvZGUpDQp9CgpmdW5jdGlvbiBJbnZva2UtVGVybmFyeSB7cGFyYW0oW2Jvb2xdJGRlY2lkZXIsIFtzY3JpcHRibG9ja10kaWZ0cnVlLCBbc2NyaXB0YmxvY2tdJGlmZmFsc2UpDQoNCiAgICBpZiAoJGRlY2lkZXIpIHsgJiRpZnRydWV9IGVsc2UgeyAmJGlmZmFsc2UgfQ0KfQoKZnVuY3Rpb24gR2V0LVdoZXJlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSldW3N0cmluZ10kRmlsZSwgW1N3aXRjaF0kQWxsKQ0KDQogICAgQVAtUmVxdWlyZSAiZGVwOndoZXJlIiB7dGhyb3cgIk5lZWQgU3lzMzJcd2hlcmUgdG8gd29yayEiO3JldHVybn0NCiAgICAkT3V0ID0gd2hlcmUuZXhlICRmaWxlIDI+JG51bGwNCiAgICBpZiAoISRPdXQpIHtyZXR1cm59DQogICAgaWYgKCRBbGwpIHtyZXR1cm4gJE91dH0NCiAgICByZXR1cm4gQCgkT3V0KVswXQ0KfQoKZnVuY3Rpb24gS2V5VHJhbnNsYXRlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kS2V5KQ0KDQogICAgJEhhc2hLZXkgPSBAew0KICAgICAgICAifn5TcGFjZX5+Ij0zMg0KICAgICAgICAifn5FU0NBUEV+fiI9MjcNCiAgICAgICAgIn5+RW50ZXJ+fiI9MTMNCiAgICAgICAgIn5+U2hpZnR+fiI9MTYNCiAgICAgICAgIn5+Q29udHJvbH5+Ij0xNw0KICAgICAgICAifn5BbHR+fiI9MTgNCiAgICAgICAgIn5+QmFja1NwYWNlfn4iPTgNCiAgICAgICAgIn5+RGVsZXRlfn4iPTQ2DQogICAgICAgICJ+fmYxfn4iPTExMg0KICAgICAgICAifn5mMn5+Ij0xMTMNCiAgICAgICAgIn5+ZjN+fiI9MTE0DQogICAgICAgICJ+fmY0fn4iPTExNQ0KICAgICAgICAifn5mNX5+Ij0xMTYNCiAgICAgICAgIn5+ZjZ+fiI9MTE3DQogICAgICAgICJ+fmY3fn4iPTExOA0KICAgICAgICAifn5mOH5+Ij0xMTkNCiAgICAgICAgIn5+Zjl+fiI9MTIwDQogICAgICAgICJ+fmYxMH5+Ij0xMjENCiAgICAgICAgIn5+ZjExfn4iPTEyMg0KICAgICAgICAifn5mMTJ+fiI9MTIzDQogICAgICAgICJ+fk11dGV+fiI9MTczDQogICAgICAgICJ+fkluc2VydH5+Ij00NQ0KICAgICAgICAifn5QYWdlVXB+fiI9MzMNCiAgICAgICAgIn5+UGFnZURvd25+fiI9MzQNCiAgICAgICAgIn5+RU5Efn4iPTM1DQogICAgICAgICJ+fkhPTUV+fiI9MzYNCiAgICAgICAgIn5+dGFifn4iPTkNCiAgICAgICAgIn5+Q2Fwc0xvY2t+fiI9MjANCiAgICAgICAgIn5+TnVtTG9ja35+Ij0xNDQNCiAgICAgICAgIn5+V2luZG93c35+Ij05MQ0KICAgICAgICAifn5MZWZ0fn4iPTM3DQogICAgICAgICJ+flVwfn4iPTM4DQogICAgICAgICJ+flJpZ2h0fn4iPTM5DQogICAgICAgICJ+fkRvd25+fiI9NDANCiAgICAgICAgIn5+S1Awfn4iPTk2DQogICAgICAgICJ+fktQMX5+Ij05Nw0KICAgICAgICAifn5LUDJ+fiI9OTgNCiAgICAgICAgIn5+S1Azfn4iPTk5DQogICAgICAgICJ+fktQNH5+Ij0xMDANCiAgICAgICAgIn5+S1A1fn4iPTEwMQ0KICAgICAgICAifn5LUDZ+fiI9MTAyDQogICAgICAgICJ+fktQN35+Ij0xMDMNCiAgICAgICAgIn5+S1A4fn4iPTEwNA0KICAgICAgICAifn5LUDl+fiI9MTA1DQogICAgfQ0KICAgIGlmIChbaW50XSRDb252ZXJ0ID0gJEhhc2hLZXkuJEtleSkge3JldHVybiAkQ29udmVydH0NCiAgICBUaHJvdyAiSW52YWxpZCBTcGVjaWFsIEtleSBDb252ZXJzaW9uIg0KfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bU3RyaW5nXSRMaWIsIFtTY3JpcHRCbG9ja10kT25GYWlsPXt9LCBbU3dpdGNoXSRQYXNzVGhydSkNCg0KICAgIFtib29sXSRTdGF0ID0gJChzd2l0Y2ggLXJlZ2V4ICgkTGliLnRyaW0oKSkgew0KICAgICAgICAiXkludGVybmV0IiAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5kZXA6KC4qKSIgIHtpZiAoJE1hdGNoZXNbMV0gLW5lICJ3aGVyZSIpe0FQLVJlcXVpcmUgImRlcDp3aGVyZSIgeyRNT0RFPTJ9fWVsc2V7JE1PREU9Mn07aWYgKCRNT0RFLTIpe0dldC1XaGVyZSAkTWF0Y2hlc1sxXX1lbHNle3RyeXsmICRNYXRjaGVzWzFdICIvZmpmZGpmZHMgLS1kc2phaGRocyAtZHNqYWRqIiAyPiRudWxsOyJzdWNjIn1jYXRjaHt9fX0NCiAgICAgICAgIl5saWI6KC4qKSIgIHskRmlsZT0kTWF0Y2hlc1sxXTskTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7KHRlc3QtcGF0aCAtdCBsZWFmICIkTGliXCRGaWxlIikgLW9yICh0ZXN0LXBhdGggLXQgbGVhZiAiJExpYlwkRmlsZS5kbGwiKX0NCiAgICAgICAgIl5mdW5jdGlvbjooLiopIiAge2djbSAkTWF0Y2hlc1sxXSAtZWEgU2lsZW50bHlDb250aW51ZX0NCiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSIgIHtUZXN0LVBhdGggIkZ1bmN0aW9uOlwkKCRNYXRjaGVzWzFdKSJ9DQogICAgfSkNCiAgICBpZiAoISRTdGF0KSB7JE9uRmFpbC5JbnZva2UoKX0NCiAgICBpZiAoJFBhc3NUaHJ1KSB7cmV0dXJuICRTdGF0fQ0KfQoKZnVuY3Rpb24gQWxpZ24tVGV4dCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJykNCg0KICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAkYW5zID0gQCgpDQogICAgICAgIGZvcmVhY2ggKCRsbiBpbiAkVGV4dCkgeyRBbnMgKz0gQWxpZ24tVGV4dCAkbG4gJEFsaWdufQ0KICAgICAgICByZXR1cm4gKCRhbnMpDQogICAgfSBlbHNlIHsNCiAgICAgICAgJFdpblNpemUgPSAkKEdldC1Ib3N0KS5VSS5SYXdVSS5XaW5kb3dTaXplLldpZHRoDQogICAgICAgIGlmICgoIiIrJFRleHQpLkxlbmd0aCAtZ2UgJFdpblNpemUpIHsNCiAgICAgICAgICAgICRBcHBlbmRlciA9IEAoIiIpOw0KICAgICAgICAgICAgJGogPSAwDQogICAgICAgICAgICBmb3JlYWNoICgkcCBpbiAwLi4oKCIiKyRUZXh0KS5MZW5ndGgtMSkpew0KICAgICAgICAgICAgICAgIGlmICgoJHArMSklJHdpbnNpemUgLWVxIDApIHskaisrOyRBcHBlbmRlciArPSAiIn0NCiMgICAgICAgICAgICAgICAgIiIrJGorIiAtICIrJHANCiAgICAgICAgICAgICAgICAkQXBwZW5kZXJbJGpdICs9ICRUZXh0LmNoYXJzKCRwKQ0KICAgICAgICAgICAgfQ0KICAgICAgICAgICAgcmV0dXJuIChBbGlnbi1UZXh0ICRBcHBlbmRlciAkQWxpZ24pDQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBpZiAoJEFsaWduIC1lcSAiQ2VudGVyIikgew0KICAgICAgICAgICAgICAgIHJldHVybiAoIiAiKlttYXRoXTo6dHJ1bmNhdGUoKCRXaW5TaXplLSgiIiskVGV4dCkuTGVuZ3RoKS8yKSskVGV4dCkNCiAgICAgICAgICAgIH0gZWxzZWlmICgkQWxpZ24gLWVxICJSaWdodCIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIiooJFdpblNpemUtKCIiKyRUZXh0KS5MZW5ndGgtMSkrJFRleHQpDQogICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgIHJldHVybiAoJFRleHQpDQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQp9CgpmdW5jdGlvbiBXcml0ZS1BUCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXSRUZXh0LCBbU3dpdGNoXSROb1NpZ24sIFtTd2l0Y2hdJFBsYWluVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nTGVmdCcsIFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KDQogICAgaWYgKCR0ZXh0LmNvdW50IC1ndCAxIC1vciAkdGV4dC5HZXRUeXBlKCkuTmFtZSAtbWF0Y2ggIlxbXF0kIikge3JldHVybiAkVGV4dCB8P3siJF8ifXwgJSB7V3JpdGUtQVAgJF8gLU5vU2lnbjokTm9TaWduIC1QbGFpblRleHQ6JFBsYWluVGV4dCAtQWxpZ24gJEFsaWdufX0NCiAgICBpZiAoISR0ZXh0IC1vciAkdGV4dCAtbm90bWF0Y2ggIl4oKD88Tk5MPngpfCg/PE5TPm5zPykpezAsMn0oPzx0Plw+KikoPzxzPlsrXC0hXCpcI1xAXSkoPzx3Pi4qKSIpIHtyZXR1cm4gJFRleHR9DQogICAgJHRiICA9ICIgICAgIiokTWF0Y2hlcy50Lmxlbmd0aDsNCiAgICAkQ29sID0gQHsnKyc9JzInOyctJz0nMTInOychJz0nMTQnOycqJz0nMyc7JyMnPSdEYXJrR3JheSc7J0AnPSdHcmF5J31bKCRTaWduID0gJE1hdGNoZXMuUyldDQogICAgaWYgKCEkQ29sKSB7VGhyb3cgIkluY29ycmVjdCBTaWduIFskU2lnbl0gUGFzc2VkISJ9DQogICAgJFNpZ24gPSAkKGlmICgkTm9TaWduIC1vciAkTWF0Y2hlcy5OUykgeyIifSBlbHNlIHsiWyRTaWduXSAifSkNCiAgICBBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiB7ZnVuY3Rpb24gR2xvYmFsOkFsaWduLVRleHQoJGFsaWduLCR0ZXh0KSB7JHRleHR9fQ0KICAgICREYXRhID0gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSI7aWYgKCEkRGF0YSkge3JldHVybn0NCiAgICAkRGF0YSA9IEFsaWduLVRleHQgLUFsaWduICRBbGlnbiAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIg0KICAgIGlmICgkUGxhaW5UZXh0KSB7cmV0dXJuICREYXRhfQ0KICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZTokKFtib29sXSRNYXRjaGVzLk5OTCkgLWYgJENvbCAkRGF0YQ0KICAgIGlmICgkUGFzc1RocnUpIHskRGF0YX0NCn0KCmZ1bmN0aW9uIEtleVByZXNzZWQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nW11dJEtleSwgJFN0b3JlPSJeXl4iKQ0KDQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIgLWFuZCAkSG9zdC5VSS5SYXdVSS5LZXlBdmFpbGFibGUpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9IGVsc2Uge2lmICgkU3RvcmUgLWVxICJeXl4iKSB7cmV0dXJuICRGYWxzZX19DQogICAgJEFucyA9ICRGYWxzZQ0KICAgICRLZXkgfCAlIHsNCiAgICAgICAgJFNPVVJDRSA9ICRfDQogICAgICAgIHRyeSB7DQogICAgICAgICAgICAkQW5zID0gJEFucyAtb3IgKEtleVByZXNzZWRDb2RlICRTT1VSQ0UgJFN0b3JlKQ0KICAgICAgICB9IGNhdGNoIHsNCiAgICAgICAgICAgIEZvcmVhY2ggKCRLIGluICRTT1VSQ0UpIHsNCiAgICAgICAgICAgICAgICBbU3RyaW5nXSRLID0gJEsNCiAgICAgICAgICAgICAgICBpZiAoJEsubGVuZ3RoIC1ndCA0IC1hbmQgKCRLWzAsMSwtMSwtMl0gLWpvaW4oIiIpKSAtZXEgIn5+fn4iKSB7DQogICAgICAgICAgICAgICAgICAgICRBbnMgPSAkQU5TIC1vciAoS2V5UHJlc3NlZENvZGUgKEtleVRyYW5zbGF0ZSgkSykpICRTdG9yZSkNCiAgICAgICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgICAgICAkQW5zID0gJEFOUyAtb3IgKCRLLmNoYXJzKDApIC1pbiAkU3RvcmUuQ2hhcmFjdGVyKQ0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCiAgICByZXR1cm4gJEFucw0KfQoKZnVuY3Rpb24gUHJvY2Vzcy1UcmFuc3BhcmVuY3kge3BhcmFtKFtBbGlhcygiVHJhbnNwYXJlbmN5IiwiSW52aXNpYmlsaXR5IiwiaSIsInQiKV1bVmFsaWRhdGVSYW5nZSgwLDEwMCldW2ludF0kVHJhbnM9MCwgW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXSRQcm9jZXNzKQ0KDQogICAgaWYgKCRQcm9jZXNzIC1tYXRjaCAiXC5leGUkIikgeyRQcm9jZXNzID0gJFByb2Nlc3MucmVwbGFjZSgiLmV4ZSIsIiIpfQ0KICAgIFRyeSB7DQogICAgICAgIGlmICgkUHJvY2Vzcy5uYW1lKSB7JFByb2MgPSAkUHJvY2Vzcy5uYW1lfSBlbHNlIHskUHJvYyA9IChHZXQtUHJvY2VzcyAkUHJvY2VzcyAtRXJyb3JBY3Rpb24gU3RvcClbMF0ubmFtZX0NCiAgICB9IGNhdGNoIHsNCiAgICAgICAgaWYgKFtJbnRdOjpUcnlQYXJzZSgkUHJvY2VzcywgW3JlZl0zKSkgeyRQcm9jID0gKChHZXQtUHJvY2VzcyB8ID8geyRfLklEIC1lcSAkUHJvY2Vzc30pWzBdKS5uYW1lfQ0KICAgIH0NCiAgICBpZiAoJFByb2MgLW5vdE1hdGNoICJcLmV4ZSQiKSB7JFByb2MgPSAiJFByb2MuZXhlIn0NCiAgICBuaXJjbWQgd2luIHRyYW5zIHByb2Nlc3MgIiRQcm9jIiAoKDEwMC0kVHJhbnMpKjI1NS8xMDApIHwgT3V0LU51bGwNCn0KClNldC1BbGlhcyBpbnYgUHJvY2Vzcy1UcmFuc3BhcmVuY3kKU2V0LUFsaWFzID86IEludm9rZS1UZXJuYXJ5")))
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
