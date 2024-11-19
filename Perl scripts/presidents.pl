#Presidents

#created July 18, 2015
#July 19, 2015 - letting user quit and restart mid-game

@presidents = ("George Washington", "John Adams", "Thomas Jefferson", "James Madison", "James Monroe", "John Quincy Adams", "Andrew Jackson", "Martin Van Buren", "William H. Harrison", "John Tyler", "James K. Polk", "Zachary Taylor", "Millard Fillmore", "Franklin Pierce", "James Buchanan", "Abraham Lincoln", "Andrew Johnson", "Ulysses S. Grant", "Rutherford B. Hayes", "James A. Garfield", "Chester A. Arthur", "Grover Cleveland", "Benjamin Harrison", "Grover Cleveland", "William McKinley", "Theodore Roosevelt", "William H. Taft", "Woodrow Wilson", "Warren G. Harding", "Calvin Coolidge", "Herbert Hoover", "Franklin D. Roosevelt", "Harry S. Truman", "Dwight D. Eisenhower", "John F. Kennedy", "Lyndon B. Johnson", "Richard M. Nixon", "Gerald R. Ford", "Jimmy Carter", "Ronald Reagan", "George H. W. Bush", "Bill Clinton", "George W. Bush", "Barack H. Obama");
@presidents2 = ("Washington", "Adams", "Jefferson", "Madison", "Monroe", "Adams", "Jackson", "Van Buren", "Harrison", "Tyler", "Polk", "Taylor", "Fillmore", "Pierce", "Buchanan", "Lincoln", "Johnson", "Grant", "Hayes", "Garfield", "Arthur", "Cleveland", "Harrison", "Cleveland", "McKinley", "Roosevelt", "Taft", "Wilson", "Harding", "Coolidge", "Hoover", "Roosevelt", "Truman", "Eisenhower", "Kennedy", "Johnson", "Nixon", "Ford", "Carter", "Reagan", "Bush", "Clinton", "Bush", "Obama");

print "Presidents Quiz";
START:
$number = 1;
$guess = "";
$score = 0;
print "\nFull names or last names? > ";
$mode=<>;
$mode = lc($mode);
chomp($mode);
if($mode eq "full" | $mode eq "full names" | $mode eq "f"){
	print "Enter the full name of the president corresponding to each number:\n";
	play(@presidents);
}
elsif($mode eq "last" | $mode eq "last names" | $mode eq "l"){
	print "Enter the last name of the president corresponding to each number:\n";
	play(@presidents2);
}
else{
	goto START;
}

print "Your score is $score.";
if($score == 44){
	print " Congratulations! You got them all right!";
}
elsif($score > 35){
	print " You only missed ", (44 - $score), ". Keep trying!";
}
print "\nPlay again? (Y/N) > ";
$again=<>;
if(!(lc($again) eq "n\n") && !(lc($again) eq "no\n")){
	goto START;
}

sub play{
	for(@_){
		print $number, " > ";
		$guess=<>;
		$guess = lc($guess);
		chomp($guess);
		if($guess eq lc($_[--$number])){
			print "Correct!\n";
			$score++;
		}
		elsif($guess eq ""){
			print "It's $_[$number].\n";
		}
		elsif($guess eq "quit" | $guess eq "q"){
			last;
		}
		elsif($guess eq "start over" | $guess eq "restart"){
			goto START;
		}
		else{
			print "No, it's $_[$number].\n";
		}
		$number+=2;
	}
}