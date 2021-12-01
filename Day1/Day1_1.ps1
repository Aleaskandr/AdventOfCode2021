[int[]]$in = get-content .\Day1_input.txt
$increasedcount = 0
for ($i = 0; $i -lt $in.Count; $i++) {
    if ($in[$i] -lt $in[$i + 1]) { $increasedcount += 1 }
}
$increasedcount
