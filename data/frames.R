# Data Frames

a <- 1:25
b <- 100:124
c <- rep("abc", 25)
f1 <- data.frame(col1 = a,b,c)

library(reshape2)
hist(f1$b)

print(dim(f1))
print(f1[f1$.b > 2, 3:1])

