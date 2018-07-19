context("Test Session class")

testthat::test_that("Session$closed() ", {
        graph <- GraphDatabase$new()
        driver <- graph$driver(uri = Sys.getenv("NEO4J_URI"),user_id = Sys.getenv("NEO4J_USER"),password = Sys.getenv("NEO4J_PSWD"))
        session <- driver$session()
        expect_false(session$closed())
})


testthat::test_that("Session$close() ", {
        graph <- GraphDatabase$new()
        driver <- graph$driver(uri = Sys.getenv("NEO4J_URI"),user_id = Sys.getenv("NEO4J_USER"),password = Sys.getenv("NEO4J_PSWD"))
        session <- driver$session()
        expect_false(session$closed())
        session$close()
        expect_true(session$closed())
})
testthat::test_that("Session$run(statement) ", {
        graph <- GraphDatabase$new()
        driver <- graph$driver(uri = Sys.getenv("NEO4J_URI"),user_id = Sys.getenv("NEO4J_USER"),password = Sys.getenv("NEO4J_PSWD"))
        session <- driver$session()
        results <- session$run("MATCH (n) RETURN count(n) AS count")
        expect_is(results,c("StatementResult","R6"))
        value <- results$data()[[1]][[1]]
        print(paste("Value:", value))
        expect_equal(5, value)
})
