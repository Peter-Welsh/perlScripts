#july 7, 2015 - rough draft complete (no banker)
#july 8, 2015 - banker added; commify added
#july 9, 2015 - banker offer tweaked (still needs work); overoffering glitch fixed
#			  - +view what your case contained after taking an offer
#july 11, 2015 - +rounding
#july 12, 2015 - +"play again?"; v1.1 released... and v1.2
#july 14, 2015 - now banker cannot offer $0 (due to rounding); v1.3 released
#july 15, 2015 - v1.3.1 released - banker will accept punctuation with "deal" (and "ok")
#			   - sleep times tweaked
#			   - v1.3.2 released
#july 16, 2015 - +model names, v1.4 released
#july 18, 2015 - small redundancy in code removed

@models = qw(Claudia Stacey Lisa Keltie Ursula Megan Sara Lauren Patricia Anya Katie Jill Leyla Pilar Brooke Kasie Jenelle Marisa Mylinda Alike Tameka Lianna Aubrie Kelly Hayley Lindsay);
do{
	@numbers = (1..26);
	@board = (.01, 1, 5, 10, 25, 50, 75, 100, 200, 300, 400, 500, 750, 1000, 5000, 10000, 25000, 50000, 75000, 100000, 200000, 300000, 400000, 500000, 750000, 1000000);
	$iter = 0;
	$index = 0;
	$case = 1;
	$numbersOnBoard = 0;
	$deal = "";
	@inds = ['',''];
	$casesToOpen = 6;
	@usedModels = ['',''];

	print "\n\n\n\n\n\n\nPick your starting case (1-26). ";
	$case=<>;
	chomp($case);
	$case -= 1;
	delete $numbers[$case];
	for(1..26){
		print "\n";
		printCases();
		print "\n\n";
		printBoard();
		print "\n";
		if($_!=26){
			if($_ == 7 | $_ == 12 | $_ == 16 | $_ == 19 | $_ == 21 | $_ > 21){
				print "The bank offers you \$";
				if($_ == 7){ #round 1
					$bankOffer *= (1/6); #scaling offer based on round
				}
				elsif($_ == 12){ #round 2
					$bankOffer *= (2/6); #scaling offer based on round
				}
				elsif($_ == 16){ #round 3
					$bankOffer *= (3/6); #scaling offer based on round
				}
				elsif($_ == 19){ #round 4
					$bankOffer *= (4/6); #scaling offer based on round
				}
				elsif($_ == 21){ #round 5
					$bankOffer *= (5/6); #scaling offer based on round
				}
				round($bankOffer);
				commify($bankOffer);
				if($_ == 7){ #round 1
					$casesToOpen = 5;
				}
				elsif($_ == 12){ #round 2
					$casesToOpen = 4;
				}
				elsif($_ == 16){ #round 3
					$casesToOpen = 3;
				}
				elsif($_ == 19){ #round 4
					$casesToOpen = 2;
				}
				elsif($_ == 21){ #round 5
					$casesToOpen = 1;
				}
				else{ #rounds 6-10
					$casesToOpen = 1;
				}
				print ". Deal or no deal? > ";
				$deal=<>;
				chomp($deal);
				$deal = lc($deal);
				if($deal eq "deal" | $deal eq "yes" | $deal eq "ok" | $deal eq "deal." | $deal eq "deal!"){
					last; #exit the for loop
				}
			}
			do{
				print "You have $casesToOpen case";
				unless($casesToOpen == 1){
					print "s";
				}
				print " to open. Pick your next case. > ";
				$case=<>;
			}while(!($case ~~ @numbers)); #keep asking for input until they give a valid number
			$casesToOpen--;
			chomp($case);
			delete $numbers[--$case];
			do{
				$ind = int rand(26); #picks an index between 1 and 26, used later to..
				}while($ind ~~ @inds); #..determine the dollar amount the selected case holds
			for (@board){
				unless($_ eq '' | $_ == $board[$ind]){
					$sum += $_;
					$numbersOnBoard++;
				}
			}
			push @inds, $ind; #store the randomly picked number in @inds
			print "\n\n\n\n\n\n\n";
			do{
				$modelName = $models[rand @models];
				}while($modelName ~~ @usedModels);
			print $modelName;
			push @usedModels, $modelName;
			print "\'s case contained \$";
			commify($board[$ind]);
			print ".\n\n";
			delete $board[$ind];
			$bankOffer = int($sum / $numbersOnBoard);
			$sum = 0;
			$numbersOnBoard = 0;
		}
		else{
			yourCaseContained();
		}
	}
	if($deal eq "deal" | $deal eq "yes" | $deal eq "ok" | $deal eq "deal." | $deal eq "deal!"){
		sleep 1;
		print "\nYou took the bank's offer of \$";
		commify($bankOffer);
		print ".\n\n";
		yourCaseContained();
		if($yourCase < $bankOffer){
			sleep 1;
			print "\nYou made a good deal.\n";
		}
		else{
			sleep 1;
			print "\nYou made a rough deal.\n";
		}
	}
	elsif($yourCase == 1000000){
		sleep 1;
		print "\nCongratulations!\n";
	}
	elsif($yourCase == 750000){
		sleep 1;
		print "\nCongratulations.\n";
	}
	elsif($yourCase == 500000){
		sleep 1;
		print "\nWell done.\n";
	}
	elsif($yourCase == 400000){
		sleep 1;
		print "\nGood show.\n";
	}
	elsif($yourCase == 300000){
		sleep 1;
		print "\nNot too shabby.\n";
	}
	elsif($yourCase == 200000){
		sleep 1;
		print "\nDon't spend it all in one place, now, you hear?\n";
	}
	elsif($yourCase < 1000 and $yourCase > 1){
		sleep 1;
		print "\nOuch. Better luck next time.\n";
	}
	elsif($yourCase < 1){
		sleep 1;
		print "\nYou're not very good at this, are you?\n";
	}
	sleep 2;
	print "\nPlay again? (Y/N) > ";
	$again = <>;
	chomp($again);
	$again = lc($again);
}while(!($again eq "n" | $again eq "no"));

sub printCases{ #prints the cases still in play
	for(@numbers){
		print $_;
		unless($_ eq ""){print " ";}
		if($_<10){print " ";}
		if(++$iter%9 == 0 && $iter > 7){
			print "\n";
		}
	}
	$iter = 0;
}

sub printBoard{ #prints the dollar amounts
	for(1..13){
		print "\$ ", $board[$index], "\t  |\t\$ ";
		commify($board[$index+13]);
		print "\n";
		$index++;
	}
	$index = 0;
}

sub commify { #puts commas in the number passed to it
	$f = reverse $_[0];
	$f =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
	print scalar reverse $f;
}

sub round { #rounds down to the nearest 100 (or nearest 10 if <1000)
	if($_[0] > 999){
		$_[0] /= 100; 
		$_[0] = int($_[0]); #int casting to remove cents
		$_[0] *= 100;
	}
	elsif($_[0] < 1000 and $_[0] > 99){
		$_[0] /= 10;
		$_[0] = int($_[0]); #int casting to remove cents
		$_[0] *= 10;
	}
	else{
		$_[0] = int($_[0]); #int casting to remove cents
	}
	$bankOffer = $_[0];
}

sub yourCaseContained {
	@casesRemaining = splice(@board);
	do{
		$yourCase = $casesRemaining[rand @casesRemaining]; #cycle through the empty ones
	}while($yourCase eq "");
	print "Your case contained \$";
	sleep 1; #sleep pauses output according to the position of newlines
	commify($yourCase);
	print ".\n";
}