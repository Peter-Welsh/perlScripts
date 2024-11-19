$x = int rand(6) + 1;
if($x==5){
	$y = int rand(52) + 1;
}
elsif($x==6){
	$y = int rand(43) + 1;
}
else{
	$y = int rand(26) + 1;
}
print "I recommend the $y";
if($y==1|$y==21|$y==31|$y==41|$y==51){
	print "st";
}
elsif($y==2|$y==22|$y==32|$y==42|$y==52){
	print "nd";
}
elsif($y==3|$y==23|$y==33|$y==43){
	print "rd";
}
else{
	print "th";
}
print " episode of season $x.";
$i=<>;