pauseoverlap = function(annotations, pausedur) {
	
	# Initializations prior to upcoming for loop
	event1 = data.frame(start=annotations[1,]$start,
				end=annotations[1,]$end,
				SpkrCode=annotations[1,]$SpkrCode,
				stringsAsFactors=FALSE)
	
	# Write the first event to newannotations
	newannotations = data.frame(start=event1$start,
				end=event1$end,
				SpkrCode=event1$SpkrCode,
				stringsAsFactors=FALSE)
			
	# For loop to write events into newannotations
	for (crow in 2:nrow(annotations)) {
		
		# Set event2 to the next event in annotations
		event2 = data.frame(start=annotations[crow,]$start,
					end=annotations[crow,]$end,
					SpkrCode=annotations[crow,]$SpkrCode,
					stringsAsFactors=FALSE)
		
		# Find the time difference between the event just written and the next annotated event
		timediff = event2[1,]$start - event1[1,]$end
	
		# If the time difference is negative, there is overlap between event1 and event2 
		# In this case, the first part of event 1 should be written, then the 
		if (timediff < 0){
			if ((event1[1,]$end - event2[1,]$end) > pausedur){
				newannotations[nrow(newannotations),]$end = event2[1,]$end
				newannotations = rbind(newannotations,c(event2[1,]$start,
									event2[1,]$end,event2[1,]$SpkrCode))
				event3 = data.frame(start=event2[1,]$end + .001,
							end=event1[1,]$end,
							SpkrCode=event1[1,]$SpkrCode,
							stringsAsFactors=FALSE)
				event2 = event3
			}
		}
	
		# If the time differences is greater than the pause duration, insert as many pauses as needed
		# and update the value of event1
		if (timediff >= pausedur) {
			for (pausenum in 1:(timediff %/% pausedur)) {
				event1[1,]$start = event1[1,]$end + ((pausenum-1)*pausedur + .001)
				event1[1,]$end = event1[1,]$end + (pausenum*pausedur)
				event1[1,]$SpkrCode = "P"
				newannotations = 
					rbind(newannotations,c(event1[1,]$start,event1[1,]$end,event1[1,]$SpkrCode))
			}
		}
	
		# It is time to make event 1 equal to the next annotation and write it to newannotations
		event1 = event2
		newannotations = rbind(newannotations,c(event1[1,]$start,event1[1,]$end,event1[1,]$SpkrCode))			
	}

	return(newannotations)
	
}
