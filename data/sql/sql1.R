
library(RODBC)
library(odbc)
library(RPostgreSQL)
# library(psqlODBC)

# con <- dbConnect(odbc(),
#                  Driver = "PostgreSQL",
#                  Server = "172.17.0.2",
#                  Database = "cats",
#                  UID = "dev",
#                  PWD = rstudioapi::askForPassword("Database password"),
#                  Port = 5432)

tryCatch({
  pass <- Sys.getenv("PSQL_DEV_PASS")
  print(pass)
  drv <- dbDriver("PostgreSQL")
  print("Connecting to Database…")
  connec <- dbConnect(drv,
                      dbname = "cats",
                      host = "172.17.0.2",
                      port = 5432,
                      user = "dev",
                      password = "possum!")
  print("Database Connected!")

  # dbSendQuery(connec, "DROP TABLE IF EXISTS Employees")
  # dbSendQuery(connec, "CREATE TABLE Employees(Id INTEGER PRIMARY KEY, Name VARCHAR(20))")
  # dbSendQuery(connec, "INSERT INTO Employees VALUES(1,'Aakash')")
  # dbSendQuery(connec, "INSERT INTO Employees VALUES(2,'Diksha')")
  # dbSendQuery(connec, "INSERT INTO Employees VALUES(3,'Jaskaran')")
  # dbSendQuery(connec, "INSERT INTO Employees VALUES(4,'Arsalan')")
  # dbSendQuery(connec, "INSERT INTO Employees VALUES(5,'Argha')")
  # dbSendQuery(connec, "INSERT INTO Employees VALUES(6,'Anuj')")
  # dbSendQuery(connec, "INSERT INTO Employees VALUES(7,'Noor')")
  # dbSendQuery(connec, "INSERT INTO Employees VALUES(8,'Anirudh')")

  res <- dbSendQuery(conn = connec, "SELECT * FROM cats")
  # flds <- dbColumnInfo(res)
  # dbSetDataMappings(rs, flds)
  cats <- fetch(res, n = 3)

  # print(row.names(cats))
  # print(colnames(cats))
  # print(nrow(cats))

  cats[1, 1]


},
  error=function(cond) {
    print("Unable to connect to Database.")
    print(cond)
  })
