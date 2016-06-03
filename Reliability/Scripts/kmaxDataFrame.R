setwd("/Users/lab/Gina/ReliabilityChecksData")

#load master data
m1 = read.table("WW08_Master_Annotation_File_IUT.txt", col.names = c("start", "end", "Master"))
m1$Master <- sub("TRUE", "T", m1$Master)
m2 = read.table("WW09_Master_Annotation_File_IUT.txt", col.names = c("start", "end", "Master")) 
m3 = read.table("WW10_Master_Annotation_File_IUT.txt", col.names = c("start", "end", "Master")) 
m4 = read.table("WW23_Master_Annotation_File_IUT.txt", col.names = c("start", "end", "Master")) 
m5 = read.table("WW28_Master_Annotation_File_IUT.txt", col.names = c("start", "end", "Master")) 
m6 = read.table("WW60_Master_Annotation_File_IUT.txt", col.names = c("start", "end", "Master")) 

#list the master data in one data frame
df1 = rbind(m1, m2, m3, m4, m5, m6)

#convert to numeric values 
#df1$Master <- as.numeric(df1$Master)

#creates output file 
write.table(df1, "masterListIUT.txt", quote=FALSE, row.names = FALSE, col.names = FALSE)

#load reliability check data
r1 = read.table("WW08_ASW_Reliability_Check_IUT.txt", col.names = c("start", "end", "Reliability_Check"))
r2 = read.table("WW09_ASW_Reliability_Check_IUT.txt", col.names = c("start", "end", "Reliability_Check"))
r3 = read.table("WW10_ASW_Reliability_Check_IUT.txt", col.names = c("start", "end", "Reliability_Check"))
r4 = read.table("WW23_ASW_Reliability_Check_IUT.txt", col.names = c("start", "end", "Reliability_Check"))
r5 = read.table("WW28_ASW_Reliability_Check_IUT.txt", col.names = c("start", "end", "Reliability_Check"))
r6 = read.table("WW60_ASW_Reliability_Check_IUT.txt", col.names = c("start", "end", "Reliability_Check"))

#list reliability check data in one data frame
df2 = rbind(r1, r2, r3, r4, r5, r6)
#df2 = rbind(r1, r2)

#df2$Reliability_Check <- as.numeric(df2$Reliability_Check)

#creates output file
write.table(df2, "reliabilityListIUT.txt", quote=FALSE, row.names = FALSE, col.names = FALSE)