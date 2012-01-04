#!/usr/local/bin/perl

use strict;
use warnings;

my $last = 10000;
my $max = 0;
for my $i(1..$last){
  my $ren;
  for my $j(1..9){
    $ren .= $i * $j;
    last if(scalar(split(//, $ren) >= 9));
  }
  if(join("", sort(split(//, $ren))) eq 123456789){
    $max = $ren if($ren > $max);
  }
}
print $max, "\n";
