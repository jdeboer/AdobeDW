#' @details This function requires having a character vector with one valid Report Suite specified.
#'
#' @description Get a data frame of Data Warehouse metrics for the specified report suite. 
#' 
#' @title Get Metrics Defined within Data Warehouse
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
#' metrics <- GetMetrics("your_report_suite")
#' 
#' }

GetMetrics <- function(reportsuite.id) {
  
  request.body <- list()
  request.body$reportSuiteID <- unbox(reportsuite.id)
  request.body$reportType <- unbox("warehouse")
  
  valid.metrics <- ApiRequest(body=toJSON(request.body),func.name="Report.GetMetrics")
  
  return(valid.metrics)
  
}