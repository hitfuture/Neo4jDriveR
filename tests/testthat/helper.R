# helper function to skip tests if we don't have the 'foo' module
library(reticulate)
skip_if_no_neo4j_driver <- function() {
        isNeo4jPyDriverAvailable <- py_module_available("neo4j.v1")
        if (!isNeo4jPyDriverAvailable)
                skip("Python neo4j-driver not available for testing.  Please install it reticulate::import('neo4j.v1') ")
}


