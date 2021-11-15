#!/usr/bin/python3
import sys
import hashlib

BUFF_SIZE = 16384 
md5 = hashlib.md5()
sha1 = hashlib.sha1()
sha256 = hashlib.sha256()
sha512 = hashlib.sha512()

whatfile = sys.argv[1]

if (whatfile!=" "):
    with open(whatfile, 'rb') as f:
        while chunk := f.read(BUFF_SIZE):
            md5.update(chunk)
            sha1.update(chunk)
            sha256.update(chunk)
            sha512.update(chunk)

    print ("MD5:    {0}".format(md5.hexdigest()))
    print ("SHA1:   {0}".format(sha1.hexdigest()))
    print ("SHA256: {0}".format(sha256.hexdigest()))
    print ("SHA512: {0}".format(sha512.hexdigest()))
