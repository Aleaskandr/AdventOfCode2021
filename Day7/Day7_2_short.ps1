$in = (Get-Content .\Day7_input.txt).Split(",")
$avg = [math]::Truncate( (($in | Measure-Object -Average).Average))
$fuelcost = 0   
$in | ForEach-Object {
    $cost = 0       
    $differenz = [Math]::Abs($_ - $avg)
    $cost = ($differenz * ( $differenz + 1)) / 2 #Gaußsche Summenformel <3
    $fuelcost += $cost
}
$fuelcost