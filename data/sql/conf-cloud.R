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
  resp <- GET(url = wikiLink, authenticate(user = Sys.getenv("ANMA_MAIL"), password = Sys.getenv("ANMA_TOKEN")),
              add_headers("a" = "b"), query = list('expand' = 'homepage'))
  spaceJson <- content(resp, "text")
  spaces <- fromJSON(txt = spaceJson)
  # print(dogsDF$results)
  print(class(spaces$results$`_expandable`))

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