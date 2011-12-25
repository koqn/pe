#!/usr/local/bin/perl

use strict;
use warnings;

my $max = 0;
my $max_value = 0;

for(1..1000){
  my $c = cycle($_);
  if($max_value < $c){
    $max = $_;
    $max_value = $c;
  }
}
print $max, "\n";

sub cycle{
  my $waru = shift;
  my @ar  = ();
  my $num = 10;
  while(1){
    if($num % $waru eq 0){
      return 0;
    }
    for(my $i = 0; $i < scalar(@ar); $i++){
      if($ar[$i] eq $num){
        return scalar(@ar) - $i;
      }
    }
    push @ar, $num;
    $num = ($num % $waru) * 10;
  }
}
