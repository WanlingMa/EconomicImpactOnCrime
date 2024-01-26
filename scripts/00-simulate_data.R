#### Preamble ####
# Purpose: Simulates the income and education level and major of study and crime count data in different neighbourhoods
# Author: Wanling Ma 
# Date: 24 January 2024
# Contact: wanling.ma@mail.utoronto.ca
# License: MIT
# Pre-requisites: dplyr and tidyverse are installed


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
    INCOME_WITHOUT = sample(0:100, num_areas, replace=TRUE),
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

# Function to generate education levels
generate_education_levels <- function(num_areas) {
  data.frame(
    NO_DIPLOMA = sample(0:100, num_areas, replace=TRUE),
    HIGH_SCHOOL_DIPLOMA = sample(0:100, num_areas, replace=TRUE),
    BACHELORS_DEGREE = sample(0:100, num_areas, replace=TRUE),
    MASTERS_DEGREE = sample(0:100, num_areas, replace=TRUE),
    PHD = sample(0:100, num_areas, replace=TRUE)
  )
}

# Function to generate major of study
generate_major_of_study <- function(num_areas) {
  data.frame(
    ENGINEERING = sample(0:100, num_areas, replace=TRUE),
    HUMANITIES = sample(0:100, num_areas, replace=TRUE),
    SCIENCES = sample(0:100, num_areas, replace=TRUE),
    BUSINESS = sample(0:100, num_areas, replace=TRUE),
    OTHER_MAJORS = sample(0:100, num_areas, replace=TRUE)
  )
}

#### Modify the simulate_dataset_2020 function ####
simulate_dataset_2020 <- function(num_areas=158) {
  # Base data
  data <- data.frame(
    id = 1:num_areas,
    AREA_NAME = paste('Neighbourhood', 1:num_areas),
    HOOD_ID = 1:num_areas
  )
  
  # Generate random crime counts and rates for 2020
  counts_2020 <- generate_random_counts(num_areas)
  names(counts_2020) <- paste(names(counts_2020), '2020', sep='_')
  
  # Generate income groups
  income_groups <- generate_income_groups(num_areas)
  
  # Generate education levels
  education_levels <- generate_education_levels(num_areas)
  
  # Generate major of study
  major_of_study <- generate_major_of_study(num_areas)
  
  # Combine all data
  data <- cbind(data, counts_2020, income_groups, education_levels, major_of_study)
  
  return(data)
}

# Use the simulate_dataset_2020 function to create a data.frame
num_areas_test <- 158
simulated_data_2020 <- simulate_dataset_2020(158)

simulated_data_2020

# Test 1: Number of Rows
if (nrow(simulated_data_2020) == num_areas_test) {
  cat("Test 1 Passed: Correct number of rows\n")
} else {
  cat("Test 1 Failed: Incorrect number of rows\n")
}

# Test 2: Column Names and Types
expected_columns <- c("id", "AREA_NAME", "HOOD_ID", c('ASSAULT', 'AUTOTHEFT', 'BIKETHEFT', 'BREAKENTER', 'HOMICIDE', 
                                                      'ROBBERY', 'SHOOTING', 'THEFTFROMMV', 'THEFTOVER'), 
                      names(generate_income_groups(1)), names(generate_education_levels(1)), names(generate_major_of_study(1)))
if (all(expected_columns %in% names(simulated_data_2020))) {
  cat("Test 2 Passed: All expected columns are present\n")
} else {
  cat("Test 2 Failed: Missing columns\n")
}

# Test 3: Range of Values
numeric_columns <- names(simulated_data_2020)[sapply(simulated_data_2020, is.numeric)]
if (min(simulated_data_2020[, numeric_columns]) >= 0) {
  cat("Test 3 Passed: Numeric values are within the expected range\n")
} else {
  cat("Test 3 Failed: Numeric values are out of the expected range\n")
}

# Test 4: Data Frame Structure
if (is.data.frame(simulated_data_2020)) {
  cat("Test 4 Passed: The result is a data frame\n")
} else {
  cat("Test 4 Failed: The result is not a data frame\n")
}
