#Change-maker
#April 3, 2015
$quartersInChange = 0;
$dimesInChange = 0;
$nickelsInChange = 0;
$penniesInChange = 0;
print "Enter the amount in cents: ";
# $n = amount in cents
$n = <>;
chomp($n);

while($n >= 25){
	if ($n >= 25){
		$n -= 25;
	}
	$quartersInChange++;
}
while($n >= 10){
	if ($n >= 10){
		$n -= 10;
	}
	$dimesInChange++;
}
while($n >= 5){
	if ($n >= 5) {
		$n -= 5;
	}
	$nickelsInChange++;
}
while($n >= 1){
	if ($n >= 1) {
		$n -= 1;
	}
	$penniesInChange++;
}

print "Q: $quartersInChange, D: $dimesInChange, N: $nickelsInChange, P: $penniesInChange";