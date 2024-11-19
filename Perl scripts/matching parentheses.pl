#December 8, 2016
#Peter Welsh
#
#Matching Parentheses test

$in = <>;

chomp($in);

@chars = split(undef, $in);
@stack;
@stack2;
@stack3;
$match = false;
$match2 = false;
$match3 = false;

for(@chars){
	if($_ eq '{'){
		push @stack, $_;
	}

	if($_ eq '}'){
		if(!@stack){
			$match = false;
			goto DONE;
		}
		pop @stack;
	}
}

for(@chars){
	if($_ eq '('){
		push @stack2, $_;
	}

	if($_ eq ')'){
		if(!@stack2){
			$match2 = false;
			goto DONE;
		}
		pop @stack2;
	}
}

for(@chars){
	if($_ eq '['){
		push @stack3, $_;
	}

	if($_ eq ']'){
		if(!@stack3){
			$match3 = false;
			goto DONE;
		}
		pop @stack3;
	}
}


if(@stack){
	$match = false;
}
else{
	$match = true;
}

if(@stack2){
	$match2 = false;
}
else{
	$match2 = true;
}

if(@stack3){
	$match3 = false;
}
else{
	$match3 = true;
}


DONE:
print ($match and $match2 and $match3);