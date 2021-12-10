$in = Get-Content .\Day8_input.txt

$10er = $in | ForEach-Object { ($_.Split("|")[0]).trim() }
$4er = $in | ForEach-Object { ($_.Split("|")[1]).trim() }
$output = @()
for ($i = 0; $i -lt $in.Count; $i++) {
    
    $map = $10er[$i].Split(" ")
    switch ($map) {
        { $_.Length -eq 2 } { [char[]]$1 = $_ }
        { $_.Length -eq 4 } { [char[]]$4 = $_ }
        { $_.Length -eq 3 } { [char[]]$7 = $_ }
        { $_.Length -eq 7 } { [char[]]$8 = $_ }
                
        Default {}
    }
    #om
    [char]$om = $7 | Where-Object { $_ -notin $1 }
    #um
    foreach ($number in $map | Where-Object { $_.Length -eq 6 }) {
        $4 | ForEach-Object { $number = $number.replace("$($_)", "") }
        $7 | ForEach-Object { $number = $number.replace("$($_)", "") }
        if ($number.Length -eq 1) { [char]$um = $number } 
    }
    #9
    $9 = $4 + $7 + $um | Select-Object -Unique
    #mm
    foreach ($number in $map | Where-Object { $_.Length -eq 5 }) {
        $number = $number.replace("$($um)", "")
        $7 | ForEach-Object { $number = $number.replace("$($_)", "") }
        if ($number.Length -eq 1) { [char]$mm = $number } 
    }
    #3
    [char[]]$3 = $mm , $om , $um 
    $3 += $1
    #lo
    $lo = $9 | Where-Object { $_ -notin $1 -and $_ -notin $om -and $_ -notin $mm -and $_ -notin $um }
    #lu
    foreach ($number in $map | Where-Object { $_.Length -eq 6 }) {
        $number = $number.replace("$($lo)", "")
        $3 | ForEach-Object { $number = $number.replace("$($_)", "") }
        if ($number.Length -eq 1) { [char]$lu = $number } 
    }
    #0
    $0 = $8 | Where-Object { $_ -notin $mm }
    #ru
    foreach ($number in $map | Where-Object { $_.Length -eq 6 }) {
        $number = $number.replace("$($lo)", "")
        $number = $number.replace("$($lu)", "")
        $number = $number.replace("$($mm)", "")
        $number = $number.replace("$($um)", "")
        $number = $number.replace("$($om)", "")
        if ($number.Length -eq 1) { [char]$ru = $number } 
    }
    #6
    [char[]]$6 = $mm , $om , $um, $ru, $lu, $lo 
    #ro
    $ro = $8 | Where-Object { $_ -notin $6 }
    #2
    [char[]]$2 = $mm , $om , $um, $ro, $lu
    #5
    [char[]]$5 = $mm , $om , $um, $ru, $lo

    $code = ""
    $splitt = $4er[$i].split(" ")
    $code += switch ($splitt) {
        { $_.Length -eq 2 } { "1" }
        { $_.Length -eq 4 } { "4" }
        { $_.Length -eq 3 } { "7" }
        { $_.Length -eq 7 } { "8" }
        { $_.Length -eq 5 } {
            if ((Compare-Object -ReferenceObject $([char[]]$_ | Sort-Object) -DifferenceObject $($2 | Sort-Object)).count -eq 0) { "2" }
            elseif ((Compare-Object -ReferenceObject $([char[]]$_ | Sort-Object) -DifferenceObject $($3 | Sort-Object)).count -eq 0) { "3" } 
            else { "5" } 
        }
        { $_.Length -eq 6 } {
            if ((Compare-Object -ReferenceObject $([char[]]$_ | Sort-Object) -DifferenceObject $($0 | Sort-Object)).count -eq 0) { "0" }
            elseif ((Compare-Object -ReferenceObject $([char[]]$_ | Sort-Object) -DifferenceObject $($9 | Sort-Object)).count -eq 0) { "9" } 
            else { "6" } 
        }           
        Default {}
    }      
    $output += [int](($code -join "").Replace(" ", ""))
}
($output | Measure-Object -Sum).sum
