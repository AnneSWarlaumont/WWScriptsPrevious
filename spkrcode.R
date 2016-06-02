spkrcode = function(path, file) {
	setwd(path)
	annotations = read.table(file,sep="\t",quote="",header=TRUE,col.names=c("start","end","InfIPA","AdultIPA","ortho","dir"),colClasses = c("numeric", "numeric", "character", "character","character", "character"))

	annotations$Spkr = annotations$InfIPA!=""
	annotations$Spkr[annotations$Spkr==TRUE] = "I"
	annotations$Spkr[annotations$Spkr=="FALSE"] = "A"
	annotations$Spkr[annotations$Spkr=="I"]
	annotations$SpkrCode 
	
	# change annotations$Spkr to have the vocal type
	for (crow in 1:nrow(annotations)) {
		if (annotations$Spkr[crow] == "A") {
			if (annotations$dir[crow] == "N") {
				annotations$SpkrCode[crow] = "N"
			} else if (annotations$dir[crow] == "T") {
				annotations$SpkrCode[crow] = "T"
			} else if (annotations$dir[crow] == "U") {
				annotations$SpkrCode[crow] = "U"	
			} 
		
		}
		else if (annotations$Spkr[crow] == "I") {
			 if (annotations$InfIPA[crow] == "x" | annotations$InfIPA[crow] == "fuss" | annotations$InfIPA[crow] == "yell" | annotations$InfIPA[crow] == "scream" | annotations$InfIPA[crow] == "squeal" | annotations$InfIPA[crow] == "grunt" | (grepl("/", annotations$InfIPA[crow]) && !grepl("[wrtypasdfghjklzcvbnm]", annotations$InfIPA[crow]))){
				annotations$SpkrCode[crow] = "X"
			} else if (annotations$InfIPA[crow] == "cry" | annotations$InfIPA[crow] == "laugh" ) {
				annotations$SpkrCode[crow] = "R" 	
			} else if (annotations$InfIPA[crow] == "sneeze" | annotations$InfIPA[crow] == "cough" | annotations$InfIPA[crow] == "burp" | annotations$InfIPA[crow] == "hiccup" | annotations$InfIPA[crow] == "breathing" | annotations$InfIPA[crow] == "breath" | annotations$InfIPA[crow] == "gasp" | annotations$InfIPA[crow] == "sigh" | annotations$InfIPA[crow] == "wheeze" | annotations$InfIPA[crow] == "wheezing" | annotations$InfIPA[crow] == "snort" | annotations$InfIPA[crow] == "suck") {
			annotations$SpkrCode[crow] = "NA"	
			} else { 
				annotations$SpkrCode[crow] = "C"
			}
		}
		
	}
	
	annotations=subset(annotations,SpkrCode!="NA")
	rownames(annotations)=1:nrow(annotations)	
	return(annotations)
}


				
			