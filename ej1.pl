use Bio::SeqIO;

# We run this script as described in the $usage string. 
my $usage = "Example: perl ej1.pl sequence.gb result_ej1.fas\n"; 

# We retrieve the input and output file from the command of the script execution.
my $infile = shift or die $usage; 
my $outfile = shift or die $usage;

# We construct a new Bio::SeqIO object to representate our genbank input file.
my $seqin = Bio::SeqIO->new( -file   => "$infile",
                             -format => 'Genbank',
                           );

# We construct a new Bio::SeqIO object to representate our fasta output file.
my $seqout = Bio::SeqIO->new( -file   => ">$outfile",
                              -format => 'Fasta',
                            );

# We generate out fasta file from out genbank file.
while (my $inseq = $seqin->next_seq) {
   $seqout->write_seq($inseq);
}
