#ascii converter
#takes input and outputs an ascii art equivalent
use Switch;

$nec = 191;
$nwc = 218;
$swc = 192;
$sec = 217;
$mbr = 196;
$vbr = 179;
$tbe = 195;
$tbs = 194;
$tbn = 193;
$tbw = 180;
$spc = 32;
$bsl = 47;
$fsl = 92;
$usc = 95;
START:
$x=0;
print "Enter your font type: ";
$fontType=<>;
print "Now enter your text: ";
$text=<>;
$text=uc($text);

if($fontType =~ "calc"){
	$x+=3; #target the arrays @arr[3]-[5]
	$fsize = 3;
	$maxLength = 29;
}
elsif($fontType =~ "stick"){
	$x+=6; #target the arrays @arr[6]-[8]
	$fsize = 3;
	$maxLength = 22;
}
elsif($fontType =~ "block"){
	$x+=9; #target the arrays @arr[9]-[13]
	$fsize = 5;
	print "\n";
	$maxLength = 7;
}
elsif($fontType =~ "tink"){
	$x+=14; #target the arrays @arr[14]-[18]
	$fsize = 5;
	print "\n";
	$maxLength = 13;
}
else{
	$fsize = 3;
	$maxLength = 42;
}

if($text =~ "W"){
	$maxLength -= 1;
}
if($text =~ " "){
	$maxLength += 1;
}
while(length($text)>$maxLength){ #trim the user input until it will fit on the screen
	$text = substr($text, 0, -1);
}
@in = split(undef, $text); #split up the user input character by character and stuff into array
################A###########B###########C###########D#########E######F########G###########H#########I########J###########K#########L###########M#############N###########O###########P###########Q###########R#########S######T########U###########V##############W#############X###########Y###########Z#######
$arr[0] = ["$spc $spc","$spc $spc","$spc $spc","$spc $spc","$spc","$spc","$spc $spc","$spc $spc","$spc","$spc $spc","$spc $spc","$spc","$spc $spc $spc","$spc $spc","$spc $spc","$spc $spc","$spc $spc","$spc $spc","$spc","$usc","$spc $spc","$spc $spc","$spc $spc $spc","$spc $spc","$spc $spc","$usc $usc"];
$arr[1] = ["213 184",  "$tbe $nec","$nwc $mbr","$nwc $tbw","213", "213", "$nwc $usc","$tbe $tbw","$tbs","$spc $tbs","$vbr $bsl","$vbr","$nwc $tbs $nec","$nwc $nec","$nwc $nec","$nwc $nec","$nwc $nec","$tbe $nec","244", "$vbr","$spc $spc","$fsl $bsl","$spc $spc $spc","$fsl $bsl","$swc $tbw","$spc $bsl"];
$arr[2] = ["$spc $spc","$swc $sec","$swc $mbr","$swc $sec","$swc","$spc","$swc $sec","$spc $spc","$tbn","$swc $sec","$vbr $fsl","$swc","$spc $spc $spc","$spc $spc","$swc $sec","$tbe $sec","$swc $tbw","$tbn $spc","245", "$spc","$swc $sec","$spc $spc","$swc $tbn $sec","$bsl $fsl","$swc $sec","$mbr $mbr"];
# ^ Default font ^ #original
$arr[3] = [" _ ","   "," _ ","   "," _ "," _ "," _ ","   "," "," __","  " ,"  ","   "," _ "," _ "," _ "," _ " ," _ " ," _ ","___","   ","   " ,"   ","   " ,"   ","__"];
$arr[4] = ["|_|","|_ ","|  "," _|","|_ ","|_ ","| _","|_|","|","  |","|/" ,"| ","|||","| |","| |","|_|","| |" ,"|_|" ,"|_ "," | ","| |","| |" ,"| |","\\/ ","|_|"," /"];
$arr[5] = ["| |","|_|","|_ ","|_|","|_ ","|  ","|_|","| |","|","|_|","|\\","|_","| |","| |","|_|","|  ","|\\|","| \\"," _|"," | ","|_|"," \\|","|||","/\\ "," | ","/_"];
# ^ CALC font ^ #original
$arr[6] = ["    ", " __ "," __ ", " __ ", " ___"," ___"," __ ",  "    "," ","    ", "    " ,"   ","    ", "    ", " __ ", " __ "," __ ", " __ " ," __ ", "___","    ", "    ",  "    ", "    " ,"   ", "__"];
$arr[7] = [" /\\ ","|__)","/  `", "|  \\","|__ ","|__ ","/ _`" , "|__|","|","   |", "|__/" ,"|  ","|\\/|","|\\ |","/  \\","|__)","/  \\","|__)" ,"/__`", " | ", "|  |","\\  /" ,"|  |","\\_/ ","\\ /", " /"];
$arr[8] = ["/~~\\","|__)","\\__,","|__/", "|___","|   ","\\__>" ,"|  |","|","\\__/","|  \\","|__","|  |", "| \\|","\\__/","|   ","\\__X","|  \\",".__/", " | ","\\__/"," \\/ ", "|/\\|","/ \\ "," | ", "/_"];
# ^ JS Stick Letters font ^ ######A###################################################B#########################################C#########################################################D##############################################E##############################################F#############################################################G##################################################H################################################I##############################################J#######################################################K################################################L########################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################
$arr[9]  =["$spc $spc $mbr $sec $mbr $sec $spc $spc $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc $spc $spc","$spc $spc $spc $mbr $sec $mbr $sec $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc $spc $spc","$spc $mbr $sec $mbr $sec $mbr $sec $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $mbr $sec $spc","$spc $spc $spc $mbr $sec $mbr $sec $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc","$spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $spc $spc $mbr $sec $mbr $sec $spc $spc $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc $spc $spc","$spc $spc $spc $mbr $sec $mbr $sec $spc $spc $spc $spc $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc $spc $spc","$spc $spc $spc $mbr $sec $mbr $sec $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $mbr $sec $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $mbr $sec $mbr $sec $spc"];
$arr[10] =["$mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $spc $spc $mbr $sec $spc $spc $spc","$spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $mbr $sec $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $mbr $sec $spc $spc $mbr $sec $mbr $sec $spc","$spc $mbr $sec $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $spc $spc $spc $spc $mbr $sec $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $spc $spc $mbr $sec $spc $spc $mbr $sec $spc $spc $spc","$spc $spc $spc $mbr $sec $spc $spc $mbr $sec $spc $spc $spc","$spc $spc $spc $spc $spc $spc $spc $mbr $sec $spc $spc $spc"];
$arr[11] =["$mbr $sec $mbr $sec $mbr $sec $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc $spc $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc $spc $spc","$spc $mbr $sec $spc $spc $mbr $sec $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $mbr $sec $spc","$spc $spc $spc $mbr $sec $spc $spc $spc","$spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $mbr $sec $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $mbr $sec $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $mbr $sec $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc $spc $spc","$spc $mbr $sec $spc $spc $mbr $sec $mbr $sec $spc $spc $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc $spc $spc","$spc $spc $spc $mbr $sec $mbr $sec $spc $spc $spc","$spc $spc $spc $spc $spc $mbr $sec $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $spc $spc $spc $spc $mbr $sec $spc $spc $spc $spc $spc","$spc $spc $spc $spc $spc $mbr $sec $spc $spc $spc $spc $spc","$spc $spc $spc $spc $spc $mbr $sec $spc $spc $spc $spc $spc"];
$arr[12] =["$mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $spc $spc $mbr $sec $spc $spc $spc","$mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $mbr $sec $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $spc $spc $spc $spc $mbr $sec $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $spc $spc $mbr $sec $spc $spc $mbr $sec $spc $spc $spc","$spc $spc $spc $mbr $sec $spc $spc $mbr $sec $spc $spc $mbr $sec $spc $spc $spc","$spc $spc $spc $mbr $sec $spc $spc $mbr $sec $spc $spc $spc","$spc $spc $spc $spc $spc $mbr $sec $spc $spc $spc $spc $spc","$spc $spc $spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc"];
$arr[13] =["$mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc $spc $spc","$spc $spc $spc $mbr $sec $mbr $sec $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc $spc $spc","$spc $mbr $sec $mbr $sec $mbr $sec $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $spc $spc $mbr $sec $mbr $sec $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc","$spc $spc $mbr $sec $mbr $sec $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $spc $spc $mbr $sec $mbr $sec $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $spc","$spc $spc $spc $mbr $sec $mbr $sec $spc $spc $mbr $sec $spc","$spc $mbr $sec $spc $spc $spc $spc $mbr $sec $spc","$spc $mbr $sec $mbr $sec $mbr $sec $spc $spc $spc","$spc $spc $spc $spc $spc $mbr $sec $spc $spc $spc $spc $spc","$spc $spc $spc $mbr $sec $mbr $sec $spc $spc $spc","$spc $spc $spc $spc $spc $mbr $sec $spc $spc $spc $spc $spc","$spc $spc $spc $spc $spc $mbr $sec $spc $spc $mbr $sec $spc $spc $spc $spc $spc","$spc $mbr $sec $spc $spc $spc $spc $spc $spc $mbr $sec $spc","$spc $spc $spc $spc $spc $mbr $sec $spc $spc $spc $spc $spc","$spc $mbr $sec $mbr $sec $mbr $sec $mbr $sec $mbr $sec $spc"];
# ^ BLOCK font ^ #modified
$arr[14] =["  O  ", "o--o  ","  o-o ", "o-o   ", "o--o ","o--o "," o-o  ","o  o ","o-O-o ","    o ", "o  o ", "o    ","o   o ", "o   o ", " o-o  ","o--o  "," o-o  ", "o--o  ",  " o-o  ","o-O-o ","o   o ","o   o ",  "o       o ",  "o   o ",  "o   o ", "o---o "];
$arr[15] =[" / \\ ","|   | "," /    ", "|  \\  ","|    ","|    ","o     ","|  | ","  |   ","    | ", "| /  ", "|    ","|\\ /| ","|\\  | ","o   o ","|   | ","o   o ", "|   | ",  "|     ","  |   ","|   | ","|   | ",  "|       | ",  " \\ /  "," \\ /  ", "   /  "];
$arr[16] =["o---o", "O--o  ","O     ", "|   O ", "O-o  ","O-o  ","|  -o ","O--O ","  |   ","    | ", "OO   ", "|    ","| O | ", "| \\ | ","|   | ","O--o  ","|   | ", "O-Oo  ",  " o-o  ","  |   ","|   | ","o   o ",  "o   o   o ",  "  O   ",  "  O   ", " -O-  "];
$arr[17] =["|   |", "|   | "," \\    ","|  /  ", "|    ","|    ","o   | ","|  | ","  |   ","\\   o ","| \\  ","|    ","|   | ", "|  \\| ","o   o ","|     ","o   O ", "|  \\  ","    | ","  |   ","|   | "," \\ /  "," \\ / \\ /  ", " / \\  ", "  |   ", " /    "];
$arr[18] =["o   o", "o--o  ","  o-o ", "o-o   ", "o--o ","o    "," o-o  ","o  o ","o-O-o "," o-o  ", "o  o ", "O---o","o   o ", "o   o ", " o-o  ","o     "," o-O\\ ","o   o ",  "o--o  ","  o   "," o-o  ","  o   ",  "  o   o   ",  "o   o ",  "  o   ", "o---o "];
# ^ Tinker Toy font ^ #

