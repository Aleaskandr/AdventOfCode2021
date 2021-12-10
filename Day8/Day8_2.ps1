$in = Get-Content .\Day8_input.txt

$10er = $in | ForEach-Object { ($_.Split("|")[0]).trim() }
$4er = $in | ForEach-Object { ($_.Split("|")[1]).trim() }

for ($i = 0; $i -lt $in.Count; $i++) {
    $map = $10er[$i].Split(" ")
    switch ($map) {
        { $_.Length -eq 2 } { [char[]]$1 = $_ }
        { $_.Length -eq 4 } { [char[]]$4 = $_ }
        { $_.Length -eq 3 } { [char[]]$7 = $_ }
        { $_.Length -eq 7 } { [char[]]$8 = $_ }
                
        Default {}
    }
    $om = $7 | Where-Object { $_ -notin $1 }
    foreach ($number in $map | Where-Object {$_.Length -eq 6}){
        $4|ForEach-Object{$number=$number.replace("$($_)","")}
        $7|ForEach-Object{$number=$number.replace("$($_)","")}
        if($number.Length -eq 1){$um=$number} 
    }
    $9=$4+$7+$um|select -Unique
    foreach ($number in $map | Where-Object {$_.Length -eq 5}){
        $number=$number.replace("$($um)","")
        $7|ForEach-Object{$number=$number.replace("$($_)","")}
        if($number.Length -eq 1){$mm=$number} 
    }
    $3=$mm+$om+$um+$1|select -Unique
    # prüfen
Write-Host $um 
}
#-join $char
#$char -join ''


<#

cefabd: 9 hat a
cdfgeb: 6
cagedb: 0 kein f
#>


<#

 $code+= switch ($_) {
            { $_.Length -eq 2 } { "1" }
            { $_.Length -eq 4 } { "4" }
            { $_.Length -eq 3 } { "7" }
            { $_.Length -eq 7 } { "8" }
            { $_.Length -eq 5 } {
                if ($_ -like "*g*") { "2" }
                elseif ($_ -like "*a*") { "3" } 
                else { "5" } 
            }
            { $_.Length -eq 6 } {
                if ($_ -notlike "*f*") { "0" }
                elseif ($_ -like "*a*") { "9" } 
                else { "6" } 
            }
            
            Default {}
        }
    }
    $code
    #>