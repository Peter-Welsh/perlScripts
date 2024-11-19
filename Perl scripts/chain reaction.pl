#Chain Reaction
#begun June 29, 2015
#continued July 2, 2015

@chain1 = qw(crack open sesame street smart cookie monster);
@chain2 = qw(dirty bomb shell game cock sure thing);
@chain3 = qw(half dead duck down turn pro war);
@chain4 = qw(glass bubble bath tub stained teeth marks);
@chain5 = qw(gone mad dog food chain mail fraud);
@chain6 = qw(child birth day after school shopping cart);
@chain7 = qw(private benjamin franklin mint tea caddy shack);
@chain8 = qw(house fly away game time sensitive guy);
@chain9 = qw(hidden talent scout leader board meeting place);
@chain10 = qw(lightning quick step father figure skating rink);
@chain11 = qw(wire tap water gun shy guy talk);
$turn = 0; #number of guessed words
$loopBool = 1;

print "Connect the word \"";

print $first = $chain1[0];

print "\" with the word \"";

print $last = $chain1[6], "\"\n\n";
$top = $first;
$bot = $last;

@board = ($first, "_", "_", "_", "_", "_", $last);
while($loopBool){
	printBoard();
	overUnder();
	printBoard();
	getGuess();
	if($turn == 5){
		$loopBool = 0;
		printBoard();
		print "\nYou win. Congratulations.\n";
	}
}

sub overUnder {
	print "\nA letter below " . $top . " or above " . $bot . "? ";
	$lastOU = $overUnder;
	$overUnder = <>;
	if($lastOU =~ "low" && !($overUnder =~ "low")){
		$turn--; #error correction
	}
	if($turn == 0){
		if($overUnder =~ "low"){
			$board[1] = substr($chain1[1], 0, 1);
		}
		else{
			$board[5] = substr($chain1[5], 0, 1);
		}
	}
	elsif($turn == 1){
		if($overUnder =~ "low"){
			$board[2] = substr($chain1[2], 0, 1);
		}
		else{
			$board[4] = substr($chain1[4], 0, 1);
		}
	}
	elsif($turn == 2){
		$board[3] = substr($chain1[3], 0, 1);
	}
	elsif($turn == 3){
		if($overUnder =~ "low"){
			$board[4] = substr($chain1[4], 0, 1);
		}
		else{
			$board[2] = substr($chain1[2], 0, 1);
		}
	}
	elsif($turn == 4){
		if($overUnder =~ "low"){
			$board[5] = substr($chain1[5], 0, 1);
		}
		else{
			$board[1] = substr($chain1[1], 0, 1);
		}
	}
}


sub getGuess {
	print "\nWhat's your guess? ";
	$guess = <>;
	chomp($guess);
	if($guess eq $chain1[1]){
		$board[1] = $chain1[1];
		$turn++;
		$top = $chain1[1];
	}
	elsif($guess eq $chain1[2]){
		$board[2] = $chain1[2];
		$turn++;
		$top = $chain1[2];
	}
	elsif($guess eq $chain1[3]){
		$board[3] = $chain1[3];
		$turn++;
		$top = $chain1[3];
	}
	elsif($guess eq $chain1[4]){
		$board[4] = $chain1[4];
		$turn++;
		$top = $chain1[4];
	}
	elsif($guess eq $chain1[5]){
		$board[5] = $chain1[5];
		$turn++;
		$top = $chain1[5];
	}
}

sub printBoard{
	foreach (@board){
		print $_;
		print "\n";
	}
}