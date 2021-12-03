$epsilonrate = ""
$gammarate = ""
$in = Get-Content .\Day3_input.txt
for ($i = 0; $i -lt $in[0].Length; $i++) {
    $0count = 0
    $1count = 0
    for ($j = 0; $j -lt $in.Length; $j++) {
        if (($in[$j][$i]) -eq "1") {
            $1count++ 
        }
        else {
            $0count++
        }
    }
    if ($1count -gt $0count) {
        $gammarate += "1"
        $epsilonrate += "0"
    }
    else {
        $epsilonrate += "1"
        $gammarate += "0"
    }
}
[convert]::ToInt32($epsilonrate, 2) * [convert]::ToInt32($gammarate, 2)

