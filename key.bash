#!/bin/bash
openssl genrsa -out site2.internal.key 4096
openssl req -new -out site2.internal.csr -sha256 -key site2.internal.key -subj "/C=US/ST=California/L=Northridge/O=CIT384/OU=DogeSmirk/CN=site2.internal"
openssl x509 -req -in site2.internal.csr -days 365 -signkey site2.internal.key -out site2.internal.cert -outform PEM

openssl genrsa -out site3.internal.key 4096
openssl req -new -out site3.internal.csr -sha256 -key site3.internal.key -subj "/C=US/ST=California/L=Northridge/O=CIT384/OU=DogeSmirk/CN=site3.internal"
openssl x509 -req -in site3.internal.csr -days 365 -signkey site3.internal.key -out site3.internal.cert -outform PEM

