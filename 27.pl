#!/usr/local/bin/perl

use strict;
use warnings;

my %prime_cache;
my %not_prime_cache;
my %max = (
      'a' => 0,
      'b' => 0,
      'val' => 0,
    );

for my $b (0..1000){
  for my $a(-1000..1000){
    my $i = 0;
    while(1){
      my $num = $i**2 + $i * $a + $b;
      last if($num < 2);
      last if(is_prime($num) eq 0);
      $i++;
    }
    if($i > $max{'val'}){
      $max{'a'} = $a;
      $max{'b'} = $b;
      $max{'val'} = $i
    }
  }
}

print $max{'a'} * $max{'b'}, "\n";

sub is_prime{
  my $n = shift;
  return 1 if(exists $prime_cache{$n});
  return 0 if(exists $not_prime_cache{$n});
  for(my $i=2; $i<=sqrt($n); $i++){
    if($n % $i==0){
      $not_prime_cache{$n} = 1;
      return 0;
    }
  }
  $prime_cache{$n} = 1;
  return 1;
}
