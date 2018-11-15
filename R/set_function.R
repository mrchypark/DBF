#' set db function to dummy function in R
#'
#' set db function name to dummy object in R. now assign NULL
#' @param list list of function generated using [get_function].
#' @param ns_name namespace name to set. Defualt is  like postgres.
#' @importFrom namespace makeNamespace
#' @export
set_function <- function(list_of_function, ns_name) {
  if(missing(ns_name)){
    ns_name <- "pq"
  }
  if(class(conn) == "PqConnection"){
    ns <- namespace::makeNamespace(ns_name)
  }
  for (i in 1:length(list_of_function)) {
    assign(toupper(list_of_function[i]), NULL, ns)
  }
  base::namespaceExport(ns, ls(ns))
}
