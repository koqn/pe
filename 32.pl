#!/usr/local/bin/perl

use strict;
use warnings;
use Math::Combinatorics;
use Data::Dumper;

my @all = (1,2,3,4,5,6,7,8,9,'x','=');
my $combinat = Math::Combinatorics->new(data => [@all]);
my %ans;
while(my @permu = $combinat->next_permutation){
   my $tmp =join("", @permu);
   if($tmp =~/(\d+)x(\d+)\=(\d+)/){
     next if($1 > $2);
     if($1 * $2 == $3){
       print "$1 * $2 = $3\n";
       $ans{$3}++;
     }
   }
}
my $sum = 0;
for(keys %ans){
  $sum += $_;
}
print $sum,"\n";
