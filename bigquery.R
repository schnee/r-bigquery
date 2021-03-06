# devtools::install_github("dplyr")
# devtools::install_github("assertthat")
# devtools::install_github("bigrquery")

library(bigrquery)
library(dplyr)   

billing_project = ""

sql_q <- "SELECT year, month, day, weight_pounds FROM natality LIMIT 5"
df =query_exec("publicdata", "samples", sql_q, billing = billing_project)

bq_db = src_bigquery("publicdata","samples", billing=billing_project)
bq_db

sql_q <- "SELECT year, month, day, weight_pounds FROM natality LIMIT 5"

#fails
t1=tbl(bq_db, sql(sql_q))

#fails
t2=tbl(bq_db, "natality")