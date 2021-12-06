$DrawnNumbers = (Get-Content .\Day4_input.txt).Split(",")
$boards = (Get-Content .\Day4_input2.txt).Split("`n")
$AllBoards = @()
#Boards erstellen
for ($i = 0; $i -lt $boards.Length; $i += 6) {
    $y = 1
    $boards[$i..($i + 4)] | ForEach-Object {
        $x = 1
        (($_).trim() -replace '\s+', ' ').split(" ") | ForEach-Object {  
            $hash = @{
                X     = $x
                Y     = $y
                Value = $_
                Drawn = $false
            }
            $AllBoards += [ref](New-Object pscustomobject  -Property $hash)
           
            $x++
        }
        $y++  
    }
}
$Bingo = $false
foreach ($number in $DrawnNumbers) {
    if ($Bingo -eq $false) {
        $AllBoards | Where-Object { $_.Value.Value -eq $number } | Foreach-object { $_.Value.Drawn = $true }
        for ($i = 0; $i -lt $AllBoards.Count; $i += 25) {
            $BingoSheet = ($AllBoards[$i..($i + 24)]).value
            $BingoSheet.X | Select-Object -Unique | ForEach-Object {
                $X = $_
                if (($BingoSheet | Where-Object { $_.X -eq $X -AND $_.Drawn -eq $false }).count -eq 0) {
                    "BINGO X $X";
                    $Bingo = $true
                    $winner = $BingoSheet
                    $LastNummber = $number
                }                
            }
            $BingoSheet.y | Select-Object -Unique | ForEach-Object {
                $y = $_
                if (($BingoSheet | Where-Object { $_.y -eq $y -AND $_.Drawn -eq $false }).count -eq 0) {
                    "BINGO Y";
                    $Bingo = $true
                    $winner = $BingoSheet
                    $LastNummber = $number
                }               
            }  
        }
    } 
}        
(($winner | Where-Object { $_.Drawn -eq $false } | Measure-Object -Property Value -Sum).Sum) * $LastNummber[0]