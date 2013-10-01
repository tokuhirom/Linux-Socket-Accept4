package Linux::Socket::Accept4;
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

Linux::Socket::Accept4 - accept4(2) binding

=head1 SYNOPSIS

    use Linux::Socket::Accept4;
    use Fcntl qw(SOCK_CLOEXEC);

    accept4(CSOCK, SSOCK, SOCK_CLOEXEC);

=head1 DESCRIPTION

Linux::Socket::Accept4 is a wrapper moodule for accept4(2).
This module is only available on GNU Linux.

=head1 LICENSE

Copyright (C) tokuhirom.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

tokuhirom E<lt>tokuhirom@gmail.comE<gt>

=head1 SEE ALSO

=over 4

=item L<reintroduce accept4|http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=de11defebf00007677fb7ee91d9b089b78786fbb>

=item L<accept4 in ruby|http://svn.ruby-lang.org/cgi-bin/viewvc.cgi?revision=33596&view=revision>

=back

=cut

