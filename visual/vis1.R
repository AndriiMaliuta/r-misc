library(ggplot2)

dt <- data.frame(1,2,3,4)
geom_bar(data = data, width = 300, orientation = "aa")

library(lubridate)
library(geosphere)
library(stringr)
# library(zipcode)

# ggplot(data=dt, aes(x = x, y = y))

choose.k <- data.frame(k = 1:5, tot = c(1,2,3,4,5))
ggplot(choose.k, aes(x = k, y = tot)) + geom_bar(stat = "identity", fill="#045a8d")