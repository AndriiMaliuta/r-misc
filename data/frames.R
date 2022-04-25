library(reshape2)

####### Vectors

vector1 <- c(1,2,3,4,5,65,6)
# print(vector1)

fruits <- c('apple','orange',"banana")
# print(class(fruits))

####### Lists

list1 <- list(1,2,3,4,5)
# print(list1)

istX <- list(51,"hello",tan,list(8L,"a"))

######## Matrices

mtx1 <- matrix(c(1,2,3,4), nrow = 3, ncol = 4)
# print(mtx1)

mtx2 <- matrix(c(1,2,3,4,5,6,7,8),2,4,TRUE)
# print(mtx2)

###### Arrays
#array(data = NA, dim = length(data), dimnames = NULL)
#as.array(x, ...)
#s.array(x)

arr1 <- array(data = list1, dim = length(list1))
print(arr1)

arr2 <- array(c(1,2,3,4,5,6,7,8,9,10,11,12),c(2,3,2))


####### Factors
# factor(x = character(), levels, labels = levels,
#        exclude = NA, ordered = is.ordered(x), nmax = NA)

fac1 <- factor(x = vector1)
factorX <- factor(c(1,4,7,2,6,7,1,6,4))


####### Data Frames
# variable <- data.frame(listA, listB, listC, .., listN)

a <- c(1:6)
b <- c("a", "b", "c", "d", "e", "f")
dt <- data.frame(col1 = a, col2 = b)

dataX <- data.frame(values = c(21,42,113), RGB = c('red','blue','green'))
print(dataX)

# hist(f1$b)

# print(f1[f1$.b > 2, 3:1])
# print(f1[20,2])
# print(dt[1:2,2])

frame1 <- data.frame(col1 = c(1,2,3,4,5), col2 = c('1','b','c','d'), empty.dump())


