# Neo4j main class that gives access to Neo4j
#'@title GraphDatabase
#'@description Accessor for :class:`.Driver` construction.
#'@examples
#'driver <- GraphDatabase$new()$driver(uri='bolt://localhost:7687',user_id='neo4j',password='neo4j')
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




                },
                close= function(){
                        self$py_driver$close()
                },
                closed = function(){
                        self$py_driver$closed()
                }


        ),

        active = list(),
        private = list()



)


#'@title Session
#'@description S A :class:`.Session` is a logical context for transactional units
#' of work. Connections are drawn from the :class:`.Driver` connection
#' pool as required.
#' Session creation is a lightweight operation and sessions are not thread
#' safe. Therefore a session should generally be short-lived, and not
#' span multiple threads.

#'@import R6
#'@export
Session <- R6Class(
        classname = "Session",
        public =   list(
                py_session = NULL,
                initialize = function(  driver) {

                        self$py_session <- driver$session()

                },
                close = function(){
                        self$py_session$close()
                },
                closed = function(){
                        self$py_session$closed()

                },
                run = function(statement, parameters = NULL, ...) {
                        StatementResult$new(self$py_session$run(statement, parameters, ...))
                },
                send = function(){
                        self$py_session$send()
                },
                fetch = function(){
                        self$py_session$fetch()
                },
                sync = function(){
                        self$py_session$sync()
                },
                detach = function(result){
                        self$py_session$detach(result)
                },
                last_bookmark = function(){
                        self$py_session$last_bookmark()
                },
                has_transaction = function(){
                        self$py_session$has_transaction()
                },


                begin_transaction = function(bookmark = NULL){
                        Transaction$new(self$py_session)
                },
                commit_transaction = function( ){
                        self$py_session$commit_transaction()
                },

                rollback_transaction = function( ){
                        self$py_session$rollback_transaction()
                },
                reset = function( ){
                        self$py_session$reset()
                },
                read_transaction = function(unit_of_work, args, kwargs ){
                        self$py_session$read_transaction(unit_of_work)
                },
                write_transaction = function(unit_of_work, args, kwargs  ){
                        self$py_session$write_transaction()
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
                run = function(statement, parameters = NULL, ...){
                        StatementResult$new(self$py_transaction$run(statement,parameters = parameters,...))

                }

        ),

        active = list(),
        private = list()



)

#'@title StatementResult
#'@description StatementResult is the class that is the return from execution Neo4jDB

#'@import R6
#'@import reticulate
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

                                           df <- pd$DataFrame(self$py_statement_result$data())
                                           py_to_r(df)

                                   },
                                   attached = function(){
                                           self$py_statement_result$attached()
                                   }


                           ),

                           active = list(),
                           private = list()




)
