#Tic-Tac-Toe 
#March 27 - April 1, 2015
use Switch;

#output table_array
@top = (chr(218), chr(196), chr(194), chr(196), chr(194), chr(196), chr(191), "\n", chr(179));
@bot = (chr(192), chr(196), chr(193), chr(196), chr(193), chr(196), chr(217), "\n");
$firstRun = 1;

START:
#initialize AI_array with a1, a2, a3, b1, b2, b3, c1, c2, c3
@AI_array = ('1', '2', '3', '4', '5', '6', '7', '8', '9');
#initialize table_array with _, _, _, \n, _, _, _, \n, _, _, _
@table_array = (" ", chr(179), " ", chr(179), " ", chr(179), "\n", chr(195), chr(196), chr(197), chr(196), chr(197), chr(196), chr(180), "\n", chr(179), " ", chr(179), " ", chr(179), " ", chr(179), "\n", chr(195), chr(196), chr(197), chr(196), chr(197), chr(196), chr(180), "\n", chr(179), " ", chr(179), " ", chr(179), " ", chr(179), "\n");
$notEnd = 1; #when 0, game ends
$AI_input = 0; #used to store the computer's move
$occup = 0; #number of spaces occupied by either an X or O -- helps determine when to terminate in case of a tie
$endNote = "You lose.";	

print "\n" x 20;
if($firstRun){
	print "Tic-Tac-Toe\n";
}
print @top;
print ("7", chr(179), "8", chr(179), "9", chr(179), "\n", chr(195), chr(196), chr(197), chr(196), chr(197), chr(196), chr(180), "\n", chr(179), "4", chr(179), "5", chr(179), "6", chr(179), "\n", chr(195), chr(196), chr(197), chr(196), chr(197), chr(196), chr(180), "\n", chr(179), "1", chr(179), "2", chr(179), "3", chr(179), "\n");
print @bot;
if($firstRun){
	print ("Pick a number (1-9): ");
}

while($notEnd){
	$input = <>;
	chomp($input);
	switch($input){
		case 7 {if($table_array[0] =~ " "){$table_array[0]="x"; $occup++;} $AI_array[6] = -1;}
		case 8 {if($table_array[2] =~ " "){$table_array[2]="x"; $occup++;} $AI_array[7] = -1;}
		case 9 {if($table_array[4] =~ " "){$table_array[4]="x"; $occup++;} $AI_array[8] = -1;}
		case 4 {if($table_array[16] =~ " "){$table_array[16]="x"; $occup++;} $AI_array[3] = -1;}
		case 5 {if($table_array[18] =~ " "){$table_array[18]="x"; $occup++;} $AI_array[4] = -1;}
		case 6 {if($table_array[20] =~ " "){$table_array[20]="x"; $occup++;} $AI_array[5] = -1;}
		case 1 {if($table_array[32] =~ " "){$table_array[32]="x"; $occup++;} $AI_array[0] = -1;}
		case 2 {if($table_array[34] =~ " "){$table_array[34]="x"; $occup++;} $AI_array[1] = -1;}
		case 3 {if($table_array[36] =~ " "){$table_array[36]="x"; $occup++;} $AI_array[2] = -1;}
		else   {print "";}
	}

	print "\n" x 20;
	print @top;
	print @table_array;
	print @bot;

	
	check();

	if($occup < 9 && $notEnd == 1){
		do{
				$AI_input = $AI_array[rand @AI_array];
			}while($AI_input == -1);

		switch($AI_input){
			case 7 {$table_array[0]="o"; $AI_array[6] = -1; $occup++;}
			case 8 {$table_array[2]="o"; $AI_array[7] = -1; $occup++;}
			case 9 {$table_array[4]="o"; $AI_array[8] = -1; $occup++;}
			case 4 {$table_array[16]="o"; $AI_array[3] = -1; $occup++;}
			case 5 {$table_array[18]="o"; $AI_array[4] = -1; $occup++;}
			case 6 {$table_array[20]="o"; $AI_array[5] = -1; $occup++;}
			case 1 {$table_array[32]="o"; $AI_array[0] = -1; $occup++;}
			case 2 {$table_array[34]="o"; $AI_array[1] = -1; $occup++;}
			case 3 {$table_array[36]="o"; $AI_array[2] = -1; $occup++;}
			else   {$notEnd = 0;}
		}
	}

	sleep 1;
	print "\n" x 19;
	print @top;
	print @table_array;
	print @bot;

	check();
}

print $endNote, " Again? (Y/N) ";
$input = <>;
if(!($input =~ "n" || $input =~ "N")){
	$firstRun = 0;
	goto START;
}

sub check{
	if($table_array[0] eq "x" && $table_array[2] eq "x" && $table_array[4] eq "x"||
		$table_array[0] eq "x" && $table_array[18] eq "x" && $table_array[36] eq "x"||
		$table_array[16] eq "x" && $table_array[18] eq "x" && $table_array[20] eq "x"||
		$table_array[32] eq "x" && $table_array[34] eq "x" && $table_array[36] eq "x"||
		$table_array[4] eq "x" && $table_array[18] eq "x" && $table_array[32] eq "x"||
		$table_array[4] eq "x" && $table_array[20] eq "x" && $table_array[36] eq "x"||
		$table_array[2] eq "x" && $table_array[18] eq "x" && $table_array[34] eq "x"||
		$table_array[0] eq "x" && $table_array[16] eq "x" && $table_array[32] eq "x"){
			$notEnd = 0;
			$endNote = "You win.";
	}
	elsif($table_array[0] eq "o" && $table_array[2] eq "o" && $table_array[4] eq "o"||
		$table_array[0] eq "o" && $table_array[18] eq "o" && $table_array[36] eq "o"||
		$table_array[16] eq "o" && $table_array[18] eq "o" && $table_array[20] eq "o"||
		$table_array[32] eq "o" && $table_array[34] eq "o" && $table_array[36] eq "o"||
		$table_array[4] eq "o" && $table_array[18] eq "o" && $table_array[32] eq "o"||
		$table_array[4] eq "o" && $table_array[20] eq "o" && $table_array[36] eq "o"||
		$table_array[2] eq "o" && $table_array[18] eq "o" && $table_array[34] eq "o"||
		$table_array[0] eq "o" && $table_array[16] eq "o" && $table_array[32] eq "o"){
			$notEnd = 0;
	}
	elsif($occup == 9){
		$notEnd = 0;
		$endNote = "It's a draw.";
	}
}