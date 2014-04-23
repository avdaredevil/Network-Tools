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
function Display-Stacks {
param([Parameter(Mandatory=$True)][Object[]]$Data)

    $op = 0
    Foreach ($Db in $data) {
        $op++
        $TGT = [Console]::BufferWidth-1-"Stack[$op]".Length
        $RL = [Math]::Ceiling($TGT/2)
        $LL = $TGT-$RL
        ('-'*$LL)+"Stack[$op]"+('-'*$RL)+"`n$db"
    }
}

function Stacker {
param([Parameter(Mandatory=$True)][Object[]]$Data, [Int32]$Space=$D_Space, [Switch]$Trim=$false, [Alias("Tab","ByTab","Tabbed","BT")][Switch]$ByTabbing=$false)

    if ($Space -lt 1) {throw "The Space Variable cannot be less than 1";exit}
    [String]$Buffer = ""; $div = '|-(_+#+_)-|'; $DIVX = '[[[/|_+_|\]]]'
#    $Data | % {$Buffer += "$("$_".replace("`n",$Div))$Div"}
    $File = "$env:temp\$(Get-Random)-Stack.txt"
    $Data > $File
    $Buffer = [IO.File]::ReadAllLines($file) -join($Div)
    $Buffer = $Buffer.replace("`n",$Div)
    del -Force $File | out-null
    if ($ByTabbing) {
        $Buffer = $Buffer.trim($Div)
        $Buffer = $Buffer.replace("$Div"*3,$Div)
        $Buffer = $Buffer.replace("$Div"*2,$Div)
        $Buffer = $Buffer.replace("$Div ","$DIVX")
        $Buffer = $Buffer.replace("$Div","`n")
        $Buffer = $Buffer.replace("$DIVX","$Div ")
        [String[]] $BufferC = $Buffer.split("`n")
    } else {
        $Buffer = $Buffer.replace("$Div"*$Space,"`n")
        [Object[]] $BufferC = $Buffer.split("`n")
        if (!($BufferC[-1])) {$BufferC = $BufferC[0..($BufferC.Length-2)]}
    }
    $BufferC[0] = $BufferC[0].trimstart("$Div")
    $BufferC = $BufferC | % {if ($trim) {$_.trim($Div)} else {$_}} | % {$_.replace($Div,"`n")} | % {$_}
    return $BufferC
#    [Object[][]] $BufferF;
#    for ($i = 0; $i -lt $BufferC.count;$i++) {
#        $DTStream = ($BufferC[$i]).split("`n")
#        $BufferF += @($DTStream[0])
#        for ($j = 1;$j -lt $DTStream.count; $j++) {
#            $BufferF[$I] += $DTStream[$j]
##            "-------------------------------"
#        }
##        "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#    }
##    Return $BufferF
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
