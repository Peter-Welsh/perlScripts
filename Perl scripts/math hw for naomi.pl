use Switch;
use threads;
#math hw for naomi 8/29/16

$i=00000;
$j=0;

until ($i > 22222){

	if($i<10){
		print "0000";
	}
	elsif($i<100){
		print "000";
	}
	elsif($i<1000){
		print "00";
	}
	elsif($i<10000){
		print "0";
	}
	print $i;

	$j++;
	if($j==10){
		print "\n";
		print chr(196) x 77;
		print "\n";
		$j=0;
	}

	if($i % 10000 >= 2222){
		$i = $i+7000;
	}

	if($i % 1000 >= 222){
		$i = $i+700;
	}

	if($i % 100 >= 22){
		$i = $i+70;
	}

	if ($i % 10 >= 2){
		$i = $i+7;
	}
	$i++;
	if($j!=0){
		print " ";
		print chr(179);
		print " ";
	}
}