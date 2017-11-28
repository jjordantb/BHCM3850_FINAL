#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

# Ensure proper use of script by making sure a file name was passed in
if ($ARGV[0] eq "" || $ARGV[1] eq "") {
    # If file name has not been passed in print out a prompt of how to fix
    # and then exit
    print("You need to pass a file path in as an argument!\n");
    print("Example: perl problem_2.pl file_1.fasta file_2.fasta\n");
    exit();
}

# Function that takes a file name as a parameter and opens and removes spaces, newlines, and numbers
# @function getAndCleanFileContents
# @param1 path to the file
# @return the cleaned file contents
sub getAndCleanFileContents {
    my ($string) = @_;
    open(my $fileHandler, "<", $string) # open file
        or die "Could not open file \n"; # could not open file

    my $masterString = ""; # Predefine a varriable to concatinate all lines into
    # Iterate through all of the lines in the file storing each line in $row for use
    while(my $row = <$fileHandler>) {
        chomp($row); # remove new line characters from the line
        $row =~ s/(\s+)|(\d)//g; # remove any numerical characters and spaces from the line
        $masterString = $masterString . $row; # add the line to the running total of file contents via concactination
    }
    return $masterString; # return the file contents
}

# Function that converts the given DNA sequence to RNA
# @function toRNA
# @param1 DNA sequence
# @return RNA sequence
sub toRNA {
    my ($string) = @_;
    $string =~ tr/t/u/; # replaces
    return $string; # return the converted sequence
}

# call getAndClean on file_1.fasta
# call getAndClean on file_2.fasta
# concatinated them and store in concatDna
my $concatDna = getAndCleanFileContents($ARGV[0]) . getAndCleanFileContents($ARGV[1]);
# convert the DNA to RNA and reverse it
$concatDna = reverse toRNA($concatDna);

print("Non-Formatted: \n");
print($concatDna . "\n\n");

