library(httr)
library(jsonlite)

variant_recoder <- function(id,species="human", content_type="application/json", ...) {
  response <- GET("https://rest.ensembl.org", path=paste("variant_recoder", species, id, sep = "/"),
                  query = list(...), content_type(content_type))
  return(fromJSON(toJSON(content(response))))
}
vr<-variant_recoder("NP_001361433.1:p.Asp512Asn")
# variant_recoder <- function(id, ...) {
#   response <- POST("https://rest.ensembl.org/variant_recoder/human", body = list(ids = id),
#                    encode = "json", query = list(...), content_type_json(), accept_json())
#   return(fromJSON(toJSON(content(response))))
# }
