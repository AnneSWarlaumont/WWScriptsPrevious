# WWScripts
R Scripts for WWTranscription project

runanalyses.R: Run this to recode the transcriptions into categories for analysis, construct an event series based on the utterance time series (dealing with pauses and overlaps), and then create pairs of consecutive events.

spkrcode.R: Recodes more detailed transcriptions (exported from ELAN) into single-character codes particular to the analyses for this project. Transcription instructions are available here: https://drive.google.com/folderview?id=0B7TInaKaaLhcflBDeEMyc3Z4bklMdW1nNUJmQzVlVnl5LUxyaEVPZl8tSHMyY0gzWTI3Q2c&usp=sharing

pauseoverlap.R: Converts the ordered annotations to a sequence of non-overlapping events, with pause events inserted.

sequenceevents.R:
