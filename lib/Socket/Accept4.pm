package Socket::Accept4;
use 5.008005;
use strict;
use warnings;
use parent qw(Exporter);

our $VERSION = "0.01";

our @EXPORT = qw(accept4 SOCK_CLOEXEC SOCK_NONBLOCK);

use XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

1;
__END__

=encoding utf-8

=head1 NAME

Socket::Accept4 - It's new $module

=head1 SYNOPSIS

    use Socket::Accept4;
    use Fcntl qw(O_CLOEXEC);

    accept4(O_CLOEXEC);

=head1 DESCRIPTION

Socket::Accept4 is ...

=head1 LICENSE

Copyright (C) tokuhirom.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

tokuhirom E<lt>tokuhirom@gmail.comE<gt>

=cut

