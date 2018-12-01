# Data Wrangling Script

library(readr)
library(dplyr)
raw_data <- read_csv("/info201_project/0_data/MERGED2009_10_PP.csv")

# This will get the costs associated with the school while keeping the school info
costs <- raw.data %>%
  select(UNITID,	OPEID,	OPEID6,	INSTNM,	CITY,	STABBR,	ZIP, # Keeping school informations
         
         # Here and below are the various costs
         NPT4_PUB, NPT4_PRIV, NPT4_PROG, NPT4_OTHER, NPT41_PUB,
         NPT42_PUB, NPT43_PUB, NPT44_PUB, NPT45_PUB, NPT41_PRIV,
         NPT42_PRIV, NPT43_PRIV, NPT44_PRIV, NPT45_PRIV, NPT41_PROG,
         NPT42_PROG, NPT43_PROG, NPT44_PROG, NPT45_PROG, NPT41_OTHER,
         NPT42_OTHER,
         NPT43_OTHER,
         NPT44_OTHER,
         NPT45_OTHER,
         NPT4_048_PUB,
         NPT4_048_PRIV,
         NPT4_048_PROG,
         NPT4_048_OTHER,
         NPT4_3075_PUB,
         NPT4_3075_PRIV,
         NPT4_75UP_PUB,
         NPT4_75UP_PRIV,
         NPT4_3075_PROG,
         NPT4_3075_OTHER,
         NPT4_75UP_PROG,
         NPT4_75UP_OTHER,
         NUM4_PUB,
         NUM4_PRIV,
         NUM4_PROG,
         NUM4_OTHER,
         NUM41_PUB,
         NUM42_PUB,
         NUM43_PUB,
         NUM44_PUB,
         NUM45_PUB,
         NUM41_PRIV,
         NUM42_PRIV,
         NUM43_PRIV,
         NUM44_PRIV,
         NUM45_PRIV,
         NUM41_PROG,
         NUM42_PROG,
         NUM43_PROG,
         NUM44_PROG,
         NUM45_PROG,
         NUM41_OTHER,
         NUM42_OTHER,
         NUM43_OTHER,
         NUM44_OTHER,
         NUM45_OTHER,
         COSTT4_A,
         COSTT4_P,
         TUITIONFEE_IN,
         TUITIONFEE_OUT,
         TUITIONFEE_PROG)

write.csv(costs, "uni_costs.csv")