- Vectors
- Lists
- Matrices
- Arrays
- Factors
- Data Frames


### psql
https://hevodata.com/learn/rpostgresql/#step1

### flter
```r
bind_rows(filter(a < 3))
```

==, >, >= etc
&, |, !, xor()
is.na()
between(), near()

### files

```r
 write_csv(x = keyName, file = "../../files/spaces.csv")
 file.create("spaces.csv", overwrite = TRUE)
 write_lines(s, file.path(outfolder, "text-mining-with-r.md"))
 newFile <- dir.create("spaces.csv")
 write_excel_csv(x = keyName, file = newFile, append = TRUE)
 write_excel_csv(x = keyName, file = "spaces.csv", append = TRUE)
```

### Data Types of R – Objects

- Vectors
- Lists
- Matrices
- Arrays
- Factors
- Data Frames

