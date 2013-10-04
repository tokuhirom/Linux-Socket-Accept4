package builder::MyBuilder;
use strict;
use warnings;
use utf8;
use 5.010_001;
use parent qw(Module::Build);
use Devel::CheckCompiler 0.03;

sub new {
    my $self = shift;
    if ($^O ne 'linux') {
        print "This module only supports linux.\n";
        exit 0;
    }
    if (check_compile(<<'...') != 1) {
#include <sys/syscall.h>

#if !defined __NR_accept4
#error "Your environment does not supports accept4."
#endif
...
        print "This module only supports linux 2.6.28+ and glibc 2.10+.\n";
        exit 0;
    }
    $self->SUPER::new(@_);
}


1;

