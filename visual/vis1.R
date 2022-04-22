library(ggplot2)
library(lubridate)
library(geosphere)
library(stringr)

dt <- data.frame(1,2,3,4)
geom_bar(data = data, width = 300, orientation = "aa")
# ggplot(data=dt, aes(x = x, y = y))

choose.k <- data.frame(k = 1:5, tot = c(1,2,3,4,5))
!is.na(choose.k)

ggplot(choose.k, aes(x = k, y = tot)) + geom_bar(stat = "identity9", fill="#045a9d")
