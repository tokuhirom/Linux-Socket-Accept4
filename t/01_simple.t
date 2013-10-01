use strict;
use Test::More;

use Linux::Socket::Accept4;

is(Linux::Socket::Accept4::hello(), 'Hello, world!');

done_testing;

