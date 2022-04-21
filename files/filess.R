library(readxl)
library(jsonlite)
library(devtools)

# readLines(con = stdin())
# emails <- read.csv("./email.csv")
pt <- "/home/andrii/prog/R/proj1-data/files/email.csv"
emails <- read.csv(file = pt, sep = ";")

# install.packages("devtools")

print(emails)
print(emails[emails$Identifier < 5000])
print(emails$Login.email)

