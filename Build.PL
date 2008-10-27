use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'WebService::Cath::FuncNet',
    license             => 'perl',
    dist_author         => 'Ian Sillitoe <sillitoe@biochem.ucl.ac.uk>',
    dist_version_from   => 'lib/WebService/Cath/FuncNet.pm',
    requires => {
        'Test::More'                        => 0,
        'version'                           => 0,
        'Moose'                             => '0.51',
        'Moose::Util::TypeConstraints'      => 0,
        'XML::Compile::WSDL11'              => 0,
        'XML::Compile::Transport::SOAPHTTP' => 0,
        'XML::Compile::Schema'              => 0,
        'URI'                               => 0,
        'LWP::UserAgent'                    => 0,
        'File::Temp'                        => 0,
        'Readonly'                          => 0,
        'Log::Log4perl'                     => 0,
    },
    add_to_cleanup      => [ 'WebService-Cath-FuncNet-*' ],
);

$builder->create_build_script();
