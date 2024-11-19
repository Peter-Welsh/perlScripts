#Factorial
do{
	do{
		print "Find the factorial of: ";
		$a=<>;
		chomp($a);
		if((int($a)-$a) != 0){
			print "Whole numbers only, please\n";
		}
	}while((int($a)-$a) != 0);

	if($a>170){
		print "Sorry, $a! is too large.";
	}
    else{
    	$f = 1;
    	print "$a! = ";
    	while($a > 0){
    		$f = $f*$a;
    		$a--;
    	}
        commify($f);
    }

	print "\nAgain? ";
	$a=<>;
    $a = lc($a);
}while(!($a=~"no")&&$a ne "0\n"&&$a ne "n\n");

sub commify {
    $f = reverse $_[0];
    $f =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
    print scalar reverse $f;
}