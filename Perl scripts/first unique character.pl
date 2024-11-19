$in = <>; #string
chomp($in);
@split = split(undef, $in); #array of chars
@split2 = @split; #array of chars
@count; #array of ints
$letter; #string
$done; #bool
$i=0; #int

for(@split){
	for(@split2){
		if($_ eq $split[$i]){
			$count[$i]++;
		}
	}

	if($count[$i] == 1){
		$letter = $split[$i];
		$done = true;
	}

	if($done){
		last;
	}
	else{
		$letter = "no unique character found";
	}

	$i++;
}

print($letter);