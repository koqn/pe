#!/usr/local/bin/perl

use strict;
use warnings;
use Math::Combinatorics;
use Data::Dumper;

my %prime_cache;
my %not_prime_cache;

my $ans;
for(2..999999){
#  print $_, "\n" if(junkai($_));
  ++$ans if(junkai($_));
}
print $ans, "\n";

sub junkai{
  my $n = shift;
  my @num = kaiten($n);
#  print Dumper \$n, \@num;
  for(@num){
    return 0 if(is_prime($_) eq 0);
  }
  return 1;
}

sub kaiten{
  my $n = shift;
  my @ret;

  if($n < 10){
    push @ret, $n;
    return @ret;
  }
  my $tmp = $n;
  my $loop = int(log($n)/log(10));
  my $keta = 10 ** $loop;
  push @ret, $tmp;
  for(1..$loop){
    my $keta_num = int($tmp/$keta);
    $tmp = ($tmp - $keta_num * $keta) * 10 + $keta_num;
    push @ret, $tmp;
  }
  return @ret;
}

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
