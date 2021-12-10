$RightSyntax = $in = Get-Content .\day10_input.txt
$Points = 0

ForEach ($line in $in) {
    $LastinFirstOut = @()
    for ($i = 0; $i -lt $line.length; $i++) {  
        switch ($line[$i]) {
            "(" { $LastinFirstOut += "(" }
            ")" {
                if ($LastinFirstOut[-1] -eq "(") { $LastinFirstOut = $LastinFirstOut[0..($LastinFirstOut.length - 2)] }else {
                    ") ist Falsch"
                    $Points += 3
                    $i = $line.Length
                    $RightSyntax = $RightSyntax | Where-Object { $_ -ne $line }
                }  
            }
            "[" { $LastinFirstOut += "[" }
            "]" {
                if ($LastinFirstOut[-1] -eq "[") { $LastinFirstOut = $LastinFirstOut[0..($LastinFirstOut.length - 2)] }else {
                    "] ist Falsch"
                    $Points += 57
                    $i = $line.Length
                    $RightSyntax = $RightSyntax | Where-Object { $_ -ne $line }
                } 
            }
            "{" { $LastinFirstOut += "{" }
            "}" {
                if ($LastinFirstOut[-1] -eq "{") { $LastinFirstOut = $LastinFirstOut[0..($LastinFirstOut.length - 2)] }else {
                    "} ist Falsch"
                    $Points += 1197
                    $i = $line.Length
                    $RightSyntax = $RightSyntax | Where-Object { $_ -ne $line }
                } 
            }
            "<" { $LastinFirstOut += "<" }
            ">" {
                if ($LastinFirstOut[-1] -eq "<") { $LastinFirstOut = $LastinFirstOut[0..($LastinFirstOut.length - 2)] }else {
                    "> ist Falsch"
                    $Points += 25137
                    $i = $line.Length
                    $RightSyntax = $RightSyntax | Where-Object { $_ -ne $line }
                } 
            }
            Default {}
        }  
        $LastinFirstOut# das müsste gespiegelt werden.
        
    }   
    if ($i -lt $line.length){$LastinFirstOut -join  "" }
}

#Prüfen was dienächste schließende Klammer sein muss.Wenn die IF Bedinung im dem Switch nicht eingeganen wurde war die Zeile Gültig und muss dann Geschlossen werden