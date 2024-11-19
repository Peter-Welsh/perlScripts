#Prime Number
START:
$limit = 250;

print "\nType \"a\" to see a list of all the prime numbers up to $limit
or type in a number to see whether it's prime: ";
$userInput = <>;
chomp($userInput); #gets rid of newline at end of string
$divisor = 1;
$primeBool = 0;
if($userInput eq "a"){
	$testCase = 1;
	while($testCase<$limit){
		$divisor = 1;
		$primeBool = 0;
		while($testCase>$divisor){
			if(($testCase%$divisor)==0){
				$primeBool++;
			}
			$divisor++;
		}
		if($primeBool==1){
			print "$testCase\n";
		}
		$testCase++;
	}
}
else{
	if(($userInput%2==0&&$userInput!=2)||($userInput%3==0&&$userInput!=3)||($userInput%5==0&&$userInput!=5)){
		print "\nNo, $userInput is not prime.\n";
		goto AGAIN;
	}
	while($userInput>$divisor){
		if(($userInput%$divisor)==0){
			$primeBool++;
		}
		$divisor += 2;
	}

	if($primeBool!=1){
		print "\nNo, $userInput is not prime.\n";
	}
	else{
		print "\nYes, $userInput is prime.\n";
	}

	AGAIN:
	print "\nWant start over? (Y/N)\n";
	$userInput=<>;
	if($userInput ne "n\n"&&$userInput ne "N\n"){
		goto START;
	}
}

$userInput=<>;