#Fibonacci

$a = 0;
$b = 1;
$lim = 20;
for(1..$lim){
	print "$a\n";
	$c = $a + $b;
	$a = $b;
	$b = $c;
}

$input=<>;