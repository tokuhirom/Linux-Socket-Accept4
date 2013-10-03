use strict;
use Test::More;
use Test::TCP;
use Linux::Socket::Accept4;
use IO::Socket::INET;
use IO::Select;

sub do_accept {
    my $server = shift;
    my $flags = shift;
    my $class = ref $server;
    my $conn = $class->new;
    my $peer = accept4($conn,$server,$flags);
    return wantarray ? ($conn,$peer) : ($conn);
}

test_tcp(
    client => sub {
        my ($port, $server_pid) = @_;
        my $client = IO::Socket::INET->new(
            Timeout => 5,
            PeerPort => $port,
            PeerAddr => '127.0.0.1',
        );
        ok($client);
        my $buf;
        eval {
            alarm(5);
            $client->syswrite('foo');
            $client->sysread($buf,1024);
        };
        alarm(0);
        is($buf, 'bar');
        # send request to the server
    },
    server => sub {
        my $port = shift;
        my $server = IO::Socket::INET->new(
            Listen    => SOMAXCONN,
            LocalPort => $port,
            LocalAddr => '127.0.0.1',
            Proto     => 'tcp',
            ReuseAddr => 1,
        );
        while ( my ($conn, $peer) = do_accept($server, SOCK_CLOEXEC|SOCK_NONBLOCK) ) {
            ok(!$conn->blocking);
            my $select = IO::Select->new($conn);
            $select->can_read(5);
            my $len = $conn->sysread(my $buf, 1024);
            next if defined $len && $len == 0;  #disconnect
            is($buf, 'foo');
            $select->can_write(5);
            $conn->syswrite('bar');
        }
    },
);

done_testing;

