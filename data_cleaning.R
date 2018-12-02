# Data Wrangling Script

library(readr)
library(dplyr)
raw_data <- read_csv("script_costs.csv")

# This will get the costs associated with the school while keeping the school info
costs <- raw_data %>%
  select("ID" = UNITID,
         "NAME" = INSTNM,
         CITY, 
         "STATE" = STABBR,
         ZIP,
         "INSTATE_TUITION" = TUITIONFEE_IN,
         "OUTOFSTATE_TUITION" = TUITIONFEE_OUT) %>%
  filter(INSTATE_TUITION != "NULL" & OUTOFSTATE_TUITION != "NULL") %>%
  mutate(ZIP = substr(ZIP, 1, 5))

write.csv(costs, "uni_costs_by_location.csv", row.names = FALSE)