## This is purposely left simplistic. so I can show off without raising some alarms.

library(reshape2)
library(dplyr)

setwd("~/Documents/Memphis/code/")

data <- read.csv("report.csv", stringsAsFactors=FALSE, sep=",")

names(data)[4]<-paste("Week 1")
names(data)[5]<-paste("Week 2")
names(data)[6]<-paste("Week 3")
names(data)[7]<-paste("Week 4")
names(data)[8]<-paste("Week 5")
names(data)[9]<-paste("Week 6")
names(data)[10]<-paste("Week 7")

data$Average1 <- rowMeans(subset(data, select = c("Week 1", "Week 2")), na.rm = TRUE)
data$Average2 <- rowMeans(subset(data, select = c("Week 1", "Week 2", "Week 3")), na.rm = TRUE)
data$Average3 <- rowMeans(subset(data, select = c("Week 1", "Week 2", "Week 3", "Week 4")), na.rm = TRUE)
data$Average4 <- rowMeans(subset(data, select = c("Week 1", "Week 2", "Week 3", "Week 4", "Week 5")), na.rm = TRUE)
data$Average5 <- rowMeans(subset(data, select = c("Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6")), na.rm = TRUE)
data$Average6 <- rowMeans(subset(data, select = c("Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7")), na.rm = TRUE)

data$Grand_Total <- rowSums(subset(data, select = c(4,5,6,7,8,9,10)), na.rm = TRUE)
data
data2 <- data
colSums(subset(data,select))
df3 <- data[c(1,2,3,4,5,11,6,12,7,13,8,14,9,15,10,16,17)]
df3

## Need to add team totals, and grand total row to bottom. 

with(data2, sum("Week 1"["Team" <= "Carpenter"]))

####
d <- data.frame(Group.1=c(1,1,2,1,3,3,1,3),Group.2=c('Eggs'),x=1:8)
d
num <- 3 

innerFunc <- function(subDf){
  row <- head(subDf,1)
  row$x <- sum(head(subDf$x,num))
  return(row)
}

d2 <- do.call(rbind,by(data=d, INDICES=d$Group.1, FUN=innerFunc))
d2
with(d, table(Group.1, x))
library(dplyr)
summarize(d$Group.1)
dtab <- table(d$Group.1)
library(reshape2)
melt(dtab)

####

df3["Grand_Total" ,] <- rowSums(subset(df2, select = c("Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7")), na.rm = TRUE)

df2[,c(1,2,3,4,5,11,6,12,7,13,8,14,9,15,10,17,16)]

df2[,c(1,2,3,4,5,11,6,12,7,13,8,14,9,15,10,17,16)]
df2 <- data[c(1,2,3,4,5,11,6,12,7,13,8,14,9,15,10,17,16)]
df2["Grand_Total" ,] <- colSums(df2$`Week 1`)

subset(df2$`Week 1`, df2$team = "Fields")
  res <- sum(df2$`Week 1`, subset())
