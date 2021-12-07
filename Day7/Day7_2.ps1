$in = (Get-Content .\Day7_input.txt).Split(",")
$Range = $in | Measure-Object -Minimum -Maximum
$FinalLevel = 0
$FinalFuel = 0
for ([int]$i = $range.Minimum; $i -ne $range.Maximum + 1; $i++) {
    $fuelcost = 0   
    $in | ForEach-Object {
        $cost = 0       
        $differenz = [Math]::Abs($_ - $i)
        $cost=($differenz * ( $differenz + 1))/2 #Gaußsche Summenformel <3
        $fuelcost += $cost
    }
    if ($FinalFuel -eq 0) { $FinalFuel = $fuelcost }
    if ($fuelcost -lt $FinalFuel) {
        $FinalLevel = $i
        $FinalFuel = $fuelcost
    }
}
$FinalFuel
$FinalLevel