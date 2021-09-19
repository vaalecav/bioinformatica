use Bio::SeqIO;

my $usage = "Example: perl gbk2fasta.pl in.gbk out.fas\n"; 
my $infile = shift or die $usage; 
my $outfile = shift or die $usage;

my $seqin = Bio::SeqIO->new( -file   => "$infile",
                             -format => 'Genbank',
                           );

my $seqout = Bio::SeqIO->new( -file   => ">$outfile",
                              -format => 'Fasta',
                            );

while (my $inseq = $seqin->next_seq) {
   $seqout->write_seq($inseq);
}
