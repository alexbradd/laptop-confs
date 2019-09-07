#! /bin/sh

#
# Setting undervolt at boot/resume
# P0 - FID 64 (2.0 GHz) - DID A - VID 35 (1.21875 V)
# P1 - FID 66 (1.7 GHz) - DID C - VID 7E (0.7625 V)
# P2 - FID 60 (1.6 GHz) - DID C - VID 80 (0.75 V)
#

# Set P2
/usr/local/bin/zenstates.py -p 2 -f 60 -d C -v 88
# Set P1
/usr/local/bin/zenstates.py -p 1 -f 66 -d C -v 86
# Set P0
/usr/local/bin/zenstates.py -p 0 -f 64 -d A -v 50 
