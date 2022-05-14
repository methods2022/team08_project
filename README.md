## Analysis of the Correlation Between Sex, Vaccine Brand, and Adverse Events After COVID-19 Vaccination Using VAERS Datasets
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
Describe intermediate and output files (we can describe Ziyin's input files in this section)

### Code Files/Descriptions

Include write-ups/explanations of the coding files and/or output

- Input file `project_counts_table.jl`
- Output file `updated_project_counts.csv`

This Julia script tabulates the data and creates a formatted csv file that allows counts for different combinations of wanted categories. The data must have columns 2, 3, and 6 as adverse events, vaccine, and sex. This file first defines the main() function, which does data importing (defining variables), data cleaning, and plotting. There are three groups of variables to define for adverse events, vaccine, and sex. For each of these, the column, list of categories (reference in dataset), list of labels (reference in output csv file), and number of categories are defined. Then, the data is imported (the input file is `final_processed_data_output.csv`). The delimiter is "," the header is set to true, and the dataset is read with headers on. Next, the `Dict` (dictionary) is defined to keep track of counts. Running though every row, add for every key in the `Dict`. For every row, the key is taken as the entries found in the column according the column of the categories. The table is created as big as (number of symptoms categories) x (number of vaccine categories) + 2 by (number of adverse effect categories) + 2. The bottom right entries are filled with the counts and the first row is filled with sex categories. The second row is filled with vaccine categories, and the second column is filled with adverse effect categories. The first column on the top row is filled with "Counts" as the title. Finally, the first column, aligned with the middle of the adverse effect, categories column labels. The aforementioned array is saved as the CSV `updated_project_counts.csv` from the constructed table.

- Input file `numdays_boxplots_scatterplots.jl`
- Output files `boxplot.png` and `scatter.png`

This Julia script constructs two plots: boxplot and scatter plot. Both plots display a sample over onset days vs age (in years). Columns 1, 3, 5, 6, and 9 are used (id, vaccine, age, sex, and onset days). The id column **must be unique** to each subject. The helper function is defined: `is_valid_numerical` and `main` routine. The `main` function (for data importing, data cleaning, and plotting) is defined and run. The data is imported (the input file is `onsite_processed_data_output.csv`). The plot options and coding are defined; labels for the plot are defined to map the name of the sex and vaccine. The same is done for the shapes and color of the categories. The plots are saved as box plots and  scatter plots with the customs plotting function, `make_plot`. 

The rows are discarded so every row has an unique id. The data was parsed row wise. A valid data row would have non-empty entries for age, onset, sex, vaccine. Vaccine and sex had to have a key in one of the codings. Invalid rows would be discarded.

`make_plot(plotfunc, plot_file, plot_title; pltopts...)` does the main job of plotting. First, it makes an array of plots to store the subplots to be created. It then goes through every combination of sex and vaccine and does the following. (For example, "Female" and "Pfizer" would be an a combination.) Going through the data, the row that matches the given combination of sex and vaccine are taken. The filtered ages and onset days are seperated in two separate vectors of data. The color, and (marker) shape are set according to plot options. The plot title is set according the given combination of categories. Using `plotfunc` (which is `boxplot` or `scatter` in this case), the plot is constructed.The x-axis is set to "Onset Days", x axis ticks are set to be on every day, and the y-axis is set to "Age". The working plot is added to the plot vector. Using `savefig`, the plots  in the vector of plots are saved as a plot array in an image file called `plot_file`.

### Contributions
Our contributions to this project are outlined below:

- Adeline Schwartz:
- Anusha Kumar: `project_counts_table.jl`, `updated_project_counts.csv`, `numdays_boxplots_scatterplots.jl`, `boxplot.png`, and `scatter.png`
- Connor Thropp:
- Lindsey Ross:
- Ziyin Li:

### Future Directions
Next steps/future plans for the project
