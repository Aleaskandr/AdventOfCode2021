$in = Get-Content .\day10_input.txt
$Points=0
ForEach ($line in $in) {
    $LastinFirstOut = @()
    for ($i = 0; $i -lt $line.length; $i++) {  
        switch ($line[$i]) {
            "(" { $LastinFirstOut += "(" }
            ")" {
                if ($LastinFirstOut[-1] -eq "(") { $LastinFirstOut = $LastinFirstOut[0..($LastinFirstOut.length - 2)] }else {
                    ") ist Falsch"
                    $Points+=3
                    $i = $line.Length
                }
            }
            "[" { $LastinFirstOut += "[" }
            "]" {
                if ($LastinFirstOut[-1] -eq "[") { $LastinFirstOut = $LastinFirstOut[0..($LastinFirstOut.length - 2)] }else {
                    "] ist Falsch"
                    $Points+=57
                    $i = $line.Length
                } 
            }
            "{" { $LastinFirstOut += "{" }
            "}" {
                if ($LastinFirstOut[-1] -eq "{") { $LastinFirstOut = $LastinFirstOut[0..($LastinFirstOut.length - 2)] }else {
                    "} ist Falsch"
                    $Points+=1197
                    $i = $line.Length
                } 
            }
            "<" { $LastinFirstOut += "<" }
            ">" {
                if ($LastinFirstOut[-1] -eq "<") { $LastinFirstOut = $LastinFirstOut[0..($LastinFirstOut.length - 2)] }else {
                    "> ist Falsch"
                    $Points+=25137
                    $i = $line.Length
                } 
            }
            Default {}
        }        
    }  
}
$points