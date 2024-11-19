#Hangman game
#created December 3, 2014
#last edit: December 13, 2014
#edit April 8, 2015: default switched from hard to easy

print "How many players?\n>";
$players = <>;

print "What difficulty? (Easy or Hard)\n>";
$difficulty = <>;
$difficulty = lc($difficulty);
chomp($difficulty);

START:
$score = 0; #like golf, a low score is good
$firstIter = true;
$i = 0;
$input = "";
@dictionary=""; #contains every word in the file
@guess = ""; #array of underscores to be replaced by correctly guessed letters
@badGuess =""; #array for incorrectly guessed letters

if($players == 2){
    print "Enter word\n>";
    $word = <>;
    $word = lc($word);
    chomp($word);
}
else{
    print "What category?\n>";
    $category = <>;
    $category = lc($category);
    chomp($category);

    ##select dictionary, read the file, split it, and pick a random word
    if($category eq "at"||$category eq "adventure time"){
        open FILE, "<", "dcAT.txt" or die $!; #Adventure Time dictionary
    }
    elsif($category eq "pk"||$category eq "pokemon"){
        open FILE, "<", "dcPK.txt" or die $!; #Pokemon dictionary
    }
    elsif($category eq "an"||$category eq "animals"){
        open FILE, "<", "dcAN.txt" or die $!; #animals dictionary
    }
    elsif($category eq "cn"||$category eq "countries"){
        open FILE, "<", "dcCN.txt" or die $!; #countries dictionary
    }
    else{
        open FILE, "<", "dc.txt" or die $!; #Default dictionary
    }

    while (<FILE>) {
        @dictionary = split("~", $_); #split the dictionary by tilde
    }
    close FILE or die $!;

    $word = $dictionary[rand @dictionary]; #pick a random word from the dictionary
}

@chars = split(undef, $word); #split up the word character by character

for(@chars){
    if($_ eq " "){$guess[$i] = $_;} #if the word contains a space, put one in the guess array
    elsif($_ eq "-"){$guess[$i] = $_;} #if the word contains a hyphen, put one in the guess array
    elsif($_ eq "'"){$guess[$i] = $_;} #if the word contains an apostrophe, put one in the guess array
    elsif($_ eq "."){$guess[$i] = $_;} #if the word contains a period, put one in the guess array
    elsif($_ eq "&"){$guess[$i] = $_;} #if the word contains an ampersand, put one in the guess array
    else{$guess[$i] = "_";} #initialize @guess array with underscores
	$i++;
}

do{
	$i=0;

    ####replaces _s with already guessed letters####
	for(@guess){
		if($input eq lc($chars[$i])){
			$guess[$i] = $chars[$i]; #replaces underscores with already guessed letters
		}
		$i++;
	}

    ##checks if the guessed letter is in the word
    ##if it isn't, $score is incremented and the bad guess is noted
	unless(lc($word) =~ $input){ #if the guessed letter is in the word
		if($firstIter){
			$score++; #if the word does not contain the guessed letter, then $score is incremented
            unless($input ~~ @badGuess){ #do not add the same bad guess twice
                push @badGuess, $input; #push the bad guess into the array
            }
		}
	}

	print "\n" x 60;
 
    ##calls the function that prints the corresponding hangman based on $score
    if($score==0){h(0);}#score determines the ascii hangman printed to the screen
    if($score==1){h(1);}
    if($score==2){unless($difficulty eq "hard"){h(2);}else{h(3);}}
    if($score==3){unless($difficulty eq "hard"){h(3);}else{h(4);}}
    if($score==4){unless($difficulty eq "hard"){h(4);}else{h(6);}}
    if($score==5){unless($difficulty eq "hard"){h(5);}else{h(7);}}
    if($score==6){h(6);}
    if($score==7){h(7);}#hanged

    ##prints the underscores/guessed letters and bad guesses underneath those
	print "\n";
	$o = "@guess";
	print "@guess\n@badGuess";

    ##once $score gets too high, the player loses
    ##but if there no more underscores in the output, the player wins
    unless($difficulty eq "hard"){
        if($score > 6){goto LOSE;} #player has lost if s/he has guessed incorrectly 7 times on easy mode
    }
    else{
        if($score > 4){goto LOSE;} #player has lost if s/he has guessed incorrectly 5 times
    }
	unless($o =~ "_"){goto WIN;} #player has won if there are no unguessed letters left
    
    ##get the user's guess
    do{
        print "\n>";
    	$input = <>; #get the player's guess
    }while(length($input) != 2); #only allow 1 letter per guess (2 chars with newline)

    $input = lc($input);
    chomp($input);
	$firstIter = false;
}while(true);

WIN:
print "\nYou win!";
goto AGAIN;

LOSE:
print "\nYou lose! The word was \"$word.\"";

AGAIN:
print "\nPlay again? (Y/N)\n>";
$again=<>;
unless($again =~ 'n'||$again =~ 'N'){
	goto START;
}
exit;

sub h{
    if($_[0]==0){print "\n      _______\n     |/      |\n     |\n     |\n     |\n     |\n     |\n    _|___";}
    if($_[0]==1){print "\n      _______\n     |/      |\n     |      (_)\n     |\n     |\n     |\n     |\n    _|___";}
    if($_[0]==2){print "\n      _______\n     |/      |\n     |      (_)\n     |       |\n     |\n     |\n     |\n    _|___";}
    if($_[0]==3){print "\n      _______\n     |/      |\n     |      (_)\n     |      \\|\n     |\n     |\n     |\n    _|___";}
    if($_[0]==4){print "\n      _______\n     |/      |\n     |      (_)\n     |      \\|/\n     |\n     |\n     |\n    _|___";}
    if($_[0]==5){print "\n      _______\n     |/      |\n     |      (_)\n     |      \\|/\n     |       |\n     |\n     |\n    _|___";}
    if($_[0]==6){print "\n      _______\n     |/      |\n     |      (_)\n     |      \\|/\n     |       |\n     |      / \n     |\n    _|___";}
    if($_[0]==7){print "\n      _______\n     |/      |\n     |      (_)\n     |      \\|/\n     |       |\n     |      / \\\n     |\n    _|___";}
}