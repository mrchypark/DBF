# DBF

The goal of DBF is to provide dummy DB syntax in namespace to use functions with dplyr

## Installation

You can install the developed version of DBF from [github](https://github.com/mrchypark/DBF) with:

``` r
# if you don't instatll remotes package, uncomment & run below line.
# install.packages("remotes")
remotes::install_github("mrchypark/DBF")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(DBI)
library(DBF)

conn <- dbConnect(
  RPostgres::Postgres(),
  host = HOST, # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'
  port = 5432, # or any other port specified by your DBA
  user = 'postgres',
  password = 'password'
)

list_of_syntax <- get_function(conn)
set_function(list_of_syntax)
```
![](https://user-images.githubusercontent.com/6179259/48572925-29a1f180-e94e-11e8-94a4-259a713a6015.png)

## Usage

``` r
library(dplyr)
library(DBI)
library(DBF)

conn <- dbConnect(
  RPostgres::Postgres(),
  host = HOST, # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'
  port = 5432, # or any other port specified by your DBA
  user = 'postgres',
  password = 'password'
)

copy_to(conn, test)

list_of_syntax <- get_function(conn)
set_function(list_of_syntax)

tbl(conn, "test") %>% 
  mutate(date = DATE_TRUCN("day", date))

```

## Special Thanks

[Tyler Morgan-Wall](https://twitter.com/tylermorganwall) @tylermorganwall [history](https://twitter.com/mrchypark_/status/1063113560086130688)
