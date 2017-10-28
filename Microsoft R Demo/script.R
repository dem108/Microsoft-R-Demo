usa_airports <- read.csv("https://raw.githubusercontent.com/jflam/VSBlogPost/master/usa_airports.dat", stringsAsFactors = TRUE)

head(usa_airports)

library(DT)
datatable(usa_airports[, c("name", "city", "country", "IATA_FAA", "lat", "lon", "altitude")])

library(dplyr)
new_york_airports <- subset(usa_airports, city == "New York")
datatable(new_york_airports[, c("name", "city", "country", "IATA_FAA", "lat", "lon", "altitude")])

low_nyc <-
  usa_airports %>%
  filter(city == "New York" & altitude < 25) %>%
  arrange(altitude) %>%
  select(name, altitude, lat, lon)
datatable(low_nyc)


library(leaflet)
map <-
  new_york_airports %>%
  leaflet() %>%
  addTiles() %>%
  addCircles( ~ lon, ~ lat, popup = ~name, radius = 200, color = "blue", opacity = 0.8)
map
