#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdint.h>
#include <stdint.h>
#include <memory.h>
#include <errno.h>
#include <openssl/pem.h>
#include <openssl/ec.h>
#include <openssl/evp.h>

EVP_PKEY *
load_ec_priv_key( char * file )
{
    FILE * fp = fopen( file, "r" );

    if (fp == 0) {
        printf( "Cannot read file %s: ", file );
	perror( "" );
        printf( "\n");
        return 0;
    }

    EVP_PKEY * key = PEM_read_PrivateKey( fp, &key, 0, 0 );

    if (key == 0) {
        printf( "File %s doesn´t have a valid PEM encoding of a private key\n", file );
        return 0;
    }

    if (EVP_PKEY_get_id( key ) != EVP_PKEY_EC) {
        printf( "File %s doesn´t have a valid PEM encoding of an EC private key\n", file );
        return 0;
    }

    return key;
}

void
sign( EVP_PKEY * key, const EVP_MD * digest_func, int fd_in, int fd_out )
{
    EVP_MD_CTX * md_ctx = EVP_MD_CTX_new();

    // Setup the signature engine, providing only the digest function

    if (EVP_SignInit( md_ctx, digest_func ) == 0) {
        printf( "Internal error, cannot use the provided digest function\n" );
	return;
    }

    // Since we don't know the size of the input file, we will prehash it in 4K chunks
// TODO: add your code here
// until here
        
    // Now we can sign the digest with ECDSA and the private key provided

    if (EVP_SignFinal( md_ctx, signature, &signature_len, key ) == 0) {
        printf( "Internal error, failed to sign\n" );
	return;
    }

    write( fd_out, signature, signature_len );

    // Release dynamic memory

    EVP_MD_CTX_free( md_ctx );
}

struct digest_dict_t {
    char * name;
    const EVP_MD * (*function)();
} digest_dict[4] = {
    {"SHA-256", EVP_sha256},
    {"SHA-384", EVP_sha384},
    {"SHA-512", EVP_sha512},
    {0, 0}
};

void *
get_digest_func( char * name )
{
    for (int i = 0; digest_dict[i].name; i++) {
        if (strcmp( name, digest_dict[i].name ) == 0) {
	    return digest_dict[i].function;
	}
    }

    return 0;
}

int
main( int argc, char * argv[] )
{
    EVP_MD * (*digest_func)();
    int fd_in = 0, fd_out = 1;

    if (argc < 3 || (digest_func = get_digest_func( argv[2] )) == 0) {
        printf( "Usage: %s priv_file digest_func [file to sign] [signature file]\n", argv[0] );
        printf( "       digest_func can be either SHA-256, SHA-384 or SHA-512\n" );
        return 1;
    }

    EVP_PKEY * pub_key = load_ec_priv_key( argv[1] );

    if (pub_key == 0) {
        return 1;
    }

    // If there is a file to sign, use it, otherwise use stdin

    if (argc > 3) {
	fd_in = open( argv[3], 0 );
        if (fd_in == -1) {
            printf( "Cannot read from file %s: ", argv[3] );
	    perror( "" );
	    printf( "\n" );
            return 1;
	}
    }
    
    // If there is a file to store the signature, use it, otherwise use stdout (reopened in binary mode)

    if (argc > 4) {
	fd_out = open( argv[4], 0 );
        if (fd_out == -1) {
            printf( "Cannot write to file %s: ", argv[4] );
	    perror( "" );
	    printf( "\n" );
            return 1;
	}
    }

    sign( pub_key, (*digest_func)(), fd_in, fd_out );

    return 0;
}
