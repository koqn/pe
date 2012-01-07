#!/usr/local/bin/perl

use strict;
use warnings;
use Math::Combinatorics;

my @num = (0,1,2,3,4,5,6,7,8,9);
my $ans;
my @waru = (2,3,5,7,11,13,17);
my $comb = Math::Combinatorics->new(data => [@num]);
while(my @p = $comb->next_permutation){
  next if($p[0] == 0);
  if(check(@p) eq 1){
    my $tmp = join("", @p);
    print $tmp,"\n";
    $ans += $tmp;
  }
}
print $ans,"\n";

sub check{
  my @p = @_;
  for my $pos(1..7){
    my $num = $p[$pos].$p[$pos+1].$p[$pos+2];
    return 0 if($num % $waru[$pos-1] != 0);
  }
  return 1;
}
