# NAME

Linux::Socket::Accept4 - accept4(2) binding

# SYNOPSIS

    use Linux::Socket::Accept4;
    use Fcntl qw(SOCK_CLOEXEC);

    accept4(CSOCK, SSOCK, SOCK_CLOEXEC);

# DESCRIPTION

Linux::Socket::Accept4 is a wrapper moodule for accept4(2).
This module is only available on GNU Linux.

# LICENSE

Copyright (C) tokuhirom.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

tokuhirom <tokuhirom@gmail.com>

# SEE ALSO

- [reintroduce accept4](http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=de11defebf00007677fb7ee91d9b089b78786fbb)
- [accept4 in ruby](http://svn.ruby-lang.org/cgi-bin/viewvc.cgi?revision=33596&view=revision)
