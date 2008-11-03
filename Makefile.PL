use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'WebService::Cath::FuncNet',
    AUTHOR              => 'Ian Sillitoe <sillitoe@biochem.ucl.ac.uk>',
    VERSION_FROM        => 'lib/WebService/Cath/FuncNet.pm',
    ABSTRACT_FROM       => 'lib/WebService/Cath/FuncNet.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        "Test::More"                        => 0,
        "version"                           => 0,
        "Data::Dumper"                      => 0,
        "File::Temp"                        => 0,
        "LWP::UserAgent"                    => 0,
        "Log::Log4perl"                     => 0,
        "Moose"                             => 0,
        "Moose::Role"                       => 0,
        "Moose::Util::TypeConstraints"      => 0,
        "Readonly"                          => 0,
        "URI"                               => 0,
        "URI::Heuristic"                    => 0,
        "URI::file"                         => 0,
        "XML::Compile::Schema"              => 0,
        "XML::Compile::Transport::SOAPHTTP" => 0,
        "XML::Compile::WSDL11"              => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'WebService-Cath-FuncNet-*' },
);
