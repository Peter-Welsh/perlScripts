#Peter Welsh
#April 3, 2015
use Switch;

$i = 0;
@asciis = "";

$text = <>; #get input
chomp($text); #get rid of newline

@separate = split(undef, $text); #split up input character by character
print "\nChar\tFreq\tCode\n";

# populate @asciis array with ascii number equivalent of each letter
for(@separate){
	@asciis[$i] = ord($separate[$i]);
	$i++;
}

# counts the number of occurrences of each letter in the string
for(@asciis){
	switch($_){
		case 32 {$num_s++;}
		case 97 {$numAs++;}
		case 98 {$numBs++;}
		case 99 {$numCs++;}
		case 100 {$numDs++;}
		case 101 {$numEs++;}
		case 102 {$numFs++;}
		case 103 {$numGs++;}
		case 104 {$numHs++;}
		case 105 {$numIs++;}
		case 106 {$numJs++;}
		case 107 {$numKs++;}
		case 108 {$numLs++;}
		case 109 {$numMs++;}
		case 110 {$numNs++;}
		case 111 {$numOs++;}
		case 112 {$numPs++;}
		case 113 {$numQs++;}
		case 114 {$numRs++;}
		case 115 {$numSs++;}
		case 116 {$numTs++;}
		case 117 {$numUs++;}
		case 118 {$numVs++;}
		case 119 {$numWs++;}
		case 120 {$numXs++;}
		case 121 {$numYs++;}
		case 122 {$numZs++;}
	}
}

# outputs the letters next to their number of occurrences
for(" ", "a".."z"){
	if(ord($_) ~~ @asciis){
		print $_, "\t";

		switch(ord($_)){
				case 32	{print $num_s, "\t111";}
				case 97 {print $numAs, "\t1011";}
				case 98 {print $numBs, "\t011000";}
				case 99 {print $numCs, "\t00001";}
				case 100 {print $numDs, "\t01101";}
				case 101 {print $numEs, "\t010";}
				case 102 {print $numFs, "\t110011";}
				case 103 {print $numGs, "\t011001";}
				case 104 {print $numHs, "\t0010";}
				case 105 {print $numIs, "\t1000";}
				case 106 {print $numJs, "\t1100001011";}
				case 107 {print $numKs, "\t11000011";}
				case 108 {print $numLs, "\t10101";}
				case 109 {print $numMs, "\t110010";}
				case 110 {print $numNs, "\t0111";}
				case 111 {print $numOs, "\t1001";}
				case 112 {print $numPs, "\t101000";}
				case 113 {print $numQs, "\t11000010101";}
				case 114 {print $numRs, "\t0001";}
				case 115 {print $numSs, "\t0011";}
				case 116 {print $numTs, "\t1101";}
				case 117 {print $numUs, "\t00000";}
				case 118 {print $numVs, "\t1100000";}
				case 119 {print $numWs, "\t110001";}
				case 120 {print $numXs, "\t110000100";}
				case 121 {print $numYs, "\t101001";}
				case 122 {print $numZs, "\t11000010100";}
		}
	 
	print "\n";
	}
}