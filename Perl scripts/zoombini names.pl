#zoombinis name generator
#April 4 - 6, 2015

#edit May 29, 2015: more comments
#edit May 30, 2015: +arrays with allowed consecutive letters
#thinking about how to implement restrictions on consecutive letters
#edit June 3, 2015: banned certain consonant pairs but now short, vowel-heavy names are too frequent

#Rules:
#1. Names must be between 4 and 9 characters
#2. Names must end with a vowel
#3. Names must not contain double letters (exceptions: O, E, N, U)
#4. Names must not contain three consecutive consonants or (#4.5) three consecutive vowels
#5. Q must be followed by a vowel.

@vowels = qw(A E I O U Y);
@consonants = qw(B C D F G H J K L M N P Q R S T V W X Z);
@letters = qw(A B C D E F G H I J K L M N O P Q R S T U V W X Z);
@allowedDoubles = qw(O E N U);
@doubleConsonants = qw(BL BR CH CL CR DR DW FL FR GH GL GR KL KN KR LD MP ND NH PH PL PR RH RN SC SL SM SN SP SR ST SW TH TR TW WR);
@doubleVowels = qw(AE AI AU EA EE EI IA IE IO OO OU UA UO YA YE YO);
$input = "";
$letter = "0";
$prevLetter = "1";
$pprev = "2";

while(!($input =~ "q")&&!($input =~ "Q")){
	RESET:
	$length = int(rand(6)+4); # Rule 1
	$last = $length - 1;
	$name = "";

	for(1..$length){
		$iter = $_;
		$pprev = $prevLetter; #pprev is last last letter
		$prevLetter = $letter;
		if(($prevLetter eq "Q") || # Rule 5
		   ($prevLetter ~~ @consonants && $pprev ~~ @consonants) || #Rule 4
		   ($iter == $length)){ #Rule 2
			$letter = $vowels[rand @vowels];
			#pick a vowel if last was a Q or to break a consonant streak
			#or if this is the last letter of the name
		}
		elsif($prevLetter ~~ @vowels && $pprev ~~ @vowels){#Rule 4.5
			$letter = $consonants[rand @consonants];
			#pick a consonant to break a vowel streak
		} 
		else{
			do{
				$letter = $letters[rand @letters];
				#pick a random letter
			}while($prevLetter eq $letter && !($prevLetter ~~ @allowedDoubles)); # Rule 3
		}

		if($prevLetter ~~ @consonants && $pprev ~~ @consonants){
			$doubleCon = $pprev . $prevLetter; #temp var for storing consonant pair
			if(!($doubleCon ~~ @doubleConsonants)){
				goto RESET; #scratch it all and restart if you get a bad cons pair
			}
		}
		
		$name = $name . $letter; # append the letter to the end of the name
	}

	print $name;
	$input = <>;
}