pFont <- function (path, filename, output) {
  
  setwd (path)
  file = read.table(filename, col.names = c("start", "end", "transcription"))
  file = file[c("transcription")]
  
  #file$V3 <- sub("[:blank:]", "", file$V3)
  for(i in file$transcription) {
  file$transcription <- sub("a", "ŋ", file$transcription)
  file$transcription <- sub("c", "ʃ", file$transcription)
  file$transcription <- sub("j", "dʒ", file$transcription)
  file$transcription <- sub("q", "æ", file$transcription)
  file$transcription <- sub("x", "Ʒ", file$transcription)
  file$transcription <- sub("1", "e", file$transcription)
  file$transcription <- sub("2", "ɛ", file$transcription)
  file$transcription <- sub("3", "e", file$transcription)
  file$transcription <- sub("4", "ʌ", file$transcription)
  file$transcription <- sub("5", "ɚ", file$transcription)
  file$transcription <- sub("6", "ɝ", file$transcription)
  file$transcription <- sub("7", "ʊ", file$transcription)
  file$transcription <- sub("8", "ɪ", file$transcription)
  file$transcription <- sub("9", "ɔ", file$transcription)
  file$transcription <- sub("0", "ɐ", file$transcription)
  file$transcription <- sub("=", "ʔ", file$transcription)
  file$transcription <- sub(";", "ð", file$transcription)
  file$transcription <- sub("'", "θ", file$transcription)
  file$transcription <- sub("(\\[)", "ū", file$transcription)
  file$transcription <- sub("(\\])", "ī", file$transcription)
  file$transcription <- sub("\\", "*", file$transcription, fixed = TRUE)
  }
  file$transcription <- sub("y", "j", file$transcription)
  write.table(file, output, quote=FALSE, row.names = FALSE, col.names = FALSE)
  return (file)
}