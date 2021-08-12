#perl 5.22.1 

# coordExtract.pl
#     # parser that allows editing a pdb
# file to extract the coordinates

use strict;
use warnings;

print "\nEnter the input file: ";
$inputFile = <STDIN>;
chomp $inputFile;

unless (open($inputFile)) {
    print "Cannot read from '$inputFile'.\nProgram closing.\n";
    <STDIN>;
    exit;
    }

my @newlines;
while ( my $line = <FILE> ) {
    if ($line =~ m/^ATOM.*/) {
    push @newlines, $line;
    }
}

sub atomfreq {
    my %count;
    foreach my $record1(@newlines) {
        my $element = substr($record1, 76, 2);
        $count{$element} += 1;
    }
    foreach my $element ( sort keys %count ) {
        print "element=$element, count=$count{$element}\n";
    }
}

#initial count of amino acids
$count_ALA=0;
$count_ARG=0;  
$count_ASN=0;
$count_ASP=0;
$count_CYS=0;
$count_GLU=0;
$count_GLN=0;
$count_GLY=0;
$count_HIS=0;
$count_ILE=0;
$count_LEU=0;
$count_LYS=0;
$count_MET=0; 
$count_PHE=0;
$count_PRO=0;
$count_SER=0;
$count_THR=0;
$count_TRP=0;
$count_TYR=0;
$count_VAL=0;

#initial count of atoms
$count_carbon=0;
$count_nitrogen=0;
$count_oxygen=0;
$count_phosphorus=0;
$count_sulfur=0;

#Below is a sample of what we nee to record
#ATOM      1  N   LEU A 136      18.174  58.167  23.250  1.00 62.55           N  
#Identify what we need to look out for:
#ATOM             LEU                                                         N
#First, identify the line with intials of ATOM
#Second, identify the amino acid
#Third, identify the carbon
#End the program



print "\n"
print "AMINO ACID COUNT"
print "\n"
print " ALA:\t" $count_ALA, "\n";
print " ARG:\t" $count_ARG, "\n";
print " ASN:\t" $count_ASN, "\n";
print " ASP:\t" $count_ASP, "\n";
print " CYS:\t" $count_CYS, "\n";
print " GLU:\t" $count_GLU, "\n";
print " GLN:\t" $count_GLN, "\n";
print " GLY:\t" $count_GLY, "\n";
print " HIS:\t" $count_HIS, "\n";
print " ILE:\t" $count_ILE, "\n";
print " LEU:\t" $count_LEU, "\n";
print " LYS:\t" $count_LYS, "\n";
print " MET:\t" $count_MET, "\n";
print " PHE:\t" $count_PHE, "\n";
print " PRo:\t" $count_PRO, "\n";
print " SER:\t" $count_SER, "\n";
print " THR:\t" $count_THR, "\n";
print " TRP:\t" $count_TRP, "\n";
print " TYR:\t" $count_TYR, "\n";
print " VAL:\t" $count_VAL, "\n";
print "\n"
print "ATOM COUNT"
print "\n"
print " C:\t" $count_carbon, "\n";
print " N:\t" $count_nitrogen, "\n";
print " O:\t" $count_oxygen, "\n";
print " P:\t" $count_phosphorus, "\n";
print " S:\t" $count_sulfur, "\n";
print "\n"
