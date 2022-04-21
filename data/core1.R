a <- 1
while (a < 11) {
  print(a)
  a <- a + 1
}

for (i in 1:20) {
  print(paste0("num is ", i))
}

# condition
ifelse(20 > 15, "true", "false")

# collection
col1 <- c(1, 2, 3, 4, 5)
col1 * 2          # vector based math
col2 <- c("a", "b", "c")
length(col1)

# table (data frame)
b <- c(1,2,3,4,5)
d <- data.frame(col1, b)

# func
getnum <- function (num) {
  return(num + 4)
}

substr("Hello", 2,3)