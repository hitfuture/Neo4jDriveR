
context("Testing the initial builds")
# then call this function from all of your tests
test_that("Things work as expected", {
        skip_if_no_neo4j_driver()
        #This is where it would happens
        id <- init_neo4j()
        expect_false(is.null(id))
})

test_that("will the python driver be available",{

        driver <- neo4j_python()
        expect_false(is.null(driver))
        print(driver)
})
