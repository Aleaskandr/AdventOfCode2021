$in = Get-Content .\Day2_input.txt
$depth = 0
$horizontal = 0
$aim = 0

$in | ForEach-Object {
    $split = $_.split(" ")
    Switch ($split[0]) {
        "forward" {
            $horizontal += $split[1] 
            $depth += ($aim * $split[1])
        }
        "down" {          
            $aim += $split[1] 
        }
        "up" {
            $aim -= $split[1] 
        }
        Default {}
    }
}
$depth * $horizontal