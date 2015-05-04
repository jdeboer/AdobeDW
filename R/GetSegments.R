#' @details This function requires having a character vector with one or more valid Report Suites specified.
#'
#' @description Get a data frame of segments for the specified report suites. 
#' Useful to find segment IDs for use in reporting helper functions or JSON report definitions.
#' 
#' @title Get Segments Defined within Data Warehouse
#' 
#' @param reportsuite.ids Report suite id
#'
#' @importFrom jsonlite toJSON
#' @importFrom plyr rbind.fill
#'
#' @return Data frame
#'
#' @export
#'
#' @examples
#' \dontrun{
#' segments <- GetSegments("your_report_suite")
#' 
#' }

GetSegments <- function(reportsuite.ids) {
  
  request.body <- c()
  request.body$rsid <- reportsuite.ids
  
  valid.segments <- ApiRequest(body=toJSON(request.body),func.name="DataWarehouse.GetSegments")
  
  #if(length(valid.segments$segments[[1]]) == 0) {
  #  return(print("No Segments Defined For This Report Suite"))
  #}
  
  #segments.formatted <- data.frame()
  #for (i in 1:length(valid.segments$rsid) ) {
  #  if(nrow(valid.segments$segments[[i]])>0) {
  #    valid.segments$segments[[i]]$report_suite <- valid.segments$rsid[[i]]
  #    if(nrow(segments.formatted)==0) {
  #      segments.formatted <- valid.segments$segments[[i]]
  #    } else {
  #      segments.formatted <- rbind.fill(segments.formatted,valid.segments$segments[[i]])
  #    }
  #  }
  #}
  
  #return(segments.formatted)
  
  return(valid.segments)
  
}