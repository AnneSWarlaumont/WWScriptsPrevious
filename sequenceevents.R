sequenceevents = function(events, InfantID, SegmentID, FileName) {
	
	#set first sequence (similar to event 1 in pauseoverlap)
	#write the remaining sequences	

	for (crow in 1:(nrow(events)-1)) {
		if (fiveminnum == 1 & crow == 1 ) {
			sequencecodes = data.frame(InfantID=InfantID,
								SegmentID=SegmentID,
								FileName=FileName,
								code1=events[1,]$SpkrCode,
								code2=events[2,]$SpkrCode, 
								seqcode=paste(events[1,]$SpkrCode,events[2,]$SpkrCode, sep = "", collapse = NULL),
								stringsAsFactors=FALSE)
		} else {
			sequencecodes = rbind(sequencecodes,c(InfantID, SegmentID, FileName, events[crow,]$SpkrCode, events[crow+1,]$SpkrCode, paste(events[crow,]$SpkrCode,events[crow+1,]$SpkrCode, sep = "", collapse = NULL)))	
		}
	
}	
	return(sequencecodes)
		
}
