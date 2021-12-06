function draw-Line {
    param (
        [int]$startx,
        [Int]$starty,
        [Int]$endx,
        [int]$endy
    )
    if ($startx -ne $Endx -and $starty -ne $Endy) {
        $x = $startx 
        $y = $starty
        $Map[$X, $Y] += 1
        do {
            if ($startx -gt $endx) { $x-- }
            else { $x++ }
            if ($starty -gt $endy) { $y-- }
            else { $y++ }
            $Map[$X, $Y] += 1
        } until ($x -eq $endx -and $y -eq $endy)#War zu blöd die Logik für die richtige Anzahl an durchläufen zu machen
    }
    elseif ($startx -ne $Endx) {
        if ($startx -lt $Endx) {
            for ($i = $startx; $i -ne $Endx + 1; $i++) { $Map[$i, $starty] += 1 }
        }
        else {
            for ($i = $endx; $i -ne $startx + 1; $i++) { $Map[$i, $starty] += 1 }
        }
    }
    elseif ($starty -ne $Endy) {
        
        if ($starty -lt $Endy) {
            for ($i = $starty; $i -ne $Endy + 1; $i++) { $Map[$startx, $i] += 1 }
        }
        else {
            for ($i = $endy; $i -ne $starty + 1; $i++) { $Map[$startx, $i] += 1 }
        }  
    }
}  

$in = Get-Content .\Day5_input.txt
$Splitted = $in.Split("->").Trim().Split(",") | Where-Object { $_ -ne "" }
$MapSize = 1 + ($Splitted | Sort-Object -Descending | Select-Object -First 1)
$Map = New-Object 'object[,]' $MapSize, $MapSize

for ($i = 0; $i -lt $Splitted.Count; $i = $i + 4) {
    draw-Line -startx $Splitted[$i] -starty $Splitted[($i + 1)] -endx $Splitted[($i + 2)] -endy $Splitted[($i + 3)]
}
($map | Where-Object { $_ -gt 1 }).count