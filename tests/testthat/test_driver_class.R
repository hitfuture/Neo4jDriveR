
context("Test Driver class")

testthat::test_that("Ensure that the object will be returned",{

        driv <- Driver$new(uri = "bolt://localhost:7474",user_id = "neo4j",password = "neo4j")
         expect_is(driv,c("Driver","R6"))
})
