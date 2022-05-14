## Analyzing the Correlation Between Sex, Vaccine Brand, and Adverse Events After COVID-19 Vaccination
## Team 08: Adeline Schwartz, Anusha Kumar, Connor Thropp, Lindsey Ross, Ziyin Li

### Project Overview
This repository contains code used to analyze 2021 COVID-19 Data from VAERS (Vaccine Adverse Event Reporting System). The covariates used to analyze COVID-19 data in our project are identified, such as sex, vaccine brand (Moderna and Pfizer vaccines), and the top three adverse events. We are able to assess whether a significant correlation exists among these three variables. The additional examination of other covariates such as age and onset data helps in understanding the onset of symptoms associated with COVID-19 vaccination. This assists with determining relationships between onset interval and range of ages for Males/Females given Moderna/Pfizer. We are also able to understand the urgency associated with the top three adverse events and the relationship with age. Our results can assist medical professionals/vaccine manufacturers in understanding how to better market their vaccines, and may be useful for machine learning systems in the future.


| Table of Contents |
| ----------------- |
| [1. Introduction](#introduction) |
| [2. Getting Started](#getting-started) |
| [3. Instructions for Use](#instructions-for-use) |
| [4. Code Files/Descriptions](#code-files/descriptions) |
| [5. Contributions](#contributions) |
| [6. Future Directions](#future-directions) |

### Introduction
- state what project does
- state goals of the project
- language used
- list  most useful/innovative/noteworthy features
- describe any key concepts important to the user’s understanding


### Getting Started
Include any essential instructions for using the project
- **e.g. SPECIFY WHERE TO FIND THE INPUT DATA (URL for VAERS)**

### Instructions for Use
Describe intermediate and output files

### Code Files/Descriptions
Include brief write-up/explanations of the coding files and/or output

- Input file `project_counts_table.jl`
- Output file `updated_project_counts.csv`

This Julia script tabulates the data and creates a formatted csv file that allows counts for different combinations of wanted categories. The data must have columns 2, 3, and 6 as adverse events, vaccine, and sex. This file first defines the main() function, which does data importing, data cleaning, and plotting. The main() function defines variables. There are three groups of variables to define for adverse events, vaccine, and sex. For each of these, the column, list of categories (reference in dataset), list of labels (reference in output csv file), and number of categories are defined. Then, the data is imported (the input file is called `final_processed_data_output.csv`). The delimiter is "," the header is set to true, and the dataset is read with headers on. Next, the `Dict` (dictionary) is defined to keep track of counts. Each key is a combination of category. The value of each key is the count of that key in the dataset. Running though every row, add for every key in the `Dict`. For every row, the key is taken as the entries found in the column according the column of the categories (as defined above). The table is created as big as (number of symptoms categories) x (number of vaccine categories) + 2 by (number of adverse effect categories) + 2. The bottom right entries are filled with the counts and the first row is filled with sex categories. The second row is filled with vaccine categories, and the second column is filled with adverse effect categories. The first column on the top row is filled with "Counts" as the title. Finally, the first column, aligned with the middle of the adverse effect, categories column labels. The aforementioned array `updated_project_counts.csv` is saved as a CSV from the constructed table.

- 

### Contributions
Thank you to Adeline Schwartz, Anusha Kumar, Connor Thropp, Lindsey Ross, and Ziyin Li for all contributions. 

Our contributions to the project are outlined below:

- Adeline Schwartz:
- Anusha Kumar:
- Connor Thropp:
- Lindsey Ross:
- Ziyin Li:

### Future Directions
Next steps/future plans for the project
