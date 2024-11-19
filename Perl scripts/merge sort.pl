use Time::HiRes qw(gettimeofday);
my $t0 = gettimeofday;
sub merge_sort{
    my @x = @_;
    return @x if @x < 2;
    my $m = int @x / 2;
    my @a = merge_sort(@x[0 .. $m - 1]);
    my @b = merge_sort(@x[$m .. $#x]);
    for (@x) {
        $_ = !@a            ? shift @b
           : !@b            ? shift @a
           : $a[0] <= $b[0] ? shift @a
           :                  shift @b;
    }
    @x;
}
 
my @a = (18, 64, 62, 16, 84, 96, 85, 99, 43, 47);
@a = merge_sort @a;

my $t1 = gettimeofday;
print $t1 - $t0;