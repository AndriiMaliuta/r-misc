setwd("/home/andrii/R/proj1-data")

a <- 1
b <- 2
col1 <- c(1,2,3,4)
f <- data.frame('1', 'b', 'c')
bool <- TRUE
a + 20

v <- col1 > 2
col1[v]

### CSV
csvData <- read.csv(file = "../files/libraries_by_python_version.csv")

### XLSX
# library(xlsx)

### web
library(rvest)
library(dplyr)
url <- "https://www.hockey-reference.com/teams/index.html"
nhl.ref <- read_html(url)
  nhl.ds <- nhl.ref %>%
  html_nodes(xpath='//*[@id="active_franchises"]') %>%
  html_table(fill = TRUE)
nhl.teams <- nhl.ds[[1]][1:5]

wr_data <- c(1,2,3,4)
write.csv(wr_data, file = '../files/wr_data.csv')
write(file = "", da)