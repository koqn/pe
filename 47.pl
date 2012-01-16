#!/usr/local/bin/perl

use strict;
use warnings;
use Data::Dumper;

my @prime_num = (2);

# make prime num list
for(my $i = 3; $i < 1000000; $i+=2){
  my $prime = 1;
  for(my $j = 2; $j <= sqrt($i); ++$j){
    if($i % $j == 0){
      $prime = 0;
      last;
    }
  }
  push @prime_num, $i if $prime;
}

my @hist_num = (0,0,0,0);
my @hist_val = (0,0,0,0);
my $start = 2 * 3 * 5 * 7;
for(my $i = $start; $i < 1000000; ++$i){
  my %tmp = bunkai($i);
  my @insu;
  foreach(keys %tmp){
    push @insu, $_ ** $tmp{$_};
  }
  shift @hist_num;
  push @hist_num, scalar(@insu);
  shift @hist_val;
  push @hist_val, \@insu;
  my %n;
  if($hist_num[0] eq 4 && $hist_num[1] eq 4 &&
      $hist_num[2] eq 4 && $hist_num[3] eq 4){
    for my $ref(@hist_val){
      for my $num(@$ref){
        $n{$num}++;
      }
    }
    if(scalar(keys %n) eq 16){
      print "ANS : ", $i - 3, "\n";
      last;
    }
  }

}

sub bunkai{
  my $n = shift;
  my %insu;
  while($n ne 1){
    for(@prime_num){
      if($n % $_ eq 0){
        $insu{$_}++;
        $n /= $_;
        last;
      }
    }
  }
  return %insu;
}
