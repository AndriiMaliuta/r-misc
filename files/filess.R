library(readxl)

# readLines(con = stdin())
# emails <- read.csv("./email.csv")
emails <- read.csv("/home/andrii/R/proj1-data/files/email.csv", sep = ";")

print(emails)
print(emails[emails$Identifier < 5000])
print(emails$Login.email)

