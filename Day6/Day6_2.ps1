$start=get-date
$in = (Get-Content .\Day6_input.txt).Split(",")
$hash = @{
    "0" = ($in | Where-Object { $_ -eq 0 }).Count;
    "1" = ($in | Where-Object { $_ -eq 1 }).Count;
    "2" = ($in | Where-Object { $_ -eq 2 }).Count; 
    "3" = ($in | Where-Object { $_ -eq 3 }).Count;
    "4" = ($in | Where-Object { $_ -eq 4 }).Count;
    "5" = ($in | Where-Object { $_ -eq 5 }).Count;
    "6" = ($in | Where-Object { $_ -eq 6 }).Count;
    "7" = ($in | Where-Object { $_ -eq 7 }).Count;
    "8" = ($in | Where-Object { $_ -eq 8 }).Count
}
for ($i = 0; $i -lt 256; $i++) {
    $newborn = $hash["0"]
    for ($j = 0; $j -lt 9; $j++) {
        switch ($j) {
            { $_ -in 7, 5, 4, 3, 2, 1, 0 } { $hash["$($j)"] = $hash["$($j+1)"] }
            6 { $hash["$($j)"] = $hash["$($j+1)"] + $newborn }
            8 { $hash["$($j)"] = $newborn }
            Default {}
        }    
    }
}
$(foreach ($item in $hash.GetEnumerator() | Sort-Object Name) { $item.value}) | Measure-Object -Sum

$End=get-date
New-TimeSpan -Start $start -End $end















































<#
for ($day = 0; $day -lt 80; $day++) {
    ($in | Where-Object { $_ -eq 0 })| ForEach-Object { $in += 9 }
    for ($i = 0; $i -lt $in.Count; $i++) {
        if ($in[$i] -ne 0) { $in[$i]-- }else {
            $in[$i] = 6
        }
    }
}
$in.count
#Läuft 25 Minuten.....


#>
