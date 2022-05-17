## Analysis of the Correlation Between Sex, Vaccine Brand, and Adverse Events After COVID-19 Vaccination Using VAERS Datasets
## Team 08: Adeline Schwartz, Anusha Kumar, Connor Thropp, Lindsey Ross, Ziyin Li

### Project Overview
This repository contains code used to analyze 2021 COVID-19 Data from VAERS (Vaccine Adverse Event Reporting System). The covariates used to analyze COVID-19 data in our project are identified, such as sex, vaccine brand (Moderna and Pfizer vaccines), and the top three adverse events. We are able to assess whether a significant correlation exists among these three variables. The additional examination of other covariates such as age and onset data helps in understanding the onset of symptoms associated with COVID-19 vaccination. This assists with determining relationships between onset interval and range of ages for Males/Females given Moderna/Pfizer. We are also able to understand the urgency associated with the top three adverse events and their relationship with age. Our results can assist medical professionals/vaccine manufacturers in understanding how to better market their vaccines, and may be useful for machine learning systems in the future.


| Table of Contents |
| ----------------- |
| [1. Getting Started](#getting-started) |
| [2. Code Files/Descriptions](#code-filesdescriptions) |
| [3. Contributions](#contributions) |
| [4. Future Directions](#future-directions) |

### Getting Started
- The data required for this project is downloadable from [VAERS](https://vaers.hhs.gov/data/datasets.html)
  - From this site, download three CSV files from the year 2021: VAERS DATA, VAERS Symptoms, and VAERS Vaccine
  - These three files will serve as the input files for the data preprocessing code: `vaers_data_preprocess.jl` and `vaers_onsite_preprocess.jl`
- This project was primarily coded in the Julia programming language, with the exception of the code used to create the correlation matrix and heatmap (`vaers_corr.py`) which was written in Python
- Julia packages required: CSV.jl, DataFrames.jl, Plots.jl, StatsPlots.jl, DelimitedFiles.jl
- Python packages required: pandas, seasborn

### Code Files/Descriptions

Include write-ups/explanations of the coding files and/or output

1. `vaers_data_preprocess.jl` 

- Input files `2021VAERSVAX.csv`, `2021VAERSSYMPTOMS.csv`, and `2021VAERSDATA.csv`
- Output files `symptoms_counts_output.csv` and `final_processed_data_output.csv`

  First, VAERS_IDs of the two vaccine manufacturers (**Moderna and Pfizer**) are extracted from `2021VAERSVAX.csv`. After filtering by these VAERS_IDs in `2021VAERSSYMPTOMS.csv`, the total number of occurrences for each symptom (adverse event) is calculated and saved in `symptoms_counts_output.csv`. Then the VAERS_IDs corresponding to the top-3 most frequent symptoms (**headache, fatigue, and pyrexia**) are selected and are used as the key for merging between different data frames gained from the 3 input CSV files. In other words, vaccine, symptom and demographic information of the 3 selected symptoms for the two vaccines is joined together by matching VAERS_ID. The final processed data output file is called `final_processed_data_output.csv` is used as the main input file for data analysis later.


2. `project_counts_table.jl`

- Input file `final_processed_data_output.csv`
- Output file `updated_project_counts.csv`

  This Julia script tabulates the data and creates a formatted csv file that allows counts for different combinations of wanted categories. The data must have columns 2, 3, and 6 as adverse events, vaccine, and sex. This file first defines the main() function, which does data importing (defining variables), data cleaning, and plotting. There are three groups of variables to define for adverse events, vaccine, and sex. For each of these, the column, list of categories (reference in dataset), list of labels (reference in output csv file), and number of categories are defined. Then, the data is imported (the input file). The `Dict` (dictionary) is defined to keep track of counts. Running though every row, add for every key in the `Dict`. For every row, the key is taken as the entries found in the column according the column of the categories. The table is created as big as (number of symptoms categories) x (number of vaccine categories) + 2 by (number of adverse effect categories) + 2. The bottom right entries are filled with the counts and the first row is filled with sex categories. The second row is filled with vaccine categories, and the second column is filled with adverse effect categories. The first column on the top row is filled with "Counts" as the title. Finally, the first column, aligned with the middle of the adverse effect, categories column labels. The aforementioned array is saved as the CSV `updated_project_counts.csv` from the constructed table.

3. `vaers_eda.jl`

- Input file `final_processed_data_output.csv`
- Output file `grouped_percentages_output.csv` and bar plots (`vax_F.png` and `vax_M.png`)

  *(will add description later)*

**(please feel free to insert your scripts at the appropriate position and change the order number)**

4. `vaers_onsite_preprocess.jl`

- Input files `2021VAERSDATA.csv` and `final_processed_data_output.csv`
- Output file `onsite_processed_data_output.csv`

  *(will add description later)*

5. `vaers_onsite_eda.jl`

- Input file `onsite_processed_data_output.csv`
- Output file `onsite_grouped_percentages_output.csv`

  *(will add description later)*

**(please feel free to insert your scripts at the appropriate position and change the order number)**

6. `numdays_boxplots_scatterplots.jl`

- Input file `onsite_processed_data_output.csv`
- Output files `boxplot.png` and `scatter.png`

  This Julia script constructs two plots: boxplot and scatter plot. Both plots display a sample over onset days vs age (in years). Columns 1, 3, 5, 6, and 9 are used (id, vaccine, age, sex, and onset days). The id column **must be unique** to each subject. The helper function is defined: `is_valid_numerical` and `main` routine. The `main` function (for data importing, data cleaning, and plotting) is defined and run. The data is imported (the input file). The delimiter is set to "," and the data is imported into a vector of rows, with the header turned on. The plot options and coding are defined; labels for the plot are defined to map the name of the sex and vaccine. The same is done for the shapes and color of the categories, and the plot alpha (transparency) is set. The plots are saved as box plots and scatter plots with the customs plotting function, `make_plot`. 

  The rows are discarded so every row has an unique id. The data was parsed row wise. A valid data row would have non-empty entries for age, onset, sex, vaccine. Vaccine and sex had to have a key in one of the codings. Invalid rows would be discarded.

  `make_plot(plotfunc, plot_file, plot_title; pltopts...)` does the main job of plotting. First, it makes an array of plots to store the subplots to be created. It then goes through every combination of sex and vaccine and does the following. (For example, "Female" and "Pfizer" would be a combination.) Going through the data, the row that matches the given combination of sex and vaccine are taken. The filtered ages and onset days are seperated in two separate vectors of data. The color, and (marker) shape are set according to plot options. The plot title is set according the given combination of categories. Using `plotfunc` (which is `boxplot` or `scatter` in this case), the plot is constructed. The x-axis is set to "Onset Days", x axis ticks are set to be on every day, and the y-axis is set to "Age". The working plot is added to the plot vector. Using `savefig`, the plots  in the vector of plots are saved as a plot array in an image file called `plot_file`.

  The plots are created as follows:

```julia
    make_plot(boxplot, "boxplot.png", "Boxplot"; outliers=false)
    make_plot(scatter, "scatter.png", "Scatter Plot")
```






(last) `vaers_corr.py`

- Input file `final_processed_data_output.csv`
- Output file `corr_3_one-hot.png`

  The three primary factors (**sex, vaccine manufacturer, and symptom**) are selected from the `final_processed_data_output.csv` and are transformed into one-hot encoded features using pandas get_dummies function. Then the correlation matrix of these one-hot encoded features are calculated using the corr function and visualized in the format of heatmap using the seasborn package.


### Contributions
Our contributions to this project are outlined below:

- Adeline Schwartz:
- Anusha Kumar: `project_counts_table.jl`, `updated_project_counts.csv`, `numdays_boxplots_scatterplots.jl`, `boxplot.png`, and `scatter.png`
- Connor Thropp:
- Lindsey Ross:
- Ziyin Li: `vaers_data_preprocess.jl`, `symptoms_counts_output.csv`, `final_processed_data_output.csv`, `vaers_eda.jl`, `grouped_percentages_output.csv`, `vax_F.png`, `vax_M.png`, `vaers_onsite_preprocess.jl`, `onsite_processed_data_output.csv`, `vaers_onsite_eda.jl`, `onsite_grouped_percentages_output.csv`, `vaers_corr.py`, and `corr_3_one-hot.png`

### Future Directions
This study suggests that continuing to research the connection between adverse events and the at risk populations we identified will be possible using more powerful computational methods, such as machine learning. The findings from further research in this field will help improve vaccines, market them to a wider audience, and address feelings of vaccine hesitancy in the population.

