IUTConversion <- function (path, inputFilename, outputFilename) {
  setwd(path)
  file = read.table(inputFilename, colClasses = c("numeric", "numeric", "character"))
  file = file[c("V3")]
  
  #for(i in df1$V3) if (i %in% "x")df1$V3 <- "X"
  file$V3 <- sub("x|yell", "X", file$V3)
  file$V3 <- sub("cry|grunt|laugh|fuss", "R", file$V3)
  file$V3 <- sub("^.*/.*", "C", file$V3)
  
  write.table(file, outputFilename, quote=FALSE, row.names = FALSE, col.names = FALSE)
}