 #!/usr/local/bin/perl
 
use blib;
use Socket::Accept4;

use Socket;

#ソケット作成
socket(SERVER, PF_INET, SOCK_STREAM, getprotobyname('tcp')) or die;
setsockopt(SERVER, SOL_SOCKET, SO_REUSEADDR, 1)
   or die "Can't set socket option to SO_REUSEADDR $!\n";
#ポートに結びつけ 6666番
bind(SERVER, pack_sockaddr_in(6666, INADDR_ANY)) or die;
#接続を待つ
listen(SERVER, SOMAXCONN) or die;
#接続が来たら中を実行、それまで待機
while(my $sockaddr = accept4(*CLIENT, *SERVER, SOCK_CLOEXEC)){
	my $org_handle = select(CLIENT); $| = 1; select($org_handle);
	while(<CLIENT>){
		print CLIENT $_;
	}
}
