#' @details Based on testing, it appears that the Adobe DataWarehouse API v1.3 might not be accurate with respect to this function. 
#' Testing has shown a value of 'FALSE' while still being able to access the API. Users are encouraged to try GetDataWarehouseDisplay() from the RSiteCatalyst package if this function returns 'FALSE'.
#'
#' @description Determine whether data warehouse is enabled for a user account/report suite combination. 
#' 
#' @title Determine Whether DataWarehouse Is Enabled For a User Account/Report Suite
#' 
#' @param reportsuite.ids Report suite id
#'
#' @importFrom jsonlite toJSON
#' @importFrom RSiteCatalyst ApiRequest
#' 
#'
#' @return Boolean value
#'
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' dw_enabled <- IsEnabled("reportsuite")
#' 
#' 
#' }

IsEnabled <- function(reportsuite.ids) {
  
  request.body <- c()
  request.body$rsid <- reportsuite.ids
  
  response <- ApiRequest(body=toJSON(request.body),func.name="DataWarehouse.IsEnabled")
  
  return(response)
  
}