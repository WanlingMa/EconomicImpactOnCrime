#### Preamble ####
# Purpose: Simulates... 
# Author: Wanling Ma 
# Date: January 23rd, 2024
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Simulate data ####
# Function to generate random counts for crimes in 2020
generate_random_counts <- function(num_areas, scale=100) {
  sapply(c('ASSAULT', 'AUTOTHEFT', 'BIKETHEFT', 'BREAKENTER', 'HOMICIDE', 'ROBBERY', 'SHOOTING', 'THEFTFROMMV', 'THEFTOVER'),
         function(crime) rpois(num_areas, scale))
}

# Function to generate income groups
generate_income_groups <- function(num_areas) {
  data.frame(
    INCOME_WITHOUT = sample(0:1, num_areas, replace=TRUE, prob=c(0.05, 0.95)),
    INCOME_UNDER_10K = sample(0:100, num_areas, replace=TRUE),
    INCOME_10K_TO_20K = sample(0:100, num_areas, replace=TRUE),
    INCOME_20K_TO_30K = sample(0:100, num_areas, replace=TRUE),
    INCOME_30K_TO_40K = sample(0:100, num_areas, replace=TRUE),
    INCOME_40K_TO_50K = sample(0:100, num_areas, replace=TRUE),
    INCOME_50K_TO_60K = sample(0:100, num_areas, replace=TRUE),
    INCOME_60K_TO_70K = sample(0:100, num_areas, replace=TRUE),
    INCOME_70K_TO_80K = sample(0:100, num_areas, replace=TRUE),
    INCOME_80K_TO_90K = sample(0:100, num_areas, replace=TRUE),
    INCOME_90K_TO_100K = sample(0:100, num_areas, replace=TRUE),
    INCOME_100K_AND_OVER = sample(0:100, num_areas, replace=TRUE),
    INCOME_100K_TO_125K = sample(0:100, num_areas, replace=TRUE),
    INCOME_125K_AND_OVER = sample(0:100, num_areas, replace=TRUE)
  )
}

# Simulate a dataset based on the attributes provided for the year 2020
simulate_dataset_2020 <- function(num_areas=158) {
  # Simulate random data for the provided attributes
  data <- data.frame(
    id = 1:num_areas,
    AREA_NAME = paste('Neighbourhood', 1:num_areas),
    HOOD_ID = 1:num_areas
  )
  
  # Generate random crime counts and rates for 2020
  counts_2020 <- generate_random_counts(num_areas)
  names(counts_2020) <- paste(names(counts_2020), '2020', sep='_')
  
  # Combine all data
  data <- cbind(data, counts_2020)
  
  # Generate income groups
  data <- cbind(data, generate_income_groups(num_areas))
  
  return(data)
}

# Use the simulate_dataset_2020 function to create a data.frame
simulated_data_2020 <- simulate_dataset_2020(158)

simulated_data_2020
