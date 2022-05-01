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

  get_spaces <- function(sp_link) {
    resp <- GET(url = sp_link, authenticate(user = mail, password = pswd),
                add_headers("a" = "b"), query = list('expand' = 'homepage'))
    space_json <- content(resp, "text")  # get content body from response
    spaces <- fromJSON(txt = space_json)
    return(spaces)
  }

  get_space_pages <- function(space_key) {
    pages_url <- paste0(wiki_link, "/rest/api/content")
    resp <- GET(url = pages_url, authenticate(user = mail, password = pswd),
                query = list('spaceKey' = space_key)) #'expand' = 'body.view',
    if (resp$status_code == 200) {
      pages_json <- content(resp, "text")  # get content body from response
      pages <- fromJSON(txt = pages_json)
      return(pages)
    }
  }

  find_content <- function() {
    search_url <- paste0(wiki_link, "/rest/api/search")
    resp <- GET(url = search_url, authenticate(user = mail, password = pswd),
                query = list('cql' = 'type=page'))
    content_json <- content(resp, "text")  # get content body from response
    content <- fromJSON(txt = content_json)
    return(content)
  }

  spaces_resp <- get_spaces(sp_link = url_link)
  spaces <- spaces_resp$results
  # print(class(spaces))

  next_link <- spaces_resp$`_links`$`next`

  if (!is.na(next_link)) {
    print(paste0(">> Next link is ", next_link))
    next_spaces_resp <- get_spaces(paste0(wiki_link, next_link))
    # rbind(spaces, next_spaces_resp$results)
    # merge(spaces, next_spaces_resp)
  }

  # write_csv(x = keyName, file = "../../files/spaces.csv")
  # write_excel_csv(x = keyName, file = newFile, append = TRUE)
  file.create("spaces.csv", overwrite = TRUE)
  # write_lines(s, file.path(outfolder, "text-mining-with-r.md"))
  # newFile <- dir.create("spaces.csv")

  # spaces_new <- bind_rows(spaces$results %>% filter(key == 'REACT'))
  all_spaces <- dplyr::lst(spaces, next_spaces_resp$results)
  # all_spaces <- spaces %>% full_join(next_spaces_resp$results)
  # all_pages <- get_space_pages("REACT")
  # print(all_pages$results)

  for (key in all_spaces[[1]][,3]) {
    space_pages <- get_space_pages(key)$results
    if (!is.null(space_pages)) {
      print(space_pages[, 1])
    }
  }



  # visualize
  chart_1 <- ggplot(data = all_spaces[[1]], mapping = aes(x = type, y = key)) +
    geom_point(mapping = aes(x = id, y = key))

  chart_2 <- ggplot(data = all_spaces[[2]], mapping = aes(x = id, y = key)) +
    geom_col(mapping = aes(x = id), fill = "green")

  grid.arrange(chart_1, chart_2, ncol = 2)

}, error = function(err) {
  print(err)
}
)