library(plyr)
library(lpSolve)
library(irr)

# setwd("/Users/lab/Gina/ReliabilityChecksData/")
setwd("/Users/ginapretzer/Desktop/WWScripts/Reliability/")

  #load master data
  m1 = read.table("WW15_Master_Annotation_File_IUD.txt", col.names = c("start", "end", "Master"))
  m1 = m1[c("Master")]
  m2 = read.table("WW16_Master_Annotation_File_IUD.txt", col.names = c("start", "end", "Master")) 
  m2 = m2[c("Master")]
  m3 = read.table("WW20_Master_Annotation_File_IUD.txt", col.names = c("start", "end", "Master")) 
  m3 = m3[c("Master")]
  m4 = read.table("WW23_Master_Annotation_File_IUD.txt", col.names = c("start", "end", "Master")) 
  m4 = m4[c("Master")]
  m5 = read.table("WW60_Master_Annotation_File_IUD.txt", col.names = c("start", "end", "Master")) 
  m5 = m5[c("Master")]
  m6 = read.table("WW62_Master_Annotation_File_IUD.txt", col.names = c("start", "end", "Master"))
  m6 = m6[c("Master")]
  
  #list the master data in one data frame
  fulldf1 = rbind(m1, m2, m3, m4, m5, m6)

  for(i in fulldf1$Master) if (i %in% "TRUE")fulldf1$Master <- "T"
  
  write.table(fulldf1, "masterListIUD.txt", quote=FALSE, row.names = FALSE, col.names = FALSE)
  
  #load reliability check data
  r1 = read.table("WW15_AF_Reliability_Check_IUD.txt", col.names = c("start", "end", "Reliability_Check"))
  r1 = r1[c("Reliability_Check")]
  r2 = read.table("WW16_AF_Reliability_Check_IUD.txt", col.names = c("start", "end", "Reliability_Check"))
  r2 = r2[c("Reliability_Check")]
  r3 = read.table("WW20_AF_Reliability_Check_IUD.txt", col.names = c("start", "end", "Reliability_Check"))
  r3 = r3[c("Reliability_Check")]
  r4 = read.table("WW23_AF_Reliability_Check_IUD.txt", col.names = c("start", "end", "Reliability_Check"))
  r4 = r4[c("Reliability_Check")]
  r5 = read.table("WW60_AF_Reliability_Check_IUD.txt", col.names = c("start", "end", "Reliability_Check"))
  r5 = r5[c("Reliability_Check")]
  r6 = read.table("WW62_AF_Reliability_Check_IUD.txt", col.names = c("start", "end", "Reliability_Check"))
  r6 = r6[c("Reliability_Check")]
  
  #list reliability check data in one data frame
  fulldf2 = rbind(r1, r2, r3, r4, r5, r6)

  write.table(fulldf2, "reliabilityListIUD.txt", quote=FALSE, row.names = FALSE, col.names = FALSE)
  
  df2 = fulldf2[which(fulldf2$Reliability_Check != "Uncoded"),]
  df1 = fulldf1[which(fulldf2$Reliability_Check != "Uncoded"),]
  df2 = factor(df2)
  
  matches = NULL 
  nomatch = NULL
  
  #find matches, replacing it as "Matching" 
  matches <- replace(matches, which(df1 == df2), "Matching")
  #find nonmatches, replacing it as "nomatch"
  nomatch <- replace(nomatch, which(df1 != df2), "nomatch")
  
  #find the sum of all matches
  sum.match = length(which(matches == "Matching"))
  #find the sum of all nonmatches
  sum.nomatch = length(which(nomatch == "nomatch"))
  
  print("Number of units:")
  print(length(df1))
  print("Number of matches:")
  print(sum.match)
  print("Number of mismatches: ")
  print(sum.nomatch)
  print("Proportion agreement: ")
  print(sum.match/length(df1))
  
  #Cohen's Kappa
  data = data.frame(df1, df2)
  cohensKappa = kappa2(data)
  print(cohensKappa)