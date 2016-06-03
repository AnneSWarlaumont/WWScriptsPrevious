# This script calculates for proportional agreement and kappa.

library(plyr)
library(lpSolve)
library(irr)

#setwd("/Users/lab/Gina/ReliabilityChecksData/")

agreementKappa <- function(path, masterFilename, reliabilityFilename, outputFilename) {

#set path
setwd(path)
#load master data
m1 = read.table(masterFile, col.names = c("Master"))
#load reliability check data
r1 = read.table(reliabilityFile, col.names = c("Reliability_Check")) 

matches = NULL 
nomatch = NULL

#find matches, replacing it as "Matching" 
matches <- replace(matches, which(m1 == r1), "Matching")
#find nonmatches, replacing it as "nomatch"
nomatch <- replace(nomatch, which(m1 != r1), "nomatch")

#find the sum of all matches
sum.match = length(which(matches == "Matching"))
#find the sum of all nonmatches
sum.nomatch = length(which(nomatch == "nomatch"))

sink(outputFilename, append=FALSE, split = TRUE) 
print("Number of units: ")
print(nrow(m1))
print("Number of matches: ")
print(sum.match)
print("Number of mismatches: ")
print(sum.nomatch)
print("Proportion agreement: ")
print(sum.match/nrow(m1))

#Cohen's Kappa
data = m1
data["Reliability_Check"] <- r1$Reliability_Check
cohensKappa = kappa2(data, "unweighted")
print(cohensKappa)
#lapply(cohensKappa, write, "testGinaProj.txt", append=TRUE, ncolumns = 5)

#close writing to outputfile
sink()
#place output into the file
sink(outputFilename, append=TRUE)
#closing the file
sink()

}

