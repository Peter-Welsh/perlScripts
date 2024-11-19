#foobar
#oct 24, 2016

use Switch;
use threads;

print "Enter an integer: ";
$input = <>;
chomp($input);

for(1..$input){
	if($_ % 3 == 0 || $_ % 5 == 0){
		if($_ % 3 == 0){
			print 'foo';
		}
		if($_ % 5 == 0){
			print 'bar';
		}
	}
	else{
		print ''+$_;
	}
	print "\n";
}
