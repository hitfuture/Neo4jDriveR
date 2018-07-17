
context("Test Driver class")

testthat::test_that("Ensure that the object will be returned", {
        uri <- Sys.getenv("NEO4J_URI")
        print(paste("Bolt URI", uri))
        print(paste("User ID:",  Sys.getenv("NEO4J_USER")))
        print(paste("Password:",  Sys.getenv("NEO4J_PSWD")))

        expect_gt(nchar(uri),1)
        driv <-
                Driver$new(
                        uri = Sys.getenv("NEO4J_URI"),
                        user_id = Sys.getenv("NEO4J_USER"),
                        password = Sys.getenv("NEO4J_PSWD")
                )
        expect_is(driv, c("Driver", "R6"))
})

testthat::test_that("Expect Failure", {
        uri <- Sys.getenv("NEO4J_URI")
        print(paste("Bolt URI", uri))
        expect_gt(nchar(uri),1)
        expect_error({
                Driver$new(
                        uri = "bolt://192.0.0.0:7687",
                        user_id = "xxx",
                        password = "yyy"

                )})
})
