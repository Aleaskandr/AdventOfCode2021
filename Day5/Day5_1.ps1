function draw-Line {
    param (
        [int]$startx,
        [Int]$starty,
        [Int]$endx,
        [int]$endy
    )
    if ($startx -ne $Endx) {
        if ($startx -lt $Endx) {          
            for ($i = $startx; $i -ne $Endx + 1; $i++) { $Map[$i, $starty] += 1 }
        }
        else {
            for ($i = $endx; $i -ne $startx + 1; $i++) { $Map[$i, $starty] += 1 }
        }
    }
    else {
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
    if ($Splitted[$i] -eq $Splitted[($i + 2)] -or $Splitted[($i + 1)] -eq $Splitted[($i + 3)]) {
        draw-Line -startx $Splitted[$i] -starty $Splitted[($i + 1)] -endx $Splitted[($i + 2)] -endy $Splitted[($i + 3)]
    } 
}
($map | Where-Object { $_ -gt 1 }).count