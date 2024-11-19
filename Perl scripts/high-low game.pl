#Hi-Lo guessing game
use Switch;
@suits = ("hearts","diamonds","clubs","spades");
@suits2 = (3,4,5,6);

print ".: Hi-Lo :.\n",
"Press any key to continue or type \"info\" for rules.\n";
$userInput=<>;
$userInput = lc($userInput);
if($userInput =~ "info"){
	print "\nThe game starts with two cards:\n",
	"1 is yours, and the other is the computer's.\n",
	"You have to guess if the computer's card is higher or lower than yours.\n",
	"Aces are low.\n",
	"You can type \"h\" instead of \"high\".\n",
	"The deck is infinite, meaning you may encounter duplicate cards.";
}
$score=0;
START:

#deals your card
$myCard = int rand(13)+1;

#prohibits your card from being the same as the computer's
do{
	$npcCard = int rand(13)+1;
}while($myCard==$npcCard);

print "\nYour card: ";

switch($myCard){
	case 1 		{print "Ace"}
	case 11		{print "Jack"}
	case 12		{print "Queen"}
	case 13		{print "King"}
	else		{print $myCard}
}

suit();

#re-prompts until input has an H or an L
do{
	print "\nHigh or low?\n";
	$userInput=<>;
	$userInput = lc($userInput);
}while(!($userInput =~ "h"||$userInput =~ "l"));

#if your card is lower and you guessed high
if(($myCard>$npcCard)&&($userInput =~ "h")){
	goto LOSS;
}
#if your card is higher and you guessed low
elsif(($myCard<$npcCard)&&($userInput =~ "l")){
	goto LOSS;
}
else{
	print "Correct! ";
	npcCard();
	$score++;
	goto START;
}

LOSS:
print "\nGame over. ";
npcCard();

print "You scored $score point";
if($score!=1){ print "s";}

open FILE, "<", "hs.txt" or die $!;
while (<FILE>) {
	if($_ < $score){
		close FILE or die $!;
		open FILE, ">hs.txt" or die $!;
		print FILE $score;
		print ". That's a new record!\n";
	}
	else{
		print ". The high score is ", $_, ".\n";
	}
	close FILE or die $!;
}

print "\tPlay again? (Y/N) ";
$userInput=<>;
$userInput = lc($userInput);
if(!($userInput =~ "n")){
	$score=0;
	goto START;
}


sub npcCard{
	print "The card was a";

	switch($npcCard){
		case 1		{print "n Ace"}
		case 8		{print "n $npcCard"}
		case 11		{print " Jack"}
		case 12		{print " Queen"}
		case 13		{print " King"}
		else		{print " ", $npcCard}
	}
	suit();

	print ".\n";
}

#Will assign a random suit to card... does not account for duplicates
sub suit{
	$x = rand @suits2;
	$suit2 = $suits2[$x];
	$suit = $suits[$x];
	$suit2 = chr($suit2);
	print " of $suit $suit2";
}