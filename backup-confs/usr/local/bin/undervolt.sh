#! /bin/sh

#
# Setting undervolt at boot/resume
# P0 - FID 64 (2.0 GHz) - DID A - VID 58 (1.00 V)
# P1 - FID 66 (1.7 GHz) - DID C - VID A6 (0.5125 V)
# P2 - FID 60 (1.6 GHz) - DID C - VID A8 (0.50 V)
#

# Check if zenstates is installed
[ -x /usr/local/bin/zenstates.py ] || { echo "/usr/local/bin/zenstates.py is not executable";
    exit 1; }

# Set P2
/usr/local/bin/zenstates.py -p 2 -f 60 -d C -v A8
# Set P1
/usr/local/bin/zenstates.py -p 1 -f 66 -d C -v A6
# Set P0
/usr/local/bin/zenstates.py -p 0 -f 64 -d A -v 58
