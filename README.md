# Economic And Educational Impact on Crime Rate in Neighbourhood

## Overview

This repo contains all required scripts and sources codes for the report *The Impact of Economic and Education Factors on Crime Rates: A Neighborhood-Level Analysis*.

## File Structure

The repo is structured as:

-   `input/data` contains the data sources used in analysis including the raw data.
-   `outputs/data` contains the cleaned dataset that was constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## Instructions to reproduce the paper
1. Please install the following libraries:
```r
install.packages("tidyverse")
install.packages("dplyr")
install.packages("opendatatoronto")
install.packages("knitr")
install.packages("readr")
install.packages("reshape2")
install.packages("ggplot2")
install.packages("tidyr")
```

2. Run the script 'scripts/00-simulate_data.R' first to simulate the data
3. Run the script 'scripts/01-download_data.R' to download the necessary data
4. Render the EconomicAndEducationInpacctOnCrime.qmd to generate the required paper

## Statement on LLM usage:
The abstract, introduction, conclusion were written with the help of ChatHorse and the entire chat history is available in inputs/llms/usage.txt.