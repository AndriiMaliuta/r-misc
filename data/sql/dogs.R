library(RODBC)
library(odbc)
library(RPostgreSQL)

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

  dbListTables(conn = connec)
  res <- dbSendStatement(conn = connec, "SELECT * FROM dogs")
  dogs <- fetch(res = res, n = 5)
  print(dogs)




},
  error=function(cond) {
    print("Unable to connect to Database.")
    print(cond)
  })
