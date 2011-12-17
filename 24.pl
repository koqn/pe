#!/usr/local/bin/perl

use strict;
use warnings;

use Data::Dumper;

my $now = 1000000;
my @all = (0,1,2,3,4,5,6,7,8,9);
my @ans = ();
my $i = 1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9;
$now--;

for(9,8,7,6,5,4,3,2,1){
  my $n = int($now / $i);
  push @ans, $all[$n];
  splice @all, $n, 1;
  $now -= $i * $n;
  $i /= $_;
}

push @ans, pop @all;
print @ans,"\n";
