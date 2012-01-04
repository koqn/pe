#!/usr/local/bin/perl

use strict;
use warnings;
use Data::Dumper;
use POSIX qw/ceil/;

my @query = (1, 10, 100, 1000, 10000, 100000, 1000000);
my $ans = 1;
for my $n(@query){
  $ans *= get_num($n);
}
print $ans, "\n";


sub get_num {
  my $num = shift;
  my $limit = 9;
  my $limit_prev = 0;
  my $i;
  for($i = 1; $limit < $num; ++$i){
    $limit_prev = $limit;
    $limit += (10**$i) * 9 * ($i+1);
  }
  my $base = 0;
  $base += 9 * (10**($_-1)) for(1..$i-1);
  my $extra = ceil(($num - $limit_prev) / $i);
  my $number = $base + $extra;
  my $pos = ($num - $limit_prev) % $i;
  my @tmp = split(//, $number);
#  print "$number, $pos\n";
  if($pos eq 0){
    $pos = scalar(@tmp) - 1;
  }else{
    --$pos;
  }
  return $tmp[$pos];
}
