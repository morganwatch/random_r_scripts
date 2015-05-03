## Files from http://www.cms.gov/OpenPayments/Explore-the-Data/Dataset-Downloads.html
## Data 12/19/14

setwd("~/Downloads/12192014_ALLDTL/")

data <- read.csv("OPPR_ALL_DTL_GNRL_12192014.csv", header=TRUE, sep=",")
data2 <- read.csv("OPPR_ALL_DTL_RSRCH_12192014.csv", header=TRUE, sep=",")
data3 <- read.csv("OPPR_ALL_DTL_OWNRSHP_12192014.csv", header=TRUE, sep=",")
data4 <- read.csv("OPPR_SPLMTL_PH_PRFL_12192014.csv", header=TRUE, sep=",")


## data 4 has the physician's id's, names, states.
## we want how much they made and which state.
## so we are going to link the tables through their 
## ids to figure out which state has the highest avg
## doctor payments, then put it on a map.

head(data)

colnames(data)
colnames(data4)
## physician_profile_id works for both of them.
## data has total_amount_of_payment_usdollars

## could recipient_state work the same as physician_profile_state? 




## Find state names 
## Find county of state names

library(plyr)
library(dplyr)
library(ggplot2)
library(sqldr)


## How to count variables in a column: 

table <- table(data$Recipient_State)
table2 <- melt(table)
table3 <- rename_(table2, .dots = setNames("Var1", "states"))
table4 <- rename_(table3, .dots = setNames("value", "count"))

## What's the average payments per doctor per state?
##  Same action, in SQL data_test <- sqldf("SELECT Recipient_State AS state, COUNT(*) AS count, AVG(Total_Amount)")

data_test <- data %>%
    group_by(Recipient_State) %>%
    select(Recipient_State, Total_Amount_of_Payment_USDollars) %>%
        summarize(totals = mean(Total_Amount_of_Payment_USDollars, na.rm = TRUE),
                  count = sum(length(Recipient_State)))

## Turn it into a bar chart
x <- ggplot(data_test, aes(x=Recipient_State, y=totals)) + geom_bar(stat="identity")
x

## ON is too big, what's ON? Ontario? remove it.
data_test2 <- data_test[!data_test$Recipient_State == "ON", ]

## Better, what's with Vermont? 


## What profession pays the most? TBH
unique(data$Physician_Specialty)

data_test2 <- data %>%
    group_by(Physician_Specialty) %>%
        select(Physician_Specialty, Total_Amount_of_Payment_USDollars) %>%
            sort(Physician_Specialty, max(Total_Amount_of_Payment_USDollars))



## Map it out using ggplot2
