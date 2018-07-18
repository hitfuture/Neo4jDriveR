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

                                         Driver$new( uri, user_id, password)


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
                initialize = function(  uri , user_id , password) {
                        self$uri_d<- uri
                        self$user_id_d <- user_id

                        token <- neo4jPy$basic_auth(user_id,password)
                        self$py_driver <- neo4jPy$GraphDatabase$driver(uri, auth=token)





                },
                drvr = function(){
                        self$py_driver
                },
                session = function(){
                        Session$new(self$drvr())



                }


        ),

        active = list(),
        private = list()



)


#'@title Session
#'@description Session is the class that allows transactions in the Neo4jDB

#'@import R6
#'@export
Session <- R6Class(
        classname = "Session",
        public =   list(
                py_session = NULL,
                initialize = function(  driver) {

                        self$py_session <- driver$session()

                },
                begin_transaction = function(){
                        Transaction$new(self$py_session)
                }


        ),

        active = list(),
        private = list()



)

#'@title Transaction
#'@description Transaction is the class that allows execution in the Neo4jDB

#'@import R6
#'@export
Transaction <- R6Class(
        classname = "Transaction",
        public =   list(
                py_transaction = NULL,
                initialize = function(  session) {

                         self$py_transaction <- session$begin_transaction()

                },
                run = function(statement,...){
                        StatementResult$new(self$py_transaction$run(statement,...))

                }

        ),

        active = list(),
        private = list()



)

#'@title StatementResult
#'@description StatementResult is the class that is the return from execution Neo4jDB

#'@import R6
#'@export
StatementResult <- R6Class(    classname = "StatementResult",
                           public =   list(
                                   py_statement_result = NULL,
                                   initialize = function(  result) {

                                           self$py_statement_result <- result

                                   },
                                   records = function(){
                                           self$py_statement_result$records()

                                   },
                                   data = function(){

                                           self$py_statement_result$data()

                                   },
                                   data.frame = function(){

                                           as.data.frame(self$py_statement_result$data())

                                   },
                                   attached = function(){
                                           self$py_statement_result$attached()
                                   }


                           ),

                           active = list(),
                           private = list()




)
