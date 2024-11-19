#Sort Integers via Bubble sort
#Dec 9, 2016
#Peter Welsh

$input = <>; #get input from console
chomp($input); #delete whitespace

@ints = split(undef, $input); #split string into array
$temp;

# $#ints is the last index of @ints
for my $i (0 .. $#ints){
	for my $j (0 .. $#ints - 1 - $i){

		if ($ints[$j] > $ints[$j + 1]){
			$temp = $ints[$j];
			$ints[$j] = $ints[$j + 1];
			$ints[$j+1] = $temp;
		}
	}
}

print "@ints";