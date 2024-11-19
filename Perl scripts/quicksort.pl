use Time::HiRes qw(gettimeofday);
my $t0 = gettimeofday;
sub quickSort {
    my @a = @_;
    return @a if @a < 2;
    my $p = splice @a, int rand @a, 1;
    quickSort(grep $_ < $p, @a), $p, quickSort(grep $_ >= $p, @a);
}
 
my @a = (6,10,1,8,7,9,3,2,4,11);
@a = quickSort @a;
print "@a\n";
my $t1 = gettimeofday;
print $t1 - $t0;