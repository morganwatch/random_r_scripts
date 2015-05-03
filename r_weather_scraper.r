## Get the forcast from forecast.io's API

library(httr)
library(rjson)
## May need to be updated, you can get a personal token online
weather <- GET("https://api.forecast.io/forecast/86174269ccede56ea618a8790675666/37.8267,-122.423")

## Turn our data into text format
weather_text <- content(weather, as "text")
or
weather_text = readLines(weather)

## Turn our text into json
weather_json <- fromJSON(weather_text)

str(weather_json)
str(weather_json,1)

## Focus on current weather
weather_json$currently

## Focus on the current temperature
weather_json$currently$temperature
## 52.62 - Burrrrr!!

