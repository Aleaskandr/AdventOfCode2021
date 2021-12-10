
$in = Get-Content .\Day8_input.txt | ForEach-Object { (($_.split("|")[1]).trim()).split(" ") }
$count = 0
$in | ForEach-Object {
    switch ($_.Length) {
        { $_ -in 2, 4, 3, 7 } { $count++ }
        Default {}
    }
}
$count