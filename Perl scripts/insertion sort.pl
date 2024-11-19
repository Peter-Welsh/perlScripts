use Time::HiRes qw(gettimeofday);
my $t0 = gettimeofday;
sub insertion_sort {
    my (@list) = @_;
    foreach my $i (1 .. $#list) {
        my $j = $i;
        my $k = $list[$i];
        while ( $j > 0 && $k < $list[$j - 1]) {
            $list[$j] = $list[$j - 1];
            $j--;
        }
        $list[$j] = $k;
    }
    return @list;
}
 
my @a = insertion_sort(7477, 4290, 4378, 8623, 2863);

my $t1 = gettimeofday;
print $t1 - $t0;