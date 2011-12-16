#!/usr/local/bin/perl

use strict;
use warnings;

use Data::Dumper;

my @kajo;

for(12..28123){
  push @kajo, $_ if(sum_yaku($_) > $_);  
}

#print Dumper @kajo;

my %kajo_sum;

for my $i(@kajo){
  for my $j(@kajo){
    $kajo_sum{$i+$j}++;  
  }
}

my $ans = 0;
for(1..28123){
  $ans += $_ unless exists $kajo_sum{$_};
}

print $ans,"\n";

sub sum_yaku{
  my $num = shift;
  my $ret = 0;
  for(1..$num-1){
    $ret += $_ if($num % $_ eq  0);
  }
  return $ret;
}
