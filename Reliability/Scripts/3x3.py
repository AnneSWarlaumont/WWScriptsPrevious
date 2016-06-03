#finds values for the variables in a 3x3 matrix. 
#uncomment the proper labels below

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
matchU = float(0)
mismatchTN = float(0)
mismatchTU = float(0)
mismatchNT = float(0)
mismatchNU = float(0)
mismatchUT = float(0)
mismatchUN = float(0)

# Uncomment if running for infant utterance type
# nn = 'CC'
# nt = 'CR' 
# nu = 'CX' 
# tn = 'RC' 
# tt = 'RR' 
# tu = 'RX' 
# un = 'XC' 
# ut = 'XR' 
# uu = 'XX' 

# Uncomment if running for adult utterance direction
nn = 'NN'
nt = 'NT' 
nu = 'NU' 
tn = 'TN' 
tt = 'TT' 
tu = 'TU' 
un = 'UN' 
ut = 'UT' 
uu = 'UU'
 
# STOP! Do not make changes outside of this section!

for t in range(len(ts1)):
	temptype = str(ts1[t]) + str(ts2[t])
	if temptype == tt:
		matchT += 1
	elif temptype == tn:
		mismatchTN += 1
	elif temptype == tu:
		mismatchTU += 1
	elif temptype == nn:
		matchN += 1
	elif temptype == nt:
		mismatchNT += 1
	elif temptype == nu:
		mismatchNU += 1
	elif temptype == uu:
		matchU += 1
	elif temptype == ut:
		mismatchUT += 1
	elif temptype == un:
		mismatchUN += 1

mismatchT = mismatchTN + mismatchTU		
mismatchN = mismatchNT + mismatchNU
mismatchU = mismatchUT + mismatchUN

total = (float(matchT) + float(matchN) + float(matchU) + float(mismatchT) + float(mismatchN) + float(mismatchU))
outfile = open(sys.argv[3],'w')

# Uncomment if running for infant utterance type
# outfile.write("CC: " + str(matchT) + "\n")
# outfile.write("CR: " + str(mismatchNT) + "\n")
# outfile.write("CX: " + str(mismatchUT) + "\n")
# outfile.write("RC: " + str(mismatchTN) + "\n")
# outfile.write("RR: " + str(matchN) + "\n")
# outfile.write("RX: " + str(mismatchUN) + "\n")
# outfile.write("XC: " + str(mismatchTU) + "\n")
# outfile.write("XR: " + str(mismatchNU) + "\n")
# outfile.write("XX: " + str(matchU) + "\n")

#uncomment if running for adult utterance direction
outfile.write("TT: " + str(matchT) + "\n")
outfile.write("NT: " + str(mismatchNT) + "\n")
outfile.write("UT: " + str(mismatchUT) + "\n")
outfile.write("TN: " + str(mismatchTN) + "\n")
outfile.write("NN: " + str(matchN) + "\n")
outfile.write("UN: " + str(mismatchUN) + "\n")
outfile.write("TU: " + str(mismatchTU) + "\n")
outfile.write("NU: " + str(mismatchNU) + "\n")
outfile.write("UU " + str(matchU) + "\n")

outfile.write("total units: " + str(total) + "\n")
outfile.close()


