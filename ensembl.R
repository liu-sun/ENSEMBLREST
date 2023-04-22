library(httr)
library(jsonlite)
variant_recoder <- function(id, ...) {
  response <- GET(paste0("https://rest.ensembl.org/variant_recoder/human/", id),
                  query = list(...), content_type_json(), accept_json())
  return(fromJSON(toJSON(content(response))))
}

variant_recoder <- function(id, ...) {
  response <- POST("https://rest.ensembl.org/variant_recoder/human", body = list(ids = id),
                   encode = "json", query = list(...), content_type_json(), accept_json())
  return(fromJSON(toJSON(content(response))))
}
