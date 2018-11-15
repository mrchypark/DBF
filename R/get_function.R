#' get database function
#'
#' @param conn db connection object from DBI.
#' @importFrom DBI dbGetQuery
#' @export
get_function <- function(conn) {

  stopifnot(class(conn) == "PqConnection")

  if(class(conn) == "PqConnection"){
    get_func_query <- "select proname from pg_proc"
  }

  res <- DBI::dbGetQuery(conn, get_func_query)
  res <- unique(res$proname)
  return(res)
}
