#### Preamble ####
# Purpose: Downloads and saves the data from Toronto Open Data Portal
# Author: Wanling Ma
# Date: 24 January 2024
# Contact: wanling.ma@mail.utoronto.ca
# License: MIT
# Pre-requisites: opendatatoronto and tidyverse are set up


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####

##### Download data for crime rate #####
package <- show_package("neighbourhood-crime-rates")

# get all resources for this package
crime_rate_resources <- list_package_resources("neighbourhood-crime-rates")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
crime_rate_datastore_resources <- filter(crime_rate_resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
crime_rate_data <- filter(crime_rate_datastore_resources, row_number()==1) %>% get_resource()


##### Download data for income data #####
# get all resources for this package
neighbour_resources <- list_package_resources("6e19a90f-971c-46b3-852c-0c48c436d1fc")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
neighbour_datastore_resources <- filter(neighbour_resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
neighbour_data <- filter(neighbour_datastore_resources, row_number()==1) %>% get_resource()


#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(crime_rate_data, "inputs/data/crime_rate_raw_data.csv") 
write_csv(neighbour_data, "inputs/data/neighbour_raw_data.csv")

         
