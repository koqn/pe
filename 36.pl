#!/usr/local/bin/perl

use strict;
use warnings;

my $ans;

for(1..999999){
  my @num = split(//);
  my $tmp = join("", reverse(@num));
  if($_ eq $tmp){
    my $binary = sprintf "%b", $tmp;
    my @bin_num = split(//, $binary);
    my $bin_tmp = join("", reverse(@bin_num));
    if($binary eq $bin_tmp){
      print "$tmp\t$bin_tmp\n";
      $ans += $tmp;
    }
  }
}
print $ans, "\n";
