setwd("/home/andrii/prog/R/proj1-data")
library(RODBC)
library(odbc)
library(RPostgreSQL)
library(ggplot2)
library(lubridate)
library(geosphere)
library(httr)
library(jsonlite)
library(readr)
library(dplyr)

tryCatch({
  print(Sys.time())
  wikiLink <- Sys.getenv("ANMA_WIKI")
  mail <- Sys.getenv("ANMA_MAIL")
  pswd <- Sys.getenv("ANMA_TOKEN")
  urlLink <- paste0(wikiLink, "/rest/api/space")
  resp <- GET(url = urlLink, authenticate(user = mail, password = pswd),
              add_headers("a" = "b"), query = list('expand' = 'homepage'))
  spaceJson <- content(resp, "text")  # get content body from response
  spaces <- fromJSON(txt = spaceJson)
  # print(dimnames(spaces$results[1,]))
  keyName <- spaces$results[, 2:3]
  # print(keyName)

  # write_csv(x = keyName, file = "../../files/spaces.csv")
  file.create("spaces.csv", overwrite = TRUE)
  # write_lines(s, file.path(outfolder, "text-mining-with-r.md"))
  # newFile <- dir.create("spaces.csv")
  # write_excel_csv(x = keyName, file = newFile, append = TRUE)
  write_excel_csv(x = keyName, file = "spaces.csv", append = TRUE)

  spacesNew <- bind_rows(spaces$results %>% filter(key == 'REACT'))
  print(spacesNew)




  # visualize

  ggplot(data = spaces$results, mapping = aes(x = id, y = key)) +
    geom_point(mapping = aes(x = id, y = key))

}, error = function (err) {
  print(err)
}
)