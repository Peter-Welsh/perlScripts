#simple shift cypher for encoding and decoding
#Oct 3, 2016

use Switch;
use threads;

$offset = 18; #must be between 0 and 26

print "encode or decode? ";
$input = <>;
if(!($input =~ "de")){
	print "enter your message to encode: ";
	$input = <>;
	$i = 0;
	chomp($input);
	@chars = split("", $input);

	foreach (@chars){
		@chars[$i] = ord(@chars[$i]);
	
		$i++;
	}

	print "Original: ";
	print $input;

	print "\nEncoded: ";
	$i=0;
	foreach(@chars){
		if((@chars[$i] >=65 && @chars[$i] <=90) || (@chars[$i] >= 97 && @chars[$i] <= 123)){
			if(!($chars[$i] >=65 && $chars[$i] <=90) && @chars[$i]+$offset >= 123){
				print chr(@chars[$i] + $offset - 26);
			}
			elsif(!($chars[$i] >=97 && $chars[$i] <=122) && @chars[$i]+$offset >= 91){
				print chr(@chars[$i] + $offset - 26);
			}
			else{
				print chr(@chars[$i] + $offset);
			}

		}
		else {
			print chr(@chars[$i]);
		}
		$i++;
	}
}
else{
	print "enter your message to decode: ";
	$input = <>;
	$i = 0;
	chomp($input);
	@chars = split("", $input);

	foreach (@chars){
		@chars[$i] = ord(@chars[$i]);
	
		$i++;
	}

	print "Encoded: ";
	print $input;

	print "\nOriginal: ";
	$i=0;
	foreach(@chars){
		if((@chars[$i] >=65 && @chars[$i] <=90) || (@chars[$i] >= 97 && @chars[$i] <= 123)){
			if(!($chars[$i] >=65 && $chars[$i] <=90) && @chars[$i]-$offset <= 96){
				print chr(@chars[$i] - $offset + 26);
			}
			elsif(!($chars[$i] >=97 && $chars[$i] <=122) && @chars[$i]-$offset <= 64){
				print chr(@chars[$i] - $offset + 26);
			}
			else{
				print chr(@chars[$i] - $offset);
			}

		}
		else {
			print chr(@chars[$i]);
		}
		$i++;
	}
}
	

