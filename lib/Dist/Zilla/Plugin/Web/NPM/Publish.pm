package Dist::Zilla::Plugin::Web::NPM::Publish;

# ABSTRACT: Publish your module in npm with `dzil release`  

use Moose;

with 'Dist::Zilla::Role::Releaser';

use Path::Class;


has 'sudo' => (
    is          => 'rw',
    
    default     => 0
);


# required by [Twitter] 

has 'user' => (
    is          => 'rw',
    default     => 'CPANID'
);


#================================================================================================================================================================================================================================================
sub release {
    my ($self, $archive) = @_;
    
    my $sudo = $self->sudo ? 'sudo' : '';
    
    $self->log(`$sudo npm publish $archive`);
}




no Moose;
__PACKAGE__->meta->make_immutable(inline_constructor => 0);


1;


=head1 SYNOPSIS

In your F<dist.ini>:

    [Web::NPM::Publish]
    sudo = 1             ; add `sudo` to the publish call, defaults to 0

=head1 DESCRIPTION

This plugin will just call `npm publish <tarball>` during `dzil release`.


=cut
