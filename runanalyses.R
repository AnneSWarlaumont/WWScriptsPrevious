setwd("/Volumes/Research/WWTranscription/")
#setwd("/Users/awarlau/LENAInteraction/GinaWW")

source("spkrcode.R")
source("pauseoverlap.R")
source("sequenceevents.R")

#set metadata for file names
metadata = read.csv("/Volumes/Research/WWTranscription/direction_analysis.csv", header=T)

#for loop to run all segments
# for loop is running to fiveminnum 61, so this still needs to be fixed 

for (fiveminnum in 1:60){
# for (fiveminnum in 1:nrow(metadata)){
	annotations = spkrcode("/Volumes/Research/WWTranscription/WWtxtFiles/", as.character(metadata$FileName[fiveminnum]))
	# annotations = spkrcode("/Users/awarlau/LENAInteraction/GinaWW", 'WW08_segment3_full.txt')
	
	# Set how long should be counted as a pause
	pausedur = 2
	newannotations = pauseoverlap(annotations, pausedur)
	
	#new variables for dataframe
	InfantID = as.character(metadata$InfantID[fiveminnum])
	SegmentID = metadata$SegmentID[fiveminnum]
	FileName = as.character(metadata$FileName[fiveminnum])

	sequencecodes = sequenceevents(newannotations, InfantID, SegmentID, FileName)
}

write.csv(sequencecodes, file = "/Volumes/Research/WWTranscription/BidirectionalContingencies/sequencecodes.csv")

