#Find and Replace
#created November 18, 2014
#known bugs: 1. if the input text ends with the phrase you're trying to replace,
#			    it will be dropped from the ouput, unless it's only 1 char long
#			 2. Period ( . ) is treated like a wildcard character
#				This means looking for ( H. ) will turn up ( Ha ), ( Hb ), etc.
#To get around 1., just add a random character at the end of your input as a buffer
#To get around 2., just add a slash ( \ ) before the period to escape it

#Note: everything is case-sensitive
START:
print "Text: ";
$in=<>;
print "Find: ";
$f=<>;
print "Replace: ";
$r=<>;
chomp($in,$f,$r);
@a  = split($f, $in);
@aa = split($f, $in);
@aaa= split(undef, $in);

if($in eq $f){ #if the input is what we're looking for
	@a = $r;
}
else{
	for(@a){
		$_ .= $r;
	}
}

if($aaa[-1] eq $f){ #if the last character is what we're looking for, don't replace
	print "";
}
else{
	$a[-1] = $aa[-1]; #fixes the problem of appending to the last element
}

print @a;

print "\nAgain? (Y/N) ";
$in=<>;
if(!($in =~ "n"||$in =~ "N")){
	for(1..80){print chr(196);}
	goto START;
}