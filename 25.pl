#!/usr/local/bin/perl

use strict;
use warnings;
use Math::BigInt;

my $limit = Math::BigInt->new(10);
$limit = $limit ** 999;
my $fib_prev = Math::BigInt->new(1);
my $fib_now =  Math::BigInt->new(1);
my $fib = Math::BigInt->new(0);
my $cnt = 2;

while($fib < $limit){
  ++$cnt;
  $fib = $fib_prev + $fib_now;
  $fib_prev = $fib_now;
  $fib_now = $fib;
}

print $cnt,"\n";
