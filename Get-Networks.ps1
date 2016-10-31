<#
|=====================================================================================>|
   Get-Networks Script by APoorv Verma [AP] on 8/21/2013
|=====================================================================================>|
        $) Queries all networks and gets their
            @)SSID
            @)Type
            @)Security
            @)Encryption
            @)BSSID
            @)Signal
            @)RadioType
            @)Channel
        $) Uses Stacking Engine for AP-Modules by Apoorv
        $) Security Merge [Changes Tech Details to (unsecure, WEP, WPA/WPA2)]
        $) Clean Mode : Shows a more intuitive and cleaner output
|=====================================================================================>|
#>
param([Alias("SM","Merge")][Switch]$SecurityMerge=$False,[Alias("BL","Letter")][Switch]$BandLetter=$False,[Alias("C","Clear")][Switch]$Clean=$False)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.2] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bU3RyaW5nXSRMaWIsIFtTY3JpcHRCbG9ja10kT25GYWlsPXt9LCBbU3dpdGNoXSRQYXNzVGhydSkNCg0KICAgIFtib29sXSRTdGF0ID0gJChzd2l0Y2ggLXJlZ2V4ICgkTGliLnRyaW0oKSkgew0KICAgICAgICAiXkludGVybmV0IiAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5kZXA6KC4qKSIgIHtpZiAoJE1hdGNoZXNbMV0gLW5lICJ3aGVyZSIpe0FQLVJlcXVpcmUgImRlcDp3aGVyZSIgeyRNT0RFPTJ9fWVsc2V7JE1PREU9Mn07aWYgKCRNT0RFLTIpe0dldC1XaGVyZSAkTWF0Y2hlc1sxXX1lbHNle3RyeXsmICRNYXRjaGVzWzFdICIvZmpmZGpmZHMgLS1kc2phaGRocyAtZHNqYWRqIiAyPiRudWxsOyJzdWNjIn1jYXRjaHt9fX0NCiAgICAgICAgIl5saWI6KC4qKSIgIHskRmlsZT0kTWF0Y2hlc1sxXTskTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7KHRlc3QtcGF0aCAtdCBsZWFmICIkTGliXCRGaWxlIikgLW9yICh0ZXN0LXBhdGggLXQgbGVhZiAiJExpYlwkRmlsZS5kbGwiKX0NCiAgICAgICAgIl5mdW5jdGlvbjooLiopIiAge2djbSAkTWF0Y2hlc1sxXSAtZWEgU2lsZW50bHlDb250aW51ZX0NCiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSIgIHtUZXN0LVBhdGggIkZ1bmN0aW9uOlwkKCRNYXRjaGVzWzFdKSJ9DQogICAgfSkNCiAgICBpZiAoISRTdGF0KSB7JE9uRmFpbC5JbnZva2UoKX0NCiAgICBpZiAoJFBhc3NUaHJ1KSB7cmV0dXJuICRTdGF0fQ0KfQoKZnVuY3Rpb24gRGlzcGxheS1TdGFja3Mge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bT2JqZWN0W11dJERhdGEpDQoNCiAgICAkb3AgPSAwDQogICAgRm9yZWFjaCAoJERiIGluICRkYXRhKSB7DQogICAgICAgICRvcCsrDQogICAgICAgICRUR1QgPSBbQ29uc29sZV06OkJ1ZmZlcldpZHRoLTEtIlN0YWNrWyRvcF0iLkxlbmd0aA0KICAgICAgICAkUkwgPSBbTWF0aF06OkNlaWxpbmcoJFRHVC8yKQ0KICAgICAgICAkTEwgPSAkVEdULSRSTA0KICAgICAgICAoJ+KUgCcqJExMKSsiU3RhY2tbJG9wXSIrKCfilIAnKiRSTCkrImBuJGRiIg0KICAgIH0NCn0KCmZ1bmN0aW9uIFN0YWNrZXIge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bT2JqZWN0W11dJERhdGEsIFtJbnQzMl0kU3BhY2U9JERfU3BhY2UsIFtTd2l0Y2hdJFRyaW09JGZhbHNlLCBbQWxpYXMoIlRhYiIsIkJ5VGFiIiwiVGFiYmVkIiwiQlQiKV1bU3dpdGNoXSRCeVRhYmJpbmc9JGZhbHNlKQ0KDQogICAgaWYgKCRTcGFjZSAtbHQgMSkge3Rocm93ICJUaGUgU3BhY2UgVmFyaWFibGUgY2Fubm90IGJlIGxlc3MgdGhhbiAxIjtleGl0fQ0KICAgIFtTdHJpbmddJEJ1ZmZlciA9ICIiOyAkZGl2ID0gJ3wtKF8rIytfKS18JzsgJERJVlggPSAnW1tbL3xfK198XF1dXScNCiMgICAgJERhdGEgfCAlIHskQnVmZmVyICs9ICIkKCIkXyIucmVwbGFjZSgiYG4iLCREaXYpKSREaXYifQ0KICAgICRGaWxlID0gIiRlbnY6dGVtcFwkKEdldC1SYW5kb20pLVN0YWNrLnR4dCINCiAgICAkRGF0YSA+ICRGaWxlDQogICAgJEJ1ZmZlciA9IFtJTy5GaWxlXTo6UmVhZEFsbExpbmVzKCRmaWxlKSAtam9pbigkRGl2KQ0KICAgICRCdWZmZXIgPSAkQnVmZmVyLnJlcGxhY2UoImBuIiwkRGl2KQ0KICAgIGRlbCAtRm9yY2UgJEZpbGUgfCBvdXQtbnVsbA0KICAgIGlmICgkQnlUYWJiaW5nKSB7DQogICAgICAgICRCdWZmZXIgPSAkQnVmZmVyLnRyaW0oJERpdikNCiAgICAgICAgJEJ1ZmZlciA9ICRCdWZmZXIucmVwbGFjZSgiJERpdiIqMywkRGl2KQ0KICAgICAgICAkQnVmZmVyID0gJEJ1ZmZlci5yZXBsYWNlKCIkRGl2IioyLCREaXYpDQogICAgICAgICRCdWZmZXIgPSAkQnVmZmVyLnJlcGxhY2UoIiREaXYgIiwiJERJVlgiKQ0KICAgICAgICAkQnVmZmVyID0gJEJ1ZmZlci5yZXBsYWNlKCIkRGl2IiwiYG4iKQ0KICAgICAgICAkQnVmZmVyID0gJEJ1ZmZlci5yZXBsYWNlKCIkRElWWCIsIiREaXYgIikNCiAgICAgICAgW1N0cmluZ1tdXSAkQnVmZmVyQyA9ICRCdWZmZXIuc3BsaXQoImBuIikNCiAgICB9IGVsc2Ugew0KICAgICAgICAkQnVmZmVyID0gJEJ1ZmZlci5yZXBsYWNlKCIkRGl2IiokU3BhY2UsImBuIikNCiAgICAgICAgW09iamVjdFtdXSAkQnVmZmVyQyA9ICRCdWZmZXIuc3BsaXQoImBuIikNCiAgICAgICAgaWYgKCEoJEJ1ZmZlckNbLTFdKSkgeyRCdWZmZXJDID0gJEJ1ZmZlckNbMC4uKCRCdWZmZXJDLkxlbmd0aC0yKV19DQogICAgfQ0KICAgICRCdWZmZXJDWzBdID0gJEJ1ZmZlckNbMF0udHJpbXN0YXJ0KCIkRGl2IikNCiAgICAkQnVmZmVyQyA9ICRCdWZmZXJDIHwgJSB7aWYgKCR0cmltKSB7JF8udHJpbSgkRGl2KX0gZWxzZSB7JF99fSB8ICUgeyRfLnJlcGxhY2UoJERpdiwiYG4iKX0gfCAlIHskX30NCiAgICByZXR1cm4gJEJ1ZmZlckMNCiMgICAgW09iamVjdFtdW11dICRCdWZmZXJGOw0KIyAgICBmb3IgKCRpID0gMDsgJGkgLWx0ICRCdWZmZXJDLmNvdW50OyRpKyspIHsNCiMgICAgICAgICREVFN0cmVhbSA9ICgkQnVmZmVyQ1skaV0pLnNwbGl0KCJgbiIpDQojICAgICAgICAkQnVmZmVyRiArPSBAKCREVFN0cmVhbVswXSkNCiMgICAgICAgIGZvciAoJGogPSAxOyRqIC1sdCAkRFRTdHJlYW0uY291bnQ7ICRqKyspIHsNCiMgICAgICAgICAgICAkQnVmZmVyRlskSV0gKz0gJERUU3RyZWFtWyRqXQ0KIyMgICAgICAgICAgICAiLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSINCiMgICAgICAgIH0NCiMjICAgICAgICAieHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eCINCiMgICAgfQ0KIyMgICAgUmV0dXJuICRCdWZmZXJGDQp9CgpmdW5jdGlvbiBXcml0ZS1BUCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXSRUZXh0LCBbU3dpdGNoXSROb1NpZ24sIFtTd2l0Y2hdJFBsYWluVGV4dCwgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nTGVmdCcsIFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KDQogICAgaWYgKCR0ZXh0LmNvdW50IC1ndCAxIC1vciAkdGV4dC5HZXRUeXBlKCkuTmFtZSAtbWF0Y2ggIlxbXF0kIikge3JldHVybiAkVGV4dCB8P3siJF8ifXwgJSB7V3JpdGUtQVAgJF8gLU5vU2lnbjokTm9TaWduIC1QbGFpblRleHQ6JFBsYWluVGV4dCAtQWxpZ24gJEFsaWdufX0NCiAgICBpZiAoISR0ZXh0IC1vciAkdGV4dCAtbm90bWF0Y2ggIl4oKD88Tk5MPngpfCg/PE5TPm5zPykpezAsMn0oPzx0Plw+KikoPzxzPlsrXC0hXCpcI1xAXSkoPzx3Pi4qKSIpIHtyZXR1cm4gJFRleHR9DQogICAgJHRiICA9ICIgICAgIiokTWF0Y2hlcy50Lmxlbmd0aDsNCiAgICAkQ29sID0gQHsnKyc9JzInOyctJz0nMTInOychJz0nMTQnOycqJz0nMyc7JyMnPSdEYXJrR3JheSc7J0AnPSdHcmF5J31bKCRTaWduID0gJE1hdGNoZXMuUyldDQogICAgaWYgKCEkQ29sKSB7VGhyb3cgIkluY29ycmVjdCBTaWduIFskU2lnbl0gUGFzc2VkISJ9DQogICAgJFNpZ24gPSAkKGlmICgkTm9TaWduIC1vciAkTWF0Y2hlcy5OUykgeyIifSBlbHNlIHsiWyRTaWduXSAifSkNCiAgICBBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiB7ZnVuY3Rpb24gR2xvYmFsOkFsaWduLVRleHQoJGFsaWduLCR0ZXh0KSB7JHRleHR9fQ0KICAgICREYXRhID0gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSI7aWYgKCEkRGF0YSkge3JldHVybn0NCiAgICAkRGF0YSA9IEFsaWduLVRleHQgLUFsaWduICRBbGlnbiAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIg0KICAgIGlmICgkUGxhaW5UZXh0KSB7cmV0dXJuICREYXRhfQ0KICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZTokKFtib29sXSRNYXRjaGVzLk5OTCkgLWYgJENvbCAkRGF0YQ0KICAgIGlmICgkUGFzc1RocnUpIHskRGF0YX0NCn0KCmZ1bmN0aW9uIEdldC1XaGVyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JHRydWUpXVtzdHJpbmddJEZpbGUsIFtTd2l0Y2hdJEFsbCkNCg0KICAgIEFQLVJlcXVpcmUgImRlcDp3aGVyZSIge3Rocm93ICJOZWVkIFN5czMyXHdoZXJlIHRvIHdvcmshIjtyZXR1cm59DQogICAgJE91dCA9IHdoZXJlLmV4ZSAkZmlsZSAyPiRudWxsDQogICAgaWYgKCEkT3V0KSB7cmV0dXJufQ0KICAgIGlmICgkQWxsKSB7cmV0dXJuICRPdXR9DQogICAgcmV0dXJuIEAoJE91dClbMF0NCn0K")))
# ========================================END=OF=COMPILER===========================================================|


