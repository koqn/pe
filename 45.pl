#!/usr/local/bin/perl

use strict;
use warnings;

my %tri;
my %pen;

for(166..100000){
  my $t = $_ * ($_ + 1) / 2;
  my $p = $_ * (3 * $_ - 1) / 2;
  $tri{$t}++;
  $pen{$p}++;
}

for(144..100000){
  my $h = $_ * (2 * $_ -1);
  print $h, "\n" if(exists $tri{$h} && exists $pen{$h});
}
