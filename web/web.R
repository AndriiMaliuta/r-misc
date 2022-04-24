library(rvest)
library(dplyr)
library(httr)
library(jsonlite)
library(rvest)

# url <- "https://en.wikipedia.org/wiki/Example.com"
# ex.ref <- read_html(url)

res <- function () {
  r <- GET("https://en.wikipedia.org/wiki/Example.com")
  return(r)
}

rsp <- GET("https://en.wikipedia.org/wiki/Example.com", accept_json())
# charResp <- rawToChar(rsp$content)

# status_code(r)
# content(r)
# body <- r[2]
# parse_json(body)
htm <- read_html("https://en.wikipedia.org/wiki/Example.com")
# html_attr(htm, "href")
elmnts <- html_elements(htm, "div")
# html_text(elmnts[[4]])
# elmnts[[29]]

# ds <- data.frame(as.list(elmnts))

jsonData <- GET("https://restcountries.com/v3.1/all", accept_json())
# res <- GET("http://api.open-notify.org/iss-pass.json",
#     query = list(lat = 40.7, lon = -74))

countries <- fromJSON(rawToChar(jsonData$content))
# print(names(countries))
# print(dim(countries))

# print(countries[[1]][1:10])
print("=============")
print(countries[c(1,2,3), ])
# print(countries[1:3, ])

# countries[,2] == countries$b == countries[[2]]
