#!/usr/bin/python3

import sys
import socket
import wolfssl

HOST = '127.0.0.1'
PORT = 443
CERT = 'server_crt.pem'
KEY = 'server_keys.pem'

def main( args ):
    if len(args) == 2:
        port = int(args[1])
    else:
        port = PORT

    while True:
        with socket.socket( socket.AF_INET, socket.SOCK_DGRAM, 0 ) as sock:
            sock.bind( (HOST, port) )

            # context is fundamental for validation

            context = wolfssl.SSLContext( wolfssl.PROTOCOL_DTLSv1_2, server_side=True )
            context.load_cert_chain( certfile = CERT, keyfile = KEY )

            # Wait for a new client

            print( "DTLS server listening..." )
            _, addr = sock.recvfrom( 2048 )
            print( "Connection from:", addr )

            # Connect UDP socket so DTLS knows the peer

            sock.connect( addr )
            dtls_sock = context.wrap_socket( sock, server_side=True )

            dtls_sock.do_handshake()
            print( "DTLS handshake complete." )

            data = dtls_sock.recv()
            print( "Received:", data.decode() )
            dtls_sock.send( b"pong" )
            dtls_sock.close()

if __name__ == "__main__":
    main( sys.argv )
