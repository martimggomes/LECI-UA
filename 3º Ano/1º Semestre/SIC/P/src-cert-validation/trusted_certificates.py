#!/usr/bin/python3

import sys
import os
import re
from cryptography import x509
from datetime import datetime, timezone

def add_trusted_certificate( file, cert_dict ):
    try:
        with open( file, "rb" ) as fd:
            certificate = x509.load_pem_x509_certificate( fd.read() )
    except Exception as e:
        print( f"Cannot load certificate from file {file}: {e}" )
        return

    # Subjects are named with Distinguished Names (DN).
    # These are names that are sequences of attributes, similar to a teble row.
    #
    # Each attribute (or column in the table metaphore) is tagged with an OID (Object Identifier).
    # Object identifiers are semantic identifiers, that state what the attribute means.
    # For instance, 2.5.4.6 is CountryName (or C), 2.5.4.3 is CommonName (CN), etc.
    #
    # The RFC 4519 regulates the short names (such as C for CountryName and CN for CommonName), which are more user-friendly when
    # dealing with these names (as in RFC 4514).
    #
    # The usual way DNs are presented as a single string is as a continuous sequence of Identifier=Value pairs separated by slashes (/) or commas (,):
    #     /C=US/O-Digicert Inc/OU=www.digicert.com/CN=DigiCert Global Root CA
    #     C=US,O-Digicert Inc,OU=www.digicert.com,CN=DigiCert Global Root CA
# TODO: add your code here
# until here

def trust( directory ):
    cert_dict = {}

    with os.scandir( directory ) as d:
# TODO: add your code here
# until here
    return cert_dict

def main( argv ):
    if len(argv) < 2:
        print( "Usage: %s directory" % (argv[0]) )
        return

    cert_dict = trust( argv[1] )

    print( "%d valid trusted certificates found" % (len(cert_dict)) )

if __name__ == "__main__":
    main( sys.argv )
