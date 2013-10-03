package builder::MyBuilder;
use strict;
use warnings;
use utf8;
use 5.010_001;
use parent qw(Module::Build);

sub new {
    my $self = shift;
    if ($^O ne 'linux') {
        print "This module only supports linux.\n";
        exit 0;
    }
    $self->SUPER::new(@_);
}


1;

