

https://hevodata.com/learn/rpostgresql/#step1

|| RPostgreSQL || Method	|| RPostgreSQL || Method Description ||
| dbDriver(drv, …)	| Instantiates the driver object.
dbConnect(drv,…) 	Creates and establishes a connection to the database that the driver drv implements. User, password, dbname, host, and other information should be supplied in the connection string.
dbGetInfo(dbObject, …)	Returns dbObject details such ad driver, connection, or resultSet.
dbSendQuery(con, statement, …) 	Queries one statement to the database.
dbGetQuery(con,statement, …) 	In one operation, it submits, executes, and extracts output.
fetch(rs,n, …)	Retrieves next n entries from the resultSet.
dbRemoveTable(con, TableName, …) 	Removes the table specified and returns a value if the operation succeeded or not.
dbReadTable(conn, name, …)	Imports the remotely stored data in the table name on connection conn.
dbWriteTable(conn, name, value, …) 	Writes the contents of the dataframe value into the table name specified.
dbDisconnect(con, …)	Terminates the connection.
dbUnloadDriver(drv,…)	Releases all of the driver’s resources.