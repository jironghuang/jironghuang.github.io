#Note: This script is for connection purposes

#' Database connection
#'
#' Connect to sqlite
#' @param sp_db_path path_name
#' @keywords database
vf_connect_db = function(sp_db_path){
  
  #No space between dbname
  con <- dbConnect(SQLite(), dbname=sp_db_path)  
  # con <- dbConnect(SQLite(), dbname="Data/CV_database.db")  
  # dbListTables(con)
  # dbGetQuery(con,'select * from "CV_data"')   #some error if dont use ""
  
  #Assign this connection globally
  assign("con", con, envir = .GlobalEnv)
  return(con)
}
