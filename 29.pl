#!/usr/local/bin/perl

use strict;
use warnings;
use Math::BigInt;
use Data::Dumper;

my %ans;
for my $a(2..100){
  for my $b(2..100){
    my $key = Math::BigInt->new($a);
    $key = $key ** $b;
    $ans{$key}++; 
  }
}
my @tmp = keys %ans;
print scalar @tmp, "\n";
