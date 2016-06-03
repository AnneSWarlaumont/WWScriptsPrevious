setwd("/Users/lab/Gina/ReliabilityChecksData")

#load master data
m1 = read.table("WW08_Master_Annotation_File_AUD.txt", col.names = c("start", "end", "Master"))
m2 = read.table("WW09_Master_Annotation_File_AUD.txt", col.names = c("start", "end", "Master")) 
m3 = read.table("WW10_Master_Annotation_File_AUD.txt", col.names = c("start", "end", "Master")) 
m4 = read.table("WW23_Master_Annotation_File_AUD.txt", col.names = c("start", "end", "Master")) 
m5 = read.table("WW28_Master_Annotation_File_AUD.txt", col.names = c("start", "end", "Master")) 
m6 = read.table("WW60_Master_Annotation_File_AUD.txt", col.names = c("start", "end", "Master")) 

#m1$Master <- as.numeric(m1$Master)
#m2$Master <- as.numeric(m2$Master)

#list the master data in one data frame
df1 = rbind(m1, m2, m3, m4, m5, m6)
#df1 = rbind(m1, m2)

for(i in df1$Master) if (i %in% "TRUE")df1$Master <- "T"

#convert to numeric values 
#df1$Master <- as.numeric(df1$Master)

#creates output file 
write.table(df1, "masterListAUD.txt", quote=FALSE, row.names = FALSE, col.names = FALSE)

#load reliability check data
r1 = read.table("WW08_SM_Reliability_Check_AUD.txt", col.names = c("start", "end", "Reliability_Check"))
r2 = read.table("WW09_SM_Reliability_Check_AUD.txt", col.names = c("start", "end", "Reliability_Check"))
r3 = read.table("WW10_SM_Reliability_Check_AUD.txt", col.names = c("start", "end", "Reliability_Check"))
r4 = read.table("WW23_SM_Reliability_Check_AUD.txt", col.names = c("start", "end", "Reliability_Check"))
r5 = read.table("WW28_SM_Reliability_Check_AUD.txt", col.names = c("start", "end", "Reliability_Check"))
r6 = read.table("WW60_SM_Reliability_Check_AUD.txt", col.names = c("start", "end", "Reliability_Check"))

#r1$Reliability_Check <- as.numeric(r1$Reliability_Check)
#r2$Reliability_Check <- as.numeric(r2$Reliability_Check)

#list reliability check data in one data frame
df2 = rbind(r1, r2, r3, r4, r5, r6)
#df2 = rbind(r1, r2)

#df2$Reliability_Check <- as.numeric(df2$Reliability_Check)

#creates output file
write.table(df2, "reliabilityListAUD.txt", quote=FALSE, row.names = FALSE, col.names = FALSE)