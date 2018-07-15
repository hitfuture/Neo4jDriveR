
context("Test GraphDatabase class")

testthat::test_that("Ensure that the object will be returned",{

        graph <- GraphDatabase$new()
        the_class <- class(graph)
        expect_is(graph,c("GraphDatabase","R6"))
})
