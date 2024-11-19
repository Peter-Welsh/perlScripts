#Reverse string
#Dec 9, 2016
#Peter Welsh

$input = <>;

chomp($input);
@input = split(undef, $input);
$stringRev;

for(0 .. $#input){
	$stringRev .= pop(@input);
}

print $stringRev;