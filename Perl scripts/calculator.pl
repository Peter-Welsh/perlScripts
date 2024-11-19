#Calculator
use Switch;

START:
do{
	print "[A]ddition, [S]ubstraction, [M]ultiplication, or [D]ivision?\n";
	$q=<>;
	chomp($q);
	$q = lc($q);
}while(($q ne "a")&&($q ne "s")&&($q ne "m")&&($q ne "d"));
#won't accept anything other than 'a', 's', 'm', or 'd'

do{
	print "Enter your query: ";
	$x = <>;
	chomp($x);
}while(!(($x =~ '\+')||($x =~ '\-')||($x =~ '\*')||($x =~ '\/')));
#won't accept anything that doesn't contain '+', '-', '*', or '/'

switch($q){
	case 'a' {
		@a = split('\+', $x);
		foreach my $g (@a){
			$ans += $g;
		}
	}
	case 's' {
		@a = split('\-', $x);
		$ans = 2 * @a[0];
		foreach my $g (@a){
			$ans -= $g;
		}
	}
	case 'm' {
		@a = split('\*', $x);
		$ans = 1;
		foreach my $g (@a){
			$ans *= $g;
		}
	}
	case 'd' {
		@a = split('\/', $x);
		$ans = @a[0] * @a[0];
		foreach my $g (@a){
			$ans /= $g;
		}
	}
}

print "$x = $ans";

print "\nAgain? (Y/N) ";
$in=<>;
if(!($in =~ "n"||$in =~ "N")){
	for(1..80){print chr(196);}
	goto START;
}