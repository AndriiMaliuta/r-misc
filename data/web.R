library(rvest)
library(dplyr)
library(httr)

# url <- "https://en.wikipedia.org/wiki/Example.com"
# ex.ref <- read_html(url)

res <- function () {
  r <- GET("https://en.wikipedia.org/wiki/Example.com")
  return(r)
}

r <- GET("https://en.wikipedia.org/wiki/Example.com", accept_json())
# status_code(r)
# content(r)
# print(class(r))
# body <- r[2]
# split()
# parse_json(body)
htm <- read_html("https://en.wikipedia.org/wiki/Example.com")
# html_attr(htm, "href")
elmnts <- html_elements(htm, "div")
html_text(elmnts[[4]])
elmnts[[29]]

ds <- data.frame(as.list(elmnts))