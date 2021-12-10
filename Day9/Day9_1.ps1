$in = Get-Content .\Day9_input.txt 
$XMax = ([char[]]$in[0]).Count
$YMax = $in.Length
$map = New-Object 'object[,]' $XMax, $YMax
$LowPoint=@()
$risklevel=0
for ($y = 0; $y -lt $YMax; $y++) {
    for ($x = 0; $x -lt $XMax; $x++) {
        if ($y -eq 0) {
            #"Erste Zeile"
            if($x -eq 0){
                if($in[$y][$x] -lt $in[$y][$x+1] -AND $in[$y][$x] -lt $in[$y+1][$x] ){$LowPoint+=$in[$y][$x]}#"Erste Spalte"
            }elseif ($x -eq $Xmax-1) {
                if($in[$y][$x] -lt $in[$y][$x-1] -AND $in[$y][$x] -lt $in[$y+1][$x] ){$LowPoint+=$in[$y][$x]}#"Letzte Spalte"
            }
            else {
                if($in[$y][$x] -lt $in[$y][$x-1]-AND $in[$y][$x] -lt $in[$y+1][$x] -AND $in[$y][$x] -lt $in[$y][$x+1] ){$LowPoint+=$in[$y][$x]}#"Dazwischen"
            }          
        }
        elseif ($in[$y] -eq $in[-1]) {
            #"Letzte Zeile"
            if($x -eq 0){
                if($in[$y][$x] -lt $in[$y][$x+1] -AND $in[$y][$x] -lt $in[$y-1][$x] ){$LowPoint+=$in[$y][$x]}#"Erste Spalte"
            }elseif ($x -eq $Xmax-1) {
                if($in[$y][$x] -lt $in[$y][$x-1] -AND $in[$y][$x] -lt $in[$y-1][$x] ){$LowPoint+=$in[$y][$x]}#"Letzte Spalte"
            }
            else {
                if($in[$y][$x] -lt $in[$y][$x-1]-AND $in[$y][$x] -lt $in[$y-1][$x] -AND $in[$y][$x] -lt $in[$y][$x+1] ){$LowPoint+=$in[$y][$x]}#"Dazwischen"
            }
        }
        else {
            #"Dazwischen"
            if($x -eq 0){
                if($in[$y][$x] -lt $in[$y][$x+1] -AND $in[$y][$x] -lt $in[$y-1][$x] -AND $in[$y][$x] -lt $in[$y+1][$x]){$LowPoint+=$in[$y][$x]}#"Erste Spalte"
            }elseif ($x -eq $Xmax-1) {
                if($in[$y][$x] -lt $in[$y][$x-1] -AND $in[$y][$x] -lt $in[$y-1][$x] -AND $in[$y][$x] -lt $in[$y+1][$x] ){$LowPoint+=$in[$y][$x]}#"Letzte Spalte"
            }
            else {
                if($in[$y][$x] -lt $in[$y][$x-1] -AND $in[$y][$x] -lt $in[$y][$x+1] -AND $in[$y][$x] -lt $in[$y-1][$x] -AND $in[$y][$x] -lt $in[$y+1][$x] ){$LowPoint+=$in[$y][$x]}#"Dazwischen"
            }
        }
    }
}
$LowPoint|ForEach-Object{$risklevel +=[convert]::ToInt32($_, 10)+1}
$risklevel
