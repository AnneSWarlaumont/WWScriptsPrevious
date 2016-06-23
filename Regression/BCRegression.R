setwd("/Users/ginapretzer/Desktop/WWScripts/Regression/")

eventcodes <- read.csv("eventcodes.csv", header = TRUE, sep = "")

# Regression Models with IDS or ODS as Event 2
IDSfollow <- lm(Event2T ~ (1|InfantID) + Event1C + Event1X + Event1R)
summary(IDSfollow)
ODSfollow <- lm(Event2N ~ (1|InfantID) + Event1C + Event1X + Event1R)
summary(ODSfollow)

# Regression Models with IDS or ODS as Event 1
IDSled <- lm(Event1T ~ (1|InfantID) + Event2C + Event2X + Event2R)
summary(IDSled)
ODSled <- lm(Event1N ~ (1|InfantID) + Event2C + Event2X + Event2R)
summary(ODSled)

# Does child voc in general lead to adult voc?
adultvoc <- which(eventcodes$code2 == "T" | eventcodes$code2 == "N")
infantvoc <- which(eventcodes$code1 == "C" | eventcodes$code1 == "X" | eventcodes$code1 == "R")

allvoc <- lm(adultvoc ~ infantvoc)
summary (allvoc)




