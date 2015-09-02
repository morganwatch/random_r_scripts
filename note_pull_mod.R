
## This isn't big as far as scripts go, but I use this often just to clear up the mess without having to open Nationbuilder.

## Import
export <- read.csv(file = "ORIGINAL FILE LOCATION", sep = ",")[ ,c('nationbuilder_id','note')]
# Remove people with no notes in their file. 
df <- data.frame(export)
df2 <- df[!(is.na(df$note) | df$note==""), ]
# write to downloaded file. 
write.csv(df2, "ORIGINAL FILE LOCATION", row.names=FALSE)

