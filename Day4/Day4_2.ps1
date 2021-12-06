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

foreach ($number in $DrawnNumbers) {
    Write-Host  "Es sind noch $($AllBoards.count/25) Boards über" -ForegroundColor Green
    if ($AllBoards -ne $null) {       
        $AllBoards | Where-Object { $_.Value.Value -eq $number } | Foreach-object { $_.Value.Drawn = $true }
            

        for ($i = 0; $i -lt $AllBoards.Count; $i += 25) {
            $BingoSheet = ($AllBoards[$i..($i + 24)])
            $BingoSheet.value.X | Select-Object -Unique | ForEach-Object {
                $X = $_
                if (($BingoSheet | Where-Object { $_.Value.X -eq $X -AND $_.Value.Drawn -eq $false }).count -eq 0) {
                    "BINGO X $X mit der Zahl $number";
                    $Bingo = $true
                    $winner = $BingoSheet
                    $LastNummber = $number
                        
                    if ($AllBoards.count -gt 25) {
                        foreach ($Line in $BingoSheet) {                   
                            $AllBoards = $AllBoards | Where-Object { $_.Value -ne $Line.value }
                        }
                    }
                    else { $AllBoards = $null }

                }                
            }
            $BingoSheet.value.y | Select-Object -Unique | ForEach-Object {
                $y = $_
                if (($BingoSheet | Where-Object { $_.Value.y -eq $y -AND $_.Value.Drawn -eq $false }).count -eq 0) {
                    "BINGO Y $y mit der Zahl $number";
                    $Bingo = $true
                    $winner = $BingoSheet
                    $LastNummber = $number
                    if ($AllBoards.count -gt 25) {
                        foreach ($Line in $BingoSheet) {                   
                            $AllBoards = $AllBoards | Where-Object { $_.Value -ne $Line.value }
                        }
                    }
                    else { $AllBoards = $null }
                }               
            }  
        }
        
    } 
}        
#$winner | Where-Object { $_.Value.Value -eq $LastNummber } | Foreach-object { $_.Value.Drawn = $false }
$LastNummber
(($winner.value | Where-Object { $_.Drawn -eq $false } | Measure-Object -Property Value -Sum).Sum)
#Die Schleife wird einmal zu Oft durchlaufen, die Zahl 42 würde das Letzte Bingo auslösen, aber es wird noch einmal durchlaufen,
# mal schauen was da los ist
(($winner.value | Where-Object { $_.Drawn -eq $false } | Measure-Object -Property Value -Sum).Sum) * $LastNummber[0]