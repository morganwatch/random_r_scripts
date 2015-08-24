### PSQL work
library(devtools)

## Install nessesary packages
devtools::install_github("RcppCore/Rcpp")
devtools::install_github("rstats-db/DBI")
devtools::install_github("rstats-db/RPostgres")

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
res <- dbSendQuery(con, "SELECT s.full_name, s.employer
                   FROM DB.TABLE s
                   ORDER BY s.full_name;")

## Write Query to CSV
test <- dbFetch(res)
write.csv(test, "WHERE YOU WANT TO PUT IT.csv", row.names=FALSE)
