# Data Wrangling Script

library(readr)
library(dplyr)
raw_data <- read_csv("/info201_project/0_data/MERGED2009_10_PP.csv")

# This will get the costs associated with the school while keeping the school info
costs <- raw.data %>%
  select(UNITID,	OPEID,	OPEID6,	INSTNM,	CITY,	STABBR,	ZIP,
         "INSTATE TUITION" = TUITIONFEE_IN,
         "OUTOFSTATE TUITION" = TUITIONFEE_OUT)
costs[is.na(costs)] <- 0

write.csv(costs, "uni_costs.csv")