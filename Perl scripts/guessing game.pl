#Guessing Game
print "	Press any key to play. For info, type \"info\"\n: ";
$d=<>;

if($d eq "info\n"){
	print "	**** Created by Peter Welsh 8 September 2014 ****\n
	If at any time you'd like to quit, type 0 and hit enter.\n 
	To play regular mode, press any key.\n
	For color mode, type \"color\".\n: ";
			$e=<>;
			if($e eq "0\n"){
				goto QUIT;
			}
			COLOR:
			if($e eq "color\n"){
				@color = ("red\n", "orange\n", "yellow\n", "green\n", "blue\n", "indigo\n", "violet\n");
				
				#selects a random entry from the array
				$g = $color[rand @color];

				print "\nTry to guess what color I'm thinking of.\n: ";
				COLOR2:
				$f=<>;
				if($f eq "0\n"){
					goto QUIT;
				}

				if($f eq $g){
					print "\nThat's right! Want to play again?\n: ";
					$h=<>;
					if($h eq "y\n"||$h eq "Y\n"||$h eq "yes"||$h eq "YES"||$h eq "of course"||$h eq "yeah"){
						goto COLOR;
					}
					else{
						goto QUIT;
					}

				}
				else{
					print "\nNot quite. Try again.\n: ";
					goto COLOR2;
				}
			}
}

do{
	print "\nI'm thinking of a number between 1 and 100. Try to guess what it is.\n";
	$b=0;
	$x = int rand(100)+1;

	do{
		do{
			print ": ";
			$a=<>;
		}while($a eq "\n");

		if($a=="0\n"){
			goto QUIT;
		}

		$b++;

		if($a==$x){
			print "\nYou got it! ";
			if($b==1){
				print "And on your first try, too! NICE.";
			}
			elsif($b<=6){
				print "And it only took you $b tries!";
			}
			elsif($b<=14){
				print "It took you $b tries.";
			}
			elsif($b>=15){
				print "But it took you $b guesses?! Were you even trying?";
			}
		}
		else{
			print "\nNope! ";
			if($a>$x){
				print "Lower.\n"
			}
			else{
				print "Higher.\n"
			}
		}

	}while($a!=$x&&$a!=0);

	#Executes after getting a correct guess
	print "\n\nWould you like to play again? (Y/N): ";
	$c=<>;

}while(!($c =~ "n"||$c eq "0\n") && $a);

QUIT:
print "\nThanks for playing! Bye.\n"