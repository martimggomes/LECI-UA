#!/usr/bin/python3

import sys

import socket
import wolfssl

HOST = 'localhost'
PORT = 443

def main( args ):
    if len(args) == 2:
        port = int(args[1])
    else:
        port = PORT

    # context is fundamental for validation

    context = wolfssl.SSLContext( wolfssl.PROTOCOL_DTLSv1_2 )
    context.verify_mode = wolfssl.CERT_REQUIRED
    context.load_verify_locations( cafile= "ca_crt.pem" )

    with socket.socket( socket.AF_INET, socket.SOCK_DGRAM ) as sock:
        sock.connect( (HOST, port ) )
        dtls_sock = context.wrap_socket( sock, server_hostname=HOST )

        dtls_sock.do_handshake()

        dtls_sock.write( b"ping" )
        data = dtls_sock.read()
        print( "Received:", data.decode() )
        dtls_sock.close()

if __name__ == "__main__":
    main( sys.argv )
