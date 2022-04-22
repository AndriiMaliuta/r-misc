# Data Frames
library(reshape2)

a <- c(1:6)
b <- c("a", "b", "c", "d", "e", "f")
dt <- data.frame(col1 = a, col2 = b)

# hist(f1$b)

# print(f1[f1$.b > 2, 3:1])
# print(f1[20,2])
print(dt[1:2,2])