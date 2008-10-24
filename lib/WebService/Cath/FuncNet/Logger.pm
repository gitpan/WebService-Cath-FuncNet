package WebService::Cath::FuncNet::Logger;

=head1 NAME

WebService::Cath::FuncNet::Logger

=head1 SYNOPSIS

Provides singleton Log4perl logging object

    package WebService::Cath::FuncNet::NewClass;

    use Moose;

    use WebService::Cath::FuncNet::Logger;
    
    $logger = WebService::Cath::FuncNet::Logger->new( __PACKAGE__ );

    sub class_method {
        $logger->info( "foo" );
    }

=cut

use Moose;

use Log::Log4perl;

with 'WebService::Cath::FuncNet::Logable';

=head2 BUILDARGS

Builds logger from single argument parameter

=cut

sub BUILDARGS {
    my $class = shift;
    my $args  = @_ == 1
                    ? {
                        'logger' => Log::Log4perl->get_logger( $_[0] ),
                      }
                    : { @_ };
    
    return $args;
}

1; # Magic true value required at end of module
__END__


=head1 SEE ALSO

L<MooseX::Log::Log4perl::Easy>


=head1 AUTHOR

Ian Sillitoe  C<< <sillitoe@biochem.ucl.ac.uk> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, Ian Sillitoe C<< <sillitoe@biochem.ucl.ac.uk> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

