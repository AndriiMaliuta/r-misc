setwd("/home/andrii/prog/R/proj1-data")
library(rvest)
library(dplyr)
library(httr)
library(jsonlite)
library(rvest)
library(ggplot2)
library(gridExtra)
library(grid)

print(Sys.time())

draw_chart <- function (data) {
  chart1 <- ggplot(data = data, mapping = aes(x = data$"Підписників", y = data$"Переглядів")) +
    geom_point(mapping = aes(x = data$"Підписників", y = data$"Переглядів"))

  chart_2 <- ggplot(data = data, mapping = aes(x = data$"Підписників", y = data$"Переглядів")) +
    geom_col(data = data, mapping = aes(x = data$"Підписників", y = data$"Переглядів"))

  grid.arrange(chart1, chart_2)
}

get_channels <- function (url) {
  dt <- GET(url)
  ht_page <- read_html(dt)

  # elems <- html_elements(ht_page, "table.rating-table a.")
  chan_table_ht <- html_elements(ht_page, "table.rating-table")
  elems <- html_elements(ht_page, "table.rating-table tr")
  elems2 <- ht_page %>% html_elements("tr")

  # print(html_children(elems))
  # for (el in elems2[1:2]) {
  #   a_link <- html_element("a") %>% html_text2()
  #   print(a_link)
  # }

  # chan_table2 %>% html_element(ht_page,"table.rating-table") %>% html_table()
  chan_table <- html_table(chan_table_ht)
  return(chan_table)
}

initial_url <- "https://manifest.in.ua/rt"
chan_table <- get_channels(initial_url)
chan_next_url <- "https://manifest.in.ua/rt/page/2"

# append(chan_table, get_channels(chan_next_url), after = length(chan_table))
rbind(chan_table, get_channels(chan_next_url))
print(chan_table)
draw_chart(chan_table[[1]])
