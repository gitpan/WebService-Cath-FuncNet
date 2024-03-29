use Test::More tests => 3;

use strict;
use warnings;

my %init = (
    'protein_1' => 'ASDVDF',
    'protein_2' => 'QWEQER',
    'raw_score' => '0.234134',
    'p_value' => '0.12313245',
);

use_ok( 'WebService::Cath::FuncNet::Operation::ScorePairwiseRelations::Result' );


isa_ok( my $r = WebService::Cath::FuncNet::Operation::ScorePairwiseRelations::Result->new( %init ),
    'WebService::Cath::FuncNet::Operation::ScorePairwiseRelations::Result' );

is ( $r->p_value, '0.12313245', 'p_value looks OK' );





