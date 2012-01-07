#!/usr/local/bin/perl

use strict;
use warnings;
use Math::Combinatorics;
use Data::Dumper;

my @pen;
my %pen;
for(1..10000){
  my $num = $_ * (3 * $_ - 1) / 2;
  push @pen, $num;
  $pen{$num}++;
}
my $pair = Math::Combinatorics->new(
      data => [@pen],
      count => 2,
    );
my $ans;
while(my @p = $pair->next_combination){
   my $sum = $p[0] + $p[1];
   my $diff = abs($p[0] - $p[1]);
   if(exists $pen{$sum} && exists $pen{$diff}){
     print "FIND : $p[0], $p[1]\n";
     if(!defined $ans){
      $ans = $diff;
     }else{
      $ans = $diff if($ans > $diff);
     }
   }
}
print $ans, "\n";
