library(RODBC)
library(odbc)
library(RPostgreSQL)
library(ggplot2)
library(lubridate)
library(geosphere)
library(httr)
library(jsonlite)

tryCatch({
  wikiLink <- Sys.getenv("ANMA_WIKI")
  mail <- Sys.getenv("ANMA_MAIL")
  pswd <- Sys.getenv("ANMA_TOKEN")
  urlLink <- paste0(wikiLink, "/rest/api/space")
  resp <- GET(url = urlLink, authenticate(user = mail, password = pswd),
              add_headers("a" = "b"), query = list('expand' = 'homepage'))
  spaceJson <- content(resp, "text")
  spaces <- fromJSON(txt = spaceJson)
  # print(dimnames(spaces$results[1,]))
  print(spaces$results[1:2,])
  # write.csv(x = spaces$results[1:2,], file = "./spaces.csv")

  # visualize
  vis1 <- function () {
    ggplot(data = spaces$results, mapping = aes(x = id, y = key)) +
      geom_point(mapping = aes(x = id, y = key))
    return()
  }

  ggplot(data = spaces$results, mapping = aes(x = id, y = key)) +
    geom_point(mapping = aes(x = id, y = key))



}, error = function (err) {
  print(err)
}
)