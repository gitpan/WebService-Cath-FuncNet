use Test::More tests => 8;
use strict;
use warnings;

BEGIN {
use_ok( 'WebService::Cath::FuncNet' );
}

isa_ok( my $ws = WebService::Cath::FuncNet->new(), 'WebService::Cath::FuncNet' );

my @proteins1 = qw( A3EXL0 Q8NFN7 O75865 );
my @proteins2 = qw( Q5SR05 Q9H8H3 P22676 );
    
isa_ok( my $response = $ws->score_pairwise_relations( \@proteins1, \@proteins2 ), 
        'WebService::Cath::FuncNet::Operation::ScorePairwiseRelations::Response' );

isa_ok( my $results_ref = $response->results, 'ARRAY' );

my $first_result = $results_ref->[0];

is( $first_result->protein_1, 'O75865', 'protein_1' );
is( $first_result->protein_2, 'Q9H8H3', 'protein_2' );
is( $first_result->p_value, 0.445814, 'p_value' );
is( $first_result->raw_score, 0, 'raw_score' );
