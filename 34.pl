#!/usr/local/bin/perl

use strict;
use warnings;

my %kaijo_cache;
my $ans;

#calc last
my $tmp = kaijo(9);
my $num;
for(1..100){
  $num = 9x$_;
  last if($num > ($tmp *$_));
}
print $num,"\n";
for my $i (3..$num){
  my $sum;
  foreach(split(//, $i)){
    $sum += kaijo($_);
  }
  $ans += $sum if($i == $sum);
}
print $ans, "\n";

sub kaijo{
  my $n = shift;
  return 1 if($n == 0);
  return $n if($n == 1 || $n == 2);
  return $kaijo_cache{$n} if(exists $kaijo_cache{$n});
  my $ret = 1;
  $ret *= $_ for(1..$n);
  $kaijo_cache{$n} = $ret;
  return $ret;
}
