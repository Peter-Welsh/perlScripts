#pxw120530
#December 1, 2014
#Programming Assignment #3

sub compound_interest{
	$principle = $_[0];
	$rate = $_[1];
	$years = $_[2];
	if($years == 0){
		return $principle; #base case
	}
	else{
		$principle *= (1 + $rate);
		$years--;
		return compound_interest($principle,$rate,$years); #recursive call
	}
}

sub array_same{
	@x = @{$_[0]}; #dereference the 1st argument and assign it to @x
	@y = @{$_[1]}; #dereference the 2nd argument and assign it to @y

	if($x[0]==$y[0]&&$x[0] eq $y[0]){ #if the 1st element of both arrays are identical (== for numbers, eq for strings)
		shift @x; #drop the 1st element of @x
		shift @y; #drop the 1st element of @y
		if(@x && @y){ #if the arrays are not empty
			array_same(\@x,\@y); #recursively call array_same
		}
		else{ #if the arrays are empty
			return 1; #then all elements are equal
		}
	}
	else{ #if some element pair does not match
		return 0; #then the arrays are not equal
	}
}

sub compare{
	$firstChar1 = substr($_[0], 0, 1); #stores the first character of the first string in $firstChar1
	$firstChar2 = substr($_[1], 0, 1); #stores the first character of the second string in $firstChar2

	if($firstChar1 lt $firstChar2){ #if the 1st char of string 1 is lexically less than the 1st char of string 2
		return -1;
	}
	elsif($firstChar1 eq $firstChar2){ #if the 1st char of string 1 is lexically equal to the 1st char of string 2
		unless(length($_[0]) == 0||length($_[1]) == 0){ #recursively call compare() until either string is empty
			return compare(substr($_[0], 1, length($_[0])), substr($_[1], 1, length($_[1]))); #calls compare with the "cdr" of the lists
		}
		return 0;
	}
	else{ #if the 1st char of string 1 is lexically greater than the 1st char of string 2
		return 1;
	}
}