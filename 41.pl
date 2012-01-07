#!/usr/local/bin/perl

use strict;
use warnings;
use Math::Combinatorics;
use List::Util qw/max/;
use Data::Dumper;


my @num = (1,2,3,4,5,6,7,8,9);
my @ans;

for(1..8){
  last if(scalar(@ans) > 0);
  my $comb = Math::Combinatorics->new(data => [@num]);
  while(my @p = $comb->next_permutation){
    my $tmp = join("", @p);
    push @ans, $tmp if(is_prime($tmp));
  }
  pop @num;
}
print max(@ans), "\n";

sub is_prime{
  my $n = shift;
  return 0 if($n == 0 || $n == 1);
  return 1 if($n == 2);
  for(my $i=2; $i<=sqrt($n); $i++){
    if($n % $i==0){
      return 0;
    }
  }
  return 1;
}
