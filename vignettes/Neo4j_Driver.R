## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ----eval=FALSE, error=FALSE,message=TRUE, warning=FALSE, include=TRUE----
#  library(Neo4jDriveR)
#  uri = "bolt://172.20.0.1:7687"
#  driver = GraphDatabase$driver(uri, auth=c("neo4j", "neo4j_is_nice"))
#  print_friends_of <- function(tx, name){
#    records <- tx$run("MATCH (a:Person)-[:KNOWS]->(f)
#                      WHERE a.name = {name}
#                      RETURN f.name", name=name)
#  
#  }
#  
#  session <- driver.session()
#  session$read_transaction(print_friends_of, "Alice")

## ----eval=FALSE, error=FALSE,message=TRUE, warning=FALSE, include=TRUE----
#  library(Neo4jDriveR)
#  
#  uri = "bolt://172.20.0.1:7687"
#  driver <- graph_driver(uri, user_id = "neo4j", password = "neo4j_is_nice")
#  print_friends_of <- function(tx, name){
#    records <- graph_run(tx, "MATCH (a:Person)-[:KNOWS]->(f)
#                      WHERE a.name = {name}
#                      RETURN f.name", name=name)
#    records
#  
#  }
#  
#  session <- graph_session(driver)
#  results <- graph_read_transaction(session, print_friends_of, "Alice")
#  print(results)
#  

## ----eval=FALSE, include=TRUE--------------------------------------------
#  install.packages("Neo4jDriveR")

