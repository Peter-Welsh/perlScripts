#wordify

START:
print "Text: ";
$in=<>;

for(1..37){
	if($_ == 1){
		$r = "due to the fact that";
		$f = "because";
	}
	elsif ($_ == 2){
		$r = "provided an explanation";
		$f = "explained";
	}
	elsif ($_ == 3){
		$r = "during the time";
		$f = "when";
	}
	elsif ($_ == 4){
		$r = "it was my intention";
		$f = "I planned";
	}
	elsif ($_ == 5){
		$r = "first and foremost";
		$f = "foremost";
	}
	elsif ($_ == 6){
		$r = "canceled production of";
		$f = "canceled";
	}
	elsif ($_ == 7){
		$r = "balsa wood";
		$f = "balsa";
	}
	elsif ($_ == 8){
		$r = "best ever";
		$f = "best";
	}
	elsif ($_ == 9){
		$r = "gather together";
		$f = "gather";
	}
	elsif ($_ == 10){
		$r = "fall down";
		$f = "fall";
	}
	elsif ($_ == 11){
		$r = "Due to the fact that";
		$f = "Because";
	}
	elsif ($_ == 12){
		$f = "necessary";
		$r = "absolutely necessary";
	}
	elsif ($_ == 13){
		$f = "facts";
		$r = "actual facts";
	}
	elsif ($_ == 14){
		$f = "forward";
		$r = "advance forward";
	}
	elsif ($_ == 15){
		$f = "planning";
		$r = "advance planning";
	}
	elsif ($_ == 16){
		$f = "preview";
		$r = "advance preview";
	}
	elsif ($_ == 17){
		$f = "reservations";
		$r = "advance reservations";
	}
	elsif ($_ == 18){
		$f = "warning";
		$r = "advance warning";
	}
	elsif ($_ == 19){
		$f = "fundamentals";
		$r = "basic fundamentals";
	}
	elsif ($_ == 20){
		$f = "add";
		$r = "add up";
	}
	elsif ($_ == 21){
		$f = "bonus";
		$r = "added bonus";
	}
	elsif ($_ == 22){
		$f = "yes";
		$r = "affirmative yes";
	}
	elsif ($_ == 23){
		$f = "aid";
		$r = "aid and abet";
	}
	elsif ($_ == 24){
		$f = "record";
		$r = "all-time record";
	}
	elsif ($_ == 25){
		$f = "choice";
		$r = "alternative choice";
	}
	elsif ($_ == 26){
		$f = "A.M.";
		$r = "A.M. in the morning";
	}
	elsif ($_ == 27){
		$f = "etc.";
		$r = "and etc.";
	}
	elsif ($_ == 28){
		$f = "stranger";
		$r = "anonymous stranger";
	}
	elsif ($_ == 29){
		$f = "anniversary";
		$r = "annual anniversary";
	}
	elsif ($_ == 30){
		$f = "gunman";
		$r = "armed gunman";
	}
	elsif ($_ == 31){
		$f = "prosthesis";
		$r = "artificial prosthesis";
	}
	elsif ($_ == 32){
		$f = "ascend";
		$r = "ascend up";
	}
	elsif ($_ == 33){
		$f = "ask";
		$r = "ask the question";
	}
	elsif ($_ == 34){
		$f = "assemble";
		$r = "assemble together";
	}
	elsif ($_ == 35){
		$f = "attach";
		$r = "attach together";
	}
	elsif ($_ == 36){
		$f = "ATM";
		$r = "ATM machine";
	}
	elsif ($_ == 37){
		$f = "autobiography";
		$r = "autobiography of their own life";
	}

	chomp($in);
	@a  = split($f, $in); #will print result text
	@aa = split($f, $in);
	@aaa= split(undef, $in);

	if($in eq $f){ #if the input is what we're looking for
		@a = $r;
	}
	else{
		for(@a){
			$_ .= $r;
		}
	}

	if($aaa[-1] eq $f){ #if the last character is what we're looking for, don't replace
		print "";
	}
	else{
		$a[-1] = $aa[-1]; #fixes the problem of appending to the last element
	}

	$in = join("", @a);
}

print @a;

print "\nAgain? (Y/N) ";
$in=<>;
if(!($in =~ "n"||$in =~ "N")){
	for(1..80){print chr(196);}
	goto START;
}