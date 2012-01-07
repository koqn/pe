#!/usr/local/bin/perl

use strict;
use warnings;

my %score;
my $cnt = 0;
for('A'..'Z'){
  $score{$_} = ++$cnt;
}
my %tri;
for(1..100){
  my $key = $_ * ($_ + 1) / 2;
  $tri{$key}++;
}
my $ans;
while(<STDIN>){
  chomp;
  my @words = split(/,/);
  for my $word(@words){
    $word =~ s/\"//g;
    my $val;
    while($word=~/(\w)/g){
      $val += $score{$1};
    }
    ++$ans if(exists $tri{$val});
  }
}
print $ans, "\n";
