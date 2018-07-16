# Neo4j main class that gives access to Neo4j
#'@title GraphDatabase
#'@description GraphDatabase is a class that enables
#  access to the Neo4j database.
#

#'@import R6
#'@export
GraphDatabase <- R6Class(classname = "GraphDatabase",
                         public = list(
                                 initialize = function(){

                                 },
                                 driver = function(uri, user_id, password)   {
                                         Driver$new(uri, user_id, password)


                                 }

                         ))
#'@title Driver
#'@description Driver is the class that provides access to the bolt protocol

#'@import R6
#'@export
Driver <- R6Class(
        classname = "Driver",
        public =   list(

                uri_d = NULL,
                user_id_d = NULL,
                password_d = NULL,
                py_driver = NULL,
                initialize = function(uri , user_id , password) {
                        self$uri<- uri
                        self$user_id <- user_id
                        self$password <- password



                }


        ),

        active = list(
                uri = function(value) {
                        if (missing(value))
                                return(self$uri_d)
                        else
                                self$uri_d <- value
                },
                user_id = function(value) {
                        if (missing(value))
                                return(self$user_id_d)
                        else
                                self$user_id_d <- value
                },
                password = function(value) {
                        if (missing(value))
                                return(self$password_d)
                        else
                                self$password_d <- value
                }

        ),
        private = list(
                password_prv = NULL,
                uri__prv = NULL,
                user_id_prv = NULL
        )



)
