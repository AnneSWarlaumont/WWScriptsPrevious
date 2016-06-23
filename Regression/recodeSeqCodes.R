setwd("/Users/ginapretzer/Desktop/WWScripts/Regression/")

### Read in csv ###
seqcodes <- read.csv("sequencecodes.csv", header = TRUE, sep = "")

### create new dataframe ###
eventcodes <- data.frame(InfantID=InfantID,
						 Event1=code1,
						 Event2=code2,
						 sep="", stringsAsFactors=FALSE)
						 

### set up new columns with variables based on Event 1 and 2 to go into new dataframe ###
eventcodes["Event1T"] <- a.vector # what goes here? 
eventcodes["Event1N"] <- a.vector
eventcodes["Event1C"] <- a.vector
eventcodes["Event1X"] <- a.vector
eventcodes["Event1R"] <- a.vector
eventcodes["Event2T"] <- a.vector
eventcodes["Event2N"] <- a.vector
eventcodes["Event2C"] <- a.vector
eventcodes["Event2X"] <- a.vector
eventcodes["Event2R"] <- a.vector

### add data into new columns ###

for (i in 1:nrow) {

	### Infant led; adult follow
	if (eventcodes$Event2 == "T") {
		eventcodes$Event2T == "T"
		else eventcodes$Event2T == "notT"
	else if (eventcodes$Event2 == "N")
			eventcodes$Event2N == "N"
			else eventcodes$Event2N == "notN"
	else if (eventcodes$Event1 == "C")
			eventcodes$Event1C == "C"
			else eventcodes$Event1C == "notC"
	else if (eventcodes$Event1 == "X")
			eventcodes$Event1X == "X"
			else eventcodes$Event1X == "notX"
	else if (eventcodes$Event1 == "R")
			eventcodes$Event1R == "R"
			else eventcodes$Event1R == "notR"
			
	### Adult led; infant follow
	else if (eventcodes$Event1 == "T") 
			eventcodes$Event1T == "T"
			else eventcodes$Event1T == "notT"
	else if (eventcodes$Event1 == "N")
			eventcodes$Event1N == "N"
			else eventcodes$Event2N == "notN"
	else if (eventcodes$Event2 == "C")
			eventcodes$Event2C == "C"
			else eventcodes$Event1C == "notC"
	else if (eventcodes$Event2 == "X")
			eventcodes$Event2X == "X"
			else eventcodes$Event1X == "notX"
	else if (eventcodes$Event2 == "R")
			eventcodes$Event2R == "R"
			else eventcodes$Event2R == "notR"
	}	
}

### Write to .csv file ###
write.csv(eventcodes, "eventcodes.csv")

