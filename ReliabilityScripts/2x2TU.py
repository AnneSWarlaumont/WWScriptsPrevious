#!/usr/local/bin/python

# Anne S. Warlaumont
# This script calculates percent agreement between coders on whether or not a person was vocalizing.

import sys

ts1 = []
ts1file = open(sys.argv[1],'r')
for line in ts1file.readlines():
	dat = line.split()
	ts1.append(dat[2])
	ts1file.close()

ts2 = []
ts2file = open(sys.argv[2],'r')
for line in ts2file.readlines():
	dat = line.split()
	ts2.append(dat[2])
	ts2file.close()

matchT = float(0)
matchN = float(0)
mismatchTN = float(0)
mismatchNT = float(0)

tt = 'TT'
tn = 'TN' 
nt = 'NT' 
nn = 'NN' 

for t in range(len(ts1)):
	temptype = str(ts1[t]) + str(ts2[t])
	if temptype == tt:
		matchT += 1
	elif temptype == tn:
		mismatchTN += 1
	elif temptype == nn:
		matchN += 1
	elif temptype == nt:
		mismatchNT += 1

total = (float(matchT) + float(matchN) + float(mismatchTN) + float(mismatchNT))
outfile = open(sys.argv[3],'w')

outfile.write("TT: " + str(matchT) + "\n")
outfile.write("NT: " + str(mismatchNT) + "\n")
outfile.write("TN: " + str(mismatchTN) + "\n")
outfile.write("NN: " + str(matchN) + "\n")
outfile.write("total units: " + str(total) + "\n")
outfile.close()


