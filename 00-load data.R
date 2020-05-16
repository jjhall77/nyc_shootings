# load data
library(tidyverse)
library(lubridate)
library(janitor)
library(sf)
library(RSocrata)

url = 'https://data.cityofnewyork.us/Public-Safety/NYPD-Shooting-Incident-Data-Historic-/833y-fsy8'
url_ytd = 'https://data.cityofnewyork.us/Public-Safety/NYPD-Shooting-Incident-Data-Year-To-Date-/5ucz-vwe8/data'

shootings_historical <-read.socrata(url,stringsAsFactors = FALSE)
shootings_ytd <- read.socrata(url_ytd,stringsAsFactors = FALSE)

shootings <- rbind(shootings_historical, shootings_ytd) #bind_rows doesn't coerce characters

shootings <- shootings %>%
  distinct(incident_key, .keep_all = T) %>% 
  mutate(occur_date = ymd(occur_date),
         incident_year = year(occur_date))
