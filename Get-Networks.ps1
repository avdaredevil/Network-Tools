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
#    The Following Code was added by AP-Compiler Version [1.0] To Make this program independent of AP-Core Engine
# ==================================================================================================================|
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gU3RhY2tlciB7CnBhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bT2JqZWN0W11dJERhdGEsIFtJbnQzMl0kU3BhY2U9JERfU3BhY2UsIFtTd2l0Y2hdJFRyaW09JGZhbHNlLCBbQWxpYXMoIlRhYiIsIkJ5VGFiIiwiVGFiYmVkIiwiQlQiKV1bU3dpdGNoXSRCeVRhYmJpbmc9JGZhbHNlKQ0KDQogICAgaWYgKCRTcGFjZSAtbHQgMSkge3Rocm93ICJUaGUgU3BhY2UgVmFyaWFibGUgY2Fubm90IGJlIGxlc3MgdGhhbiAxIjtleGl0fQ0KICAgIFtTdHJpbmddJEJ1ZmZlciA9ICIiOyAkZGl2ID0gJ3wtKF8rIytfKS18JzsgJERJVlggPSAnW1tbL3xfK198XF1dXScNCiMgICAgJERhdGEgfCAlIHskQnVmZmVyICs9ICIkKCIkXyIucmVwbGFjZSgiYG4iLCREaXYpKSREaXYifQ0KICAgICRGaWxlID0gIiRlbnY6dGVtcFwkKEdldC1SYW5kb20pLVN0YWNrLnR4dCINCiAgICAkRGF0YSA+ICRGaWxlDQogICAgJEJ1ZmZlciA9IFtJTy5GaWxlXTo6UmVhZEFsbExpbmVzKCRmaWxlKSAtam9pbigkRGl2KQ0KICAgICRCdWZmZXIgPSAkQnVmZmVyLnJlcGxhY2UoImBuIiwkRGl2KQ0KICAgIGRlbCAtRm9yY2UgJEZpbGUgfCBvdXQtbnVsbA0KICAgIGlmICgkQnlUYWJiaW5nKSB7DQogICAgICAgICRCdWZmZXIgPSAkQnVmZmVyLnRyaW0oJERpdikNCiAgICAgICAgJEJ1ZmZlciA9ICRCdWZmZXIucmVwbGFjZSgiJERpdiIqMywkRGl2KQ0KICAgICAgICAkQnVmZmVyID0gJEJ1ZmZlci5yZXBsYWNlKCIkRGl2IioyLCREaXYpDQogICAgICAgICRCdWZmZXIgPSAkQnVmZmVyLnJlcGxhY2UoIiREaXYgIiwiJERJVlgiKQ0KICAgICAgICAkQnVmZmVyID0gJEJ1ZmZlci5yZXBsYWNlKCIkRGl2IiwiYG4iKQ0KICAgICAgICAkQnVmZmVyID0gJEJ1ZmZlci5yZXBsYWNlKCIkRElWWCIsIiREaXYgIikNCiAgICAgICAgW1N0cmluZ1tdXSAkQnVmZmVyQyA9ICRCdWZmZXIuc3BsaXQoImBuIikNCiAgICB9IGVsc2Ugew0KICAgICAgICAkQnVmZmVyID0gJEJ1ZmZlci5yZXBsYWNlKCIkRGl2IiokU3BhY2UsImBuIikNCiAgICAgICAgW09iamVjdFtdXSAkQnVmZmVyQyA9ICRCdWZmZXIuc3BsaXQoImBuIikNCiAgICAgICAgaWYgKCEoJEJ1ZmZlckNbLTFdKSkgeyRCdWZmZXJDID0gJEJ1ZmZlckNbMC4uKCRCdWZmZXJDLkxlbmd0aC0yKV19DQogICAgfQ0KICAgICRCdWZmZXJDWzBdID0gJEJ1ZmZlckNbMF0udHJpbXN0YXJ0KCIkRGl2IikNCiAgICAkQnVmZmVyQyA9ICRCdWZmZXJDIHwgJSB7aWYgKCR0cmltKSB7JF8udHJpbSgkRGl2KX0gZWxzZSB7JF99fSB8ICUgeyRfLnJlcGxhY2UoJERpdiwiYG4iKX0gfCAlIHskX30NCiAgICByZXR1cm4gJEJ1ZmZlckMNCiMgICAgW09iamVjdFtdW11dICRCdWZmZXJGOw0KIyAgICBmb3IgKCRpID0gMDsgJGkgLWx0ICRCdWZmZXJDLmNvdW50OyRpKyspIHsNCiMgICAgICAgICREVFN0cmVhbSA9ICgkQnVmZmVyQ1skaV0pLnNwbGl0KCJgbiIpDQojICAgICAgICAkQnVmZmVyRiArPSBAKCREVFN0cmVhbVswXSkNCiMgICAgICAgIGZvciAoJGogPSAxOyRqIC1sdCAkRFRTdHJlYW0uY291bnQ7ICRqKyspIHsNCiMgICAgICAgICAgICAkQnVmZmVyRlskSV0gKz0gJERUU3RyZWFtWyRqXQ0KIyMgICAgICAgICAgICAiLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSINCiMgICAgICAgIH0NCiMjICAgICAgICAieHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eCINCiMgICAgfQ0KIyMgICAgUmV0dXJuICRCdWZmZXJGDQp9Cg==")))
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
