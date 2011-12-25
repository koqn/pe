#!/usr/local/bin/perl

use strict;
use warnings;

my $sum = 1;
for my $num(2..501){
  $sum += (2*$num - 1) ** 2;
  $sum += 4*$num*$num - 10*$num + 7;
  $sum += 4*$num*$num - 8*$num + 5;
  $sum += 4*$num*$num - 6*$num + 3;
}

print $sum, "\n";
