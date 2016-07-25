setwd("/Volumes/Research/WWTranscription/")
#setwd("/Users/awarlau/LENAInteraction/GinaWW/WWScripts")

source("spkrcode.R")
source("pauseoverlap.R")
source("sequenceevents.R")

# Set metadata for file names.
metadata = read.csv("/Volumes/Research/WWTranscription/direction_analysis.csv", header=T) # ASW: I believe the /Volumes/Research/WWTranscription/ can be deleted, and doing so will make it run more easily on other filesystems (e.g. mine when I am testing)

# Set how long should be counted as a pause
pausedur = 2

# For loop to do the recoding and event sequencing for all 5 minute segments.
# for loop is running to fiveminnum 61, so this still needs to be fixed 

for (fiveminnum in 1:60){
# for (fiveminnum in 1:nrow(metadata)){ # ASW: Gina, can this now be uncommented and the line above deleted (and the comment above that about running to 61 be deleted)? This is especially important if you have added new 5 minute segments to the analyses so that there are no longer exactly 60 rows.
	
	# Recode the child and adult vocalization transcriptions into single-character codes.
	annotations = spkrcode("/Volumes/Research/WWTranscription/WWtxtFiles/", as.character(metadata$FileName[fiveminnum])) # ASW: Put the /Volumes/Research/WWTranscription/WWtxtFiles in a variable that's set at the top of the program, and indicate that users will need to set this to the correct path for their filesystem.	
	
	# Turn the multi-speaker time series into a single event series, which requires dealing with pauses and overlaps.
	newannotations = pauseoverlap(annotations, pausedur)
	
	#new variables for dataframe # ASW: Gina, can you improve this comment to make it better describe what the following 3 variables do? E.g., "Prepare metadata variables to be included in data frame for analysis."
	InfantID = as.character(metadata$InfantID[fiveminnum])
	SegmentID = metadata$SegmentID[fiveminnum]
	FileName = as.character(metadata$FileName[fiveminnum])
	
	# Get the 2-event sequences for subsequent contingency analyses.
	sequencecodes = sequenceevents(newannotations, InfantID, SegmentID, FileName)
	
}

write.csv(sequencecodes, file = "/Volumes/Research/WWTranscription/BidirectionalContingencies/sequencecodes.csv") # ASW: It would be good to put the path in a variable that is set toward the top of this file and indicate that the user should set it to where they want their sequencecodes.csv to be written.

