package WebService::Cath::FuncNet::Operation;

=head1 NAME

WebService::Cath::FuncNet::Operation

=head1 SYNOPSIS

Represents a WebService Operation - should be extended by all other operations

  package WebService::Cath::FuncNet::Operation::DoSomething;
  use Moose;
  extends 'WebService::Cath::FuncNet::Operation';
  
  

  $ws = WebService::Cath::FuncNet->new();
  
  $op = WebService::Cath::FuncNet::Operation

=cut

use Moose;

with 'WebService::Cath::FuncNet::Logable';

=head1 ACCESSORS

=cut

has 'root'      => ( is => 'ro', isa => 'WebService::Cath::FuncNet', required => 1 );
has 'operation' => ( is => 'rw', isa => 'Str', lazy => 1, default => '', required => 1 );
has 'port'      => ( is => 'rw', isa => 'Str', lazy => 1, default => '', required => 1 );
has 'service'   => ( is => 'rw', isa => 'Str', lazy => 1, default => '', required => 1 );
has 'binding'   => ( is => 'rw', isa => 'Str', lazy => 1, default => '', required => 1 );

has 'response_class' => ( is => 'rw', isa => 'ClassName', required => 1 );

=head1 METHODS

=head2 run( $parameters )

Calls the WebService operation with given parameter

=head3 RETURNS

WebService::Cath::FuncNet::Operation::ScorePairwiseRelations::Response

=cut

sub run {
    my $self = shift;
    my ( $parameters ) = @_;
    
    my %op_args = (
        operation => $self->operation,
        port      => $self->port,
        service   => $self->service,
        binding   => $self->binding,
    );
    
    my $op   = $self->root->wsdl->operation( %op_args );
    
    my $op_call             = $op->compileClient();
    my ( $answer, $trace )  = $op_call->( parameters => $parameters );

#     $self->debug( "parameters: ",   Dumper( $parameters ) );
#     $self->debug( "wsdl: ",         Dumper( $self->root->wsdl ) );
#     $self->debug( "op_args: ",      Dumper( \%op_args ) );
#     $self->debug( "op_call: ",      Dumper( $op_call ) );
#     $self->debug( "answer: ",       Dumper( $answer ) );
#     $self->debug( "trace: ",        Dumper( $trace ) );

    return $self->response_class->new( $answer );
}


1; # Magic true value required at end of module
__END__


=head1 AUTHOR

Ian Sillitoe  C<< <sillitoe@biochem.ucl.ac.uk> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, Ian Sillitoe C<< <sillitoe@biochem.ucl.ac.uk> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


