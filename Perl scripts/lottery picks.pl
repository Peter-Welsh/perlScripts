#Lottery picks

for(1..20){
		$a = int rand(30) + 1;
	do{
		$b = int rand(30) + 1;
	}while($a==$b);
	do{
		$c = int rand(30) + 1;
	}while($a==$c||$b==$c);
	do{
		$d = int rand(30) + 1;
	}while($a==$d||$b==$d||$c==$d);
	do{
		$e = int rand(30) + 1;
	}while($a==$e||$b==$e||$c==$e||$d==$e);
	do{
		$f = int rand(30) + 1;
	}while($a==$f||$b==$f||$c==$f||$d==$f||$e==$f);

	@a = ($a,$b,$c,$d,$e,$f);
	@s = sort {$a <=> $b} @a;

	$s = "http://www.neopets.com/games/process_lottery.phtml?one=" . @s[0] . "&two=" . @s[1] . "&three=" . @s[2] . "&four=" . @s[3] . "&five=" . @s[4] . "&six=" . @s[5];

	print $s, "\n\n";
}

$input=<>;