for(1..$fsize){ #1 recursion for each line
	for(@in){ #1 recursion for each character
		if($fontType =~ "calc"||$fontType =~ "stick"||$fontType =~ "tink"){ #any fonts that don't require special characters
			switch(ord($_)){
				case 32 {print "  ";}
				case 65 {print $arr[$x][0];} #prints one line of an A
				case 66 {print $arr[$x][1];}
				case 67 {print $arr[$x][2];}
				case 68 {print $arr[$x][3];}
				case 69 {print $arr[$x][4];}
				case 70 {print $arr[$x][5];}
				case 71 {print $arr[$x][6];}
				case 72 {print $arr[$x][7];}
				case 73 {print $arr[$x][8];}
				case 74 {print $arr[$x][9];}
				case 75 {print $arr[$x][10];}
				case 76 {print $arr[$x][11];}
				case 77 {print $arr[$x][12];}
				case 78 {print $arr[$x][13];}
				case 79 {print $arr[$x][14];}
				case 80 {print $arr[$x][15];}
				case 81 {print $arr[$x][16];}
				case 82 {print $arr[$x][17];}
				case 83 {print $arr[$x][18];}
				case 84 {print $arr[$x][19];}
				case 85 {print $arr[$x][20];}
				case 86 {print $arr[$x][21];}
				case 87 {print $arr[$x][22];}
				case 88 {print $arr[$x][23];}
				case 89 {print $arr[$x][24];}
				case 90 {print $arr[$x][25];} #prints one line of a Z
				else    {print " ";}
			}
		}
		else{ #fonts that have special characters
			switch(ord($_)){
				case 65 {fp($x,0);}
				case 66 {fp($x,1);}
				case 67 {fp($x,2);}
				case 68 {fp($x,3);}
				case 69 {fp($x,4);}
				case 70 {fp($x,5);}
				case 71 {fp($x,6);}
				case 72 {fp($x,7);}
				case 73 {fp($x,8);}
				case 74 {fp($x,9);}
				case 75 {fp($x,10);}
				case 76 {fp($x,11);}
				case 77 {fp($x,12);}
				case 78 {fp($x,13);}
				case 79 {fp($x,14);}
				case 80 {fp($x,15);}
				case 81 {fp($x,16);}
				case 82 {fp($x,17);}
				case 83 {fp($x,18);}
				case 84 {fp($x,19);}
				case 85 {fp($x,20);}
				case 86 {fp($x,21);}
				case 87 {fp($x,22);}
				case 88 {fp($x,23);}
				case 89 {fp($x,24);}
				case 90 {fp($x,25);}
				else    {print "  ";}
			}
		}
	}
	$x++;
	print "\n";
}

print "Restart? (Y/N) ";
$restart=<>;
if(!($restart =~ "n"||$restart =~ "N")){
	goto START;
}
else{
	print "Goodbye";
	sleep 1;
}

sub fp{#font processor: for printing special characters
	@a = split(" ", $arr[$_[0]][$_[1]]);
	foreach(@a){
		print chr($_);
	}
}