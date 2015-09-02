
## How to pull all your geo-codes out of Nationbuilder. 
## First download a snapshot of your database using this guide: http://nationbuilder.com/ht_open_your_snapshot
## When you've finished, query the database in R by following the instructions below. 

## load packages
library(DBI)
library(RPostgres)

## Connect to db
con <- dbConnect(RPostgres::Postgres(),dbname = 'DBNAME', 
                 host = 'HOST', # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'
                 port = 5432, # or any other port specified by your DBA
                 user = 'USER',
                 password = 'PASSWORD')

## List Tables, and clear the stuff out of res
dbListTables(con)
dbClearResult(res)

## Upload CSV
dbRemoveTable(con, "test")
test3 <- read.csv(file = "LOCATION OF FILE", sep = ",")
dbWriteTable(con, "test", test3)

## Query DB
res <- dbSendQuery(con, "
SELECT s.id, s.full_name, s.employer, a.lat, a.lng
FROM DB.signups s
JOIN DB.addresses a ON a.id = s.registered_address_id
ORDER BY s.employer;;")

## Write Query to CSV
test <- dbFetch(res)
write.csv(test, "WHERE YOU WANT TO PUT IT.csv", row.names=FALSE)
