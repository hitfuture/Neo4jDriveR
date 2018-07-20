# platform       x86_64-pc-linux-gnu
# arch           x86_64
# os             linux-gnu
# system         x86_64, linux-gnu
# status
# major          3
# minor          4.4
# year           2018
# month          03
# day            15
# svn rev        74408
# language       R
# version.string R version 3.4.4 (2018-03-15)
# nickname       Someone to Lean On

library(reticulate)
pd <- import("pandas",as = "pd",convert = FALSE)
aa <- pd$read_csv("../../devopsenv/data/CDM_LOCATION.csv")
df <-  reticulate::py_to_r(aa)
print(class(df))

test_fun <- function(statement,...){
        result <- dict(...)
         result
}

test_fun(d1="1",d2=3,5)

