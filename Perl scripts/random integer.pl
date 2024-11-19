#Random integer generator
START:
print "Lower end: ";
$l = <>;
print "Upper end: ";
$u = <>;
chomp($l,$u);

$num = rand($u-$l) + $l;

print int($num);

print "\nAgain? (Y/N) ";
$in=<>;
if(!($in =~ "n"||$in =~ "N")){
	for(1..80){print chr(196);}
	goto START;
}