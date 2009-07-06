use Test::More tests => 2;
use strict;
use warnings;

use FindBin;
use URI::file;

BEGIN {
use_ok( 'WebService::FuncNet::Predictor' );
}

my ( $ws, $wsdl, $wsdl_uri );

$wsdl = $FindBin::Bin . '/' . 'GecoService.wsdl';

$wsdl_uri = URI::file->new( $wsdl );

isa_ok( $ws = WebService::FuncNet::Predictor->new( wsdl => $wsdl_uri ), 'WebService::FuncNet::Predictor', 'new (local WSDL)' );