if ($Clean) {$SecurityMerge = $true;$BandLetter = $true}
$Networks = Stacker $(netsh wlan show networks mode=BSSID) 2 -trim
if ($Networks.count -eq 1) {Write-AP "-$((Stacker $Networks -ByTabbing)[-1])";exit}
$Networks = $Networks[1..($Networks.count-1)]
#Display-Stacks $networks
$Props = @("SSID","Type","Security","Encryption","BSSID","Signal","RadioType","Channel")
$NTWKS = New-Object system.Data.DataTable "All Networks"
foreach ($p in $props) {
    $NTWKS.columns.add((New-Object system.Data.DataColumn $p,([string])))
}
foreach ($network in $networks) {
    if ($network -eq "") {continue}
    $rw = $NTWKS.NewRow()
    $ntw = $network.split("`n")
    foreach ($RT in (0..($Props.count-1))) {
        $rw.($Props[$Rt]) = (($ntw[$rt].split(":")[1..8] -join(':'))+" ").trim()
    }
    $NTWKS.Rows.Add($rw)
}
if ($SecurityMerge) {
    $NTWKS = $NTWKS | % {
        if ($_.Security.contains("WPA2")) {$_.Security = "WPA2"}
        elseif ($_.Security.contains("WPA")) {$_.Security = "WPA"}
        elseif ($_.Security -eq("Open") -and $_.Encryption -eq("Wep")) {$_.Security = "WEP"}
        elseif ($_.Security -eq("Open") -and $_.Encryption -eq("None")) {$_.Security = "Unsecured"}
        $_
    }
}
if ($BandLetter) {
    $NTWKS = $NTWKS | % {
        $_.RadioType = $_.RadioType.replace("802.11","").toUpper()
        $_
    }
}
$Arrangement = $("SSID","CHANNEL","SIGNAL","SECURITY","ENCRYPTION","BSSID","RadioType","Type")
if ($SecurityMerge) {$Arrangement = $Arrangement | ? {$_ -ne "ENCRYPTION"}}
if ($NTWKS -ne $null) {$Ntwks | select $Arrangement} else {
    if ((Stacker (netsh wlan show interfaces))[2].split("`n")[-1].split(":")[1].trim() -eq "disconnected") {"Wireless Adapter is disconnected!"} else {"No Wi-Fi SSID's in Range!"}
}
