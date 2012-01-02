#!/usr/local/bin/perl

my $ans_bunsi = 1;
my $ans_bunbo = 1;

for my $bunsi(10..99){
  for my $bunbo(10..99){
    next if($bunsi >= $bunbo);

    my $bunsi1 = $bunsi % 10;
    my $bunbo1 = $bunbo % 10;

    my $bunsi10 = int($bunsi / 10);
    my $bunbo10 = int($bunbo / 10);

    my $val = $bunsi / $bunbo;
    my $new_val;

    if($bunsi1 eq $bunbo10){
      next if($bunbo1 eq 0);
      $new_val = $bunsi10 / $bunbo1;
    }elsif($bunsi10 eq $bunbo1){
      next if($bunbo10 eq 0);
      $new_val = $bunsi1 / $bunbo10;
    }

    if($val eq $new_val){
      print "$bunsi, $bunbo\n";
      $ans_bunsi *= $bunsi;
      $ans_bunbo *= $bunbo;
    }
  }
}

my ($x, $y, $q, $r) = ($ans_bunsi, $ans_bunbo, undef, undef);
while( 1 ){
  $r = $y % $x;
  last if($r eq 0);
  $y = $x;
  $x = $r;
}
print "$ans_bunsi, $ans_bunbo\n";
print $ans_bunbo/$x, "\n";
