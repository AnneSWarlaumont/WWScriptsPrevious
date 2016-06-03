setwd("/Users/lab/Gina/ReliabilityChecksData")

#load master data
m1 = read.table("WW08_Master_Annotation_File_IUT.txt", colClasses = c("numeric", "numeric", "character"))
m2 = read.table("WW09_Master_Annotation_File_IUT.txt", colClasses = c("numeric", "numeric", "character")) 
m3 = read.table("WW10_Master_Annotation_File_IUT.txt", colClasses = c("numeric", "numeric", "character")) 
m4 = read.table("WW23_Master_Annotation_File_IUT.txt", colClasses = c("numeric", "numeric", "character")) 
m5 = read.table("WW28_Master_Annotation_File_IUT.txt", colClasses = c("numeric", "numeric", "character")) 
m6 = read.table("WW60_Master_Annotation_File_IUT.txt", colClasses = c("numeric", "numeric", "character")) 

#list the master data in one data frame
df1 = rbind(m1, m2, m3, m4, m5, m6)

#for(i in df1$V3) if (i %in% "x")df1$V3 <- "X"
df1$V3 <- sub("x", "X", df1$V3)
#df1$V3 <- sub("\\W", "C", df1$V3)
df1$V3 <- sub("cry", "R", df1$V3)
df1$V3 <- sub("yell", "X", df1$V3)
df1$V3 <- sub("grunt", "R", df1$V3)
df1$V3 <- sub("laugh", "R", df1$V3)
df1$V3 <- sub("fuss", "R", df1$V3)
df1$V3 <- sub("^.*/.*", "C", df1$V3)

#creates output file 
write.table(df1, "masterListIUTkmax.txt", quote=FALSE, row.names = FALSE, col.names = FALSE)

r1 = read.table("WW08_ASW_Reliability_Check_IUT.txt", colClasses = c("numeric", "numeric", "character"))
r2 = read.table("WW09_ASW_Reliability_Check_IUT.txt", colClasses = c("numeric", "numeric", "character")) 
r3 = read.table("WW10_ASW_Reliability_Check_IUT.txt", colClasses = c("numeric", "numeric", "character")) 
r4 = read.table("WW23_ASW_Reliability_Check_IUT.txt", colClasses = c("numeric", "numeric", "character")) 
r5 = read.table("WW28_ASW_Reliability_Check_IUT.txt", colClasses = c("numeric", "numeric", "character")) 
r6 = read.table("WW60_ASW_Reliability_Check_IUT.txt", colClasses = c("numeric", "numeric", "character")) 

df2 = rbind(r1, r2, r3, r4, r5, r6)

#creates output file 
write.table(df2, "reliabilityListIUTkmax.txt", quote=FALSE, row.names = FALSE, col.names = FALSE)
