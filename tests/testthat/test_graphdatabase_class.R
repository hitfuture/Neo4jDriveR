
context("Test GraphDatabase class")

testthat::test_that("Ensure that the object will be returned",{

        graph <- GraphDatabase$new()
        the_class <- class(graph)
        expect_is(graph,c("GraphDatabase","R6"))
})

testthat::test_that("Graph Driver",{

        graph <- GraphDatabase$new()
        driver <- graph$driver(uri = Sys.getenv("NEO4J_URI"),user_id = Sys.getenv("NEO4J_USER"),password = Sys.getenv("NEO4J_PSWD"))
        expect_is(graph,c("Driver","R6"))

})
