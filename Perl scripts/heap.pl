use Time::HiRes qw(gettimeofday);
my $t0 = gettimeofday;
my @my_list = (6,10,1,8,7,9,3,2,4,11);
heapSort(\@my_list);
print "@my_list\n";
my $t1 = gettimeofday;
print $t1 - $t0;
exit;

sub heapSort
{
        my($list) = @_;
        my $count = scalar @$list;
        make_heap($count,$list);
 
        my $end = $count - 1;
        while($end > 0)
        {
                @$list[0,$end] = @$list[$end,0];
                sift_down(0,$end-1,$list);
                $end--;
        }
}
sub make_heap
{
        my ($count,$list) = @_;
        my $start = ($count - 2) / 2;
        while($start >= 0)
        {
                sift_down($start,$count-1,$list);
                $start--;
        }
}
sub sift_down
{
        my($start,$end,$list) = @_;
 
        my $root = $start;
        while($root * 2 + 1 <= $end)
        {
                my $child = $root * 2 + 1;
                $child++ if($child + 1 <= $end && $list->[$child] < $list->[$child+1]);
                if($list->[$root] < $list->[$child])
                {
                        @$list[$root,$child] = @$list[$child,$root];
                        $root = $child;
                }else{ return }
        }
}