#' @details This function requires having a character vector with one valid Report Suite specified.
#'
#' @description Get a data frame of Data Warehouse elements for the specified report suite. 
#' 
#' @title Get Elements Defined within Data Warehouse
#' 
#' @param reportsuite.id Report suite id
#'
#' @importFrom jsonlite toJSON unbox
#' @importFrom plyr rbind.fill
#' @importFrom RSiteCatalyst ApiRequest
#'
#' @return Data frame
#'
#' @export
#'
#' @examples
#' \dontrun{
#' elements <- GetElements("your_report_suite")
#' 
#' }

GetElements <- function(reportsuite.id) {
  
  request.body <- list()
  request.body$reportSuiteID <- unbox(reportsuite.id)
  request.body$reportType <- unbox("warehouse")
  
  valid.element <- ApiRequest(body=toJSON(request.body),func.name="Report.GetElements")

  return(valid.element)
  
}