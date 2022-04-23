library(RODBC)
library(odbc)
library(RPostgreSQL)
library(ggplot2)
library(lubridate)
library(geosphere)
library(httr)
library(jsonlite)

tryCatch({
  drv <- dbDriver("PostgreSQL")
  print("Connecting to Database…")
  connec <- dbConnect(drv,
                      dbname = "dogs",
                      host = "172.17.0.2",
                      port = 5432,
                      user = "dev",
                      password = "possum!")
  print("Database Connected!")

  # dbListTables(conn = connec)
 function () {
   res <- dbSendStatement(conn = connec, "SELECT * FROM dogs")
   dogs <- fetch(res = res, n = 5)
   print(dogs[,3])

   ggplot(data = dogs, mapping = aes(x = id, y = age, colour = age, size = age)) +
      geom_point() + geom_point(data = dogs, aes(y = age), colour = 'red', size = 3)
 }


}, error=function(cond) {
    print("Unable to connect to Database.")
    print(cond)
})


