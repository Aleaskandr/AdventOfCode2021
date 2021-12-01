[int[]]$in = get-content .\Day1_input.txt
$increasedcount = 0
for ($i = 0; $i -lt $in.Count; $i++) {
    if ($($in[$i] + $in[$i + 1] + $in[$i + 2]) -lt $($in[$i + 1] + $in[$i + 2] + $in[$i + 3])) {
        $increasedcount += 1
    }
}
$increasedcount
 