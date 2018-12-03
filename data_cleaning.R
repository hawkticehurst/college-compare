# Data Wrangling Script

library(readr)
library(dplyr)
library(stringr)
raw_data <- read_csv("data/MERGED2012_13_PP.csv")
raw_data[raw_data == "NULL" | raw_data == "PrivacySuppressed"] <- NA

# This will get the costs associated with the school while keeping the school info
# costs <- raw_data %>%
#   select("ID" = UNITID,
#          "NAME" = INSTNM,
#          CITY,
#          "STATE" = STABBR,
#          ZIP,
#          "INSTATE_TUITION" = TUITIONFEE_IN,
#          "OUTOFSTATE_TUITION" = TUITIONFEE_OUT) %>%
#   filter(INSTATE_TUITION != "NULL" & OUTOFSTATE_TUITION != "NULL") %>%
#   mutate(ZIP = substr(ZIP, 1, 5))
# 
# write.csv(costs, "uni_costs_by_location.csv", row.names = FALSE)

earnings <- raw_data %>%
  select("ID" = UNITID,
        "NAME" = INSTNM,
        CITY,
        "STATE" = STABBR,
        ZIP,
        "COLLEGE_TYPE" = CONTROL,
        "MEAN_EARNINGS_10_YEARS" = MN_EARN_WNE_P10,
        "MEAN_EARNINGS_9_YEARS" = MN_EARN_WNE_P9,
        "MEAN_EARNINGS_8_YEARS" = MN_EARN_WNE_P8,
        "MEAN_EARNINGS_7_YEARS" = MN_EARN_WNE_P7,
        "MEAN_EARNINGS_6_YEARS" = MN_EARN_WNE_P6) %>%
  mutate(ZIP = substr(ZIP, 1, 5)) %>%
  select_if(~ !all(is.na(.)))

write.csv(earnings, "data/uni_earnings_by_college_type.csv", row.names = FALSE)

debt <- raw_data %>%
  select("ID" = UNITID,
         "NAME" = INSTNM,
         CITY,
         "STATE" = STABBR,
         ZIP,
         "COLLEGE_TYPE" = CONTROL,
         "LOW_INCOME_MEDIAN_DEBT" = LO_INC_DEBT_MDN,
         "MED_INCOME_MEDIAN_DEBT" = MD_INC_DEBT_MDN,
         "HI_INCOME_MEDIAN_DEBT" = HI_INC_DEBT_MDN) %>%
  mutate(ZIP = substr(ZIP, 1, 5)) %>%
  select_if(~ !all(is.na(.)))

write.csv(debt, "data/uni_debt_by_income.csv", row.names = FALSE)

