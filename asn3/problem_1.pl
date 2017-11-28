#!/usr/bin/perl
# add some imports for easier debugging
use strict;
use warnings FATAL => 'all';

my $string_1 = "UUAUCGGAUCCCGGCCAU"; # store the desired RNA sequence in string_1
my $string_2 = "AAAACGGAACGGAGCG"; # store the desired sequence in string_2
print("1: " . $string_1 . "\n"); # print out string_1 onto screen

my $dna = $string_1 . $string_2; # concatinate string_1 and string_2 and store in dna
$dna =~ tr/U/T/; # convert RNA to DNA by replacing 'U' with 'T'
print("2: " . $dna . "\n"); # the new DNA string to screen

$dna =~ tr/ATCG/TAGC/; # complement the string by replacing A with T, T with A, C with G, and G with C
$dna = reverse $dna; # reverse the string
print("3: " . $dna); # print the reverse compliment string

exit(); # not nessisary but quit the script