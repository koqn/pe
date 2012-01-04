#!/usr/local/bin/perl

use strict;
use warnings;
use Data::Dumper;

my %ans;

for my $a(1..333){
  for my $b(1..499){
    next if($a > $b);
    for my $c(1..998){
      next if($b > $c);
      my $p = $a+$b+$c;
      if($a**2+$b**2 eq $c**2 ){
        my $val = "$a, $b, $c";
        push @{$ans{$p}}, $val;
      }
    }
  }
}
my $max = {
  'val' => 0,
  'p' => 0
};
foreach my $p(keys %ans){
  if($max->{'val'} < scalar(@{$ans{$p}})){
    $max->{'val'} = scalar(@{$ans{$p}});
    $max->{'p'} = $p;
  }
}
print Dumper $max;
#print Dumper \%ans;
