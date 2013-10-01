use strict;
use Test::More;

use Socket::Accept4;

is(Socket::Accept4::hello(), 'Hello, world!');

done_testing;

