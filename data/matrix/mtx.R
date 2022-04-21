mtx <- matrix(ncol = 20, nrow = 20)
for (r in 1:dim(mtx)[1]) {
  for(c in dim(mtx[2])) {
    mtx[r,c] <- r * c

  }

}