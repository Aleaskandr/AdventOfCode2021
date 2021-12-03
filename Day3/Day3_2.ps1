$in=$OGR =$CSR= Get-Content .\Day3_input.txt
for ($i = 0; $i -lt $in[0].Length; $i++) {
    $OGR0count = $OGR1count = $CSR0count = $CSR1count = 0
    if ($OGR.Length -gt 1 ) {
        for ($j = 0; $j -lt $OGR.Length; $j++) { 
            if (($OGR[$j][$i]) -eq "1") {
                $OGR1count++ 
            }
            else {
                $OGR0count++
            }
        }
        if ($OGR1count -ge $OGR0count) {
            [array]$OGR = $OGR | ForEach-Object { $_ | Where-Object { $_[$i] -eq "1" } }
        }
        else {
            [array]$OGR = $OGR | ForEach-Object { $_ | Where-Object { $_[$i] -eq "0" } }
        }
    }   
    if ($CSR.Length -gt 1 ) {
        for ($k = 0; $k -lt $CSR.Length; $k++) {
            if (($CSR[$k][$i]) -eq "1") {
                $CSR1count++ 
            }
            else {
                $CSR0count++
            }
        }
        if ($CSR1count -ge $CSR0count) {
            [array]$CSR = $CSR | ForEach-Object { $_ | Where-Object { $_[$i] -eq "0" } }
        }
        else {
            [array]$CSR = $CSR | ForEach-Object { $_ | Where-Object { $_[$i] -eq "1" } }
        }
    }
}
[convert]::ToInt32($OGR, 2) * [convert]::ToInt32($CSR, 2)


