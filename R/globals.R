

# global reference to neo4j-driver (will be initialized in .onLoad)
neo4jPy <- NULL
pd <- NULL

.onLoad <- function(libname, pkgname) {
        # use superassignment to update global reference to neo4j python driver
       neo4jPy <<- reticulate::import("neo4j.v1", delay_load = TRUE)
       pd <<- reticulate::import("pandas",convert = FALSE,delay_load = TRUE)
}
