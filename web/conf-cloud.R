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

  wiki_link <- Sys.getenv("ANMA_WIKI")
  mail <- Sys.getenv("ANMA_MAIL")
  pswd <- Sys.getenv("ANMA_TOKEN")
  url_link <- paste0(wiki_link, "/rest/api/space")

  get_spaces <- function (sp_link) {
    resp <- GET(url = sp_link, authenticate(user = mail, password = pswd),
                add_headers("a" = "b"), query = list('expand' = 'homepage'))
    spaceJson <- content(resp, "text")  # get content body from response
    spaces <- fromJSON(txt = spaceJson)
    return(spaces)
  }

  spaces_resp <- get_spaces(sp_link = url_link)
  spaces <- spaces_resp$results
  # print(class(spaces))

  next_link <- spaces_resp$`_links`$`next`

  if (!is.na(next_link)) {
    print(paste0(">> Next link is ", next_link))
    next_spaces_resp <- get_spaces(paste0(wiki_link, next_link))
    # print(next_spaces_resp)
    # rbind(spaces, next_spaces_resp$results)
    # merge(spaces, next_spaces_resp)
  }

  # print(spaces)

  # write_csv(x = keyName, file = "../../files/spaces.csv")
  file.create("spaces.csv", overwrite = TRUE)
  # write_lines(s, file.path(outfolder, "text-mining-with-r.md"))
  # newFile <- dir.create("spaces.csv")
  # write_excel_csv(x = keyName, file = newFile, append = TRUE)
  # write_excel_csv(x = keyName, file = "files/spaces.csv", append = TRUE)

  # spacesNew <- bind_rows(spaces$results %>% filter(key == 'REACT'))
  # print(spacesNew)
  all_spaces <- dplyr::lst(spaces, next_spaces_resp$results)
  # all_spaces <- spaces %>% full_join(next_spaces_resp$results)
  print(all_spaces)


  # visualize
  ggplot(data = spaces, mapping = aes(x = id, y = key)) +
    geom_point(mapping = aes(x = id, y = key))

}, error = function (err) {
  print(err)
}
)