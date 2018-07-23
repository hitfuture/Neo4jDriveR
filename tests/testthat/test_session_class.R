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
        results <- session$run("MATCH (n:Hospital) RETURN count(n) AS count")
        expect_is(results,c("StatementResult","R6"))
        value <- results$data()[[1]][[1]]
        print(paste("Value:", value))
        expect_equal(3, value)
})

testthat::test_that("run_statement_that_returns_multiple_records ", {
        graph <- GraphDatabase$new()
        driver <- graph$driver(uri = Sys.getenv("NEO4J_URI"),user_id = Sys.getenv("NEO4J_USER"),password = Sys.getenv("NEO4J_PSWD"))
        session <- driver$session()
        results <- session$run("unwind(range(1, 10)) AS z RETURN z")
        count <- 0
        list_of_data <- results$data()

        lapply(list_of_data, function(record){

                expect_true(record[[1]] >= 1 & record[[1]] <= 10)
                count <<- count + 1
        })
        expect_equal(10,count)
        session$close()
})

testthat::test_that("run_statement_that_returns_multiple_records_with_multiple_cols", {
        graph <- GraphDatabase$new()
        driver <- graph$driver(uri = Sys.getenv("NEO4J_URI"),user_id = Sys.getenv("NEO4J_USER"),password = Sys.getenv("NEO4J_PSWD"))
        session <- driver$session()
        results <- session$run("MATCH (n:Hospital) return n.provider_id as provider_id, n.hospital_name as hospital_name")
        count <- 0
        list_of_data <- results$data.frame()
        expect_is(list_of_data,"data.frame")

        session$close()
})

testthat::test_that("pass paramaters to a session$run() function.",{
        graph <- GraphDatabase$new()
        driver <- graph$driver(uri = Sys.getenv("NEO4J_URI"),user_id = Sys.getenv("NEO4J_USER"),password = Sys.getenv("NEO4J_PSWD"))
        session <- driver$session()
        results =  session$run(
                "MATCH (hosp:Hospital) WHERE hosp.provider_id = {pid} return hosp.hospital_name, hosp.provider_id",
                pid=50108,x=5555
        )
        data <- results$data()
        expect_equal(1,length(data))
        expect_equal(2,length(data[1][[1]]))

})


