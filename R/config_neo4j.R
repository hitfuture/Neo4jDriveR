# init_neo4j driver
#'@title neo4j_init
#'@description neo4j_init() sets up the python driver
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

#'
#'@importFrom reticulate py_id
#'@export
init_neo4j <- function() {

 py_id(neo4jPy)
}

#'@title neo4j_python
#'@description return the neo4j python driver
#'
#'@export

neo4j_python <- function(){
        neo4jPy
}

#'@title pandas_python
#'@description return the pandas python driver
#'
#'@export
pandas_python <- function(){
        pd
}
