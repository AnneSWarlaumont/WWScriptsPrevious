library(plyr)
library(lpSolve)
library(irr)

setwd("/Users/ginapretzer/Desktop/WWScripts/Reliability/")

  #load master data
  m1 = read.table("WW15_Master_Annotation_File_AUD.txt", col.names = c("start", "end", "Master"))
  m1 = m1[c("Master")]
  m2 = read.table("WW16_Master_Annotation_File_AUD.txt", col.names = c("start", "end", "Master")) 
  m2 = m2[c("Master")]
  # m3 = read.table("WW10_Master_Annotation_File_AUD.txt", col.names = c("start", "end", "Master")) 
  # m3 = m3[c("Master")]
  # m4 = read.table("WW23_Master_Annotation_File_AUD.txt", col.names = c("start", "end", "Master")) 
  # m4 = m4[c("Master")]
  # m5 = read.table("WW28_Master_Annotation_File_AUD.txt", col.names = c("start", "end", "Master")) 
  # m5 = m5[c("Master")]
  # m6 = read.table("WW60_Master_Annotation_File_AUD.txt", col.names = c("start", "end", "Master"))
  # m6 = m6[c("Master")]
  
  #list the master data in one data frame
  # df1 = rbind(m1, m2, m3, m4, m5, m6)
 df1 = rbind(m1, m2)

  for(i in df1$Master) if (i %in% "TRUE")df1$Master <- "T"
  
  write.table(df1, "masterListAUD.txt", quote=FALSE, row.names = FALSE, col.names = FALSE)
  
  #load reliability check data
  r1 = read.table("WW15_AF_Reliability_Check_AUD.txt", col.names = c("start", "end", "Reliability_Check"))
  r1 = r1[c("Reliability_Check")]
  r2 = read.table("WW16_SM_Reliability_Check_AUD.txt", col.names = c("start", "end", "Reliability_Check"))
  r2 = r2[c("Reliability_Check")]
  # r3 = read.table("WW10_SM_Reliability_Check_AUD.txt", col.names = c("start", "end", "Reliability_Check"))
  # r3 = r3[c("Reliability_Check")]
  # r4 = read.table("WW23_SM_Reliability_Check_AUD.txt", col.names = c("start", "end", "Reliability_Check"))
  # r4 = r4[c("Reliability_Check")]
  # r5 = read.table("WW28_SM_Reliability_Check_AUD.txt", col.names = c("start", "end", "Reliability_Check"))
  # r5 = r5[c("Reliability_Check")]
  # r6 = read.table("WW60_SM_Reliability_Check_AUD.txt", col.names = c("start", "end", "Reliability_Check"))
  # r6 = r6[c("Reliability_Check")]
  
  #list reliability check data in one data frame
  # df2 = rbind(r1, r2, r3, r4, r5, r6)
  df2 = rbind(r1, r2)

  write.table(df2, "reliabilityListAUD.txt", quote=FALSE, row.names = FALSE, col.names = FALSE)
  
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
  print(nrow(df1))
  print("Number of matches:")
  print(sum.match)
  print("Number of mismatches: ")
  print(sum.nomatch)
  print("Proportion agreement: ")
  print(sum.match/nrow(df1))
  
  #Cohen's Kappa
  data = df1
  data["Reliability_Check"] <- r1$Reliability_Check
  cohensKappa = kappa2(data, "squared")
  print(cohensKappa)