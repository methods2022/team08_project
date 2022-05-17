# Analysis of the Correlation Between Sex, Vaccine Brand, and Adverse Events After COVID-19 Vaccination Using VAERS Datasets
## Team 08: Adeline Schwartz, Anusha Kumar, Connor Thropp, Lindsey Ross, Ziyin Li

### Project Overview
This repository contains code used to analyze data from VAERS (Vaccine Adverse Event Reporting System). Specifically, this code was written to analyze the relationship between systemic adverse events that were reported after COVID-19 vaccination and several variables from the 2021 datasets. The covariates focused on in our analysis were sex and vaccine brand (Moderna and Pfizer). The goal of the project was to assess whether any significant correlations exist between these two variables and the top three most frequently reported adverse events post-COVID-19 vaccination. The additional examination of other covariates, such as age and onset time (the number of days between vaccination and the onset of symptoms), helps in understanding how the symptoms associated with COVID-19 vaccination manifest. Our results can assist medical professionals/vaccine manufacturers in understanding how to better market their vaccines, and may be useful for machine learning systems in the future.

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

1. `vaers_data_preprocess.jl` 

- Input files `2021VAERSVAX.csv`, `2021VAERSSYMPTOMS.csv`, and `2021VAERSDATA.csv`
- Output files `symptoms_counts_output.csv` and `final_processed_data_output.csv`

  First, VAERS_IDs of the two vaccine manufacturers (**Moderna and Pfizer**) are extracted from `2021VAERSVAX.csv`. After filtering by these VAERS_IDs in `2021VAERSSYMPTOMS.csv`, the total number of occurrences for each symptom (adverse event) is calculated and saved in `symptoms_counts_output.csv`. Then the VAERS_IDs corresponding to the top-3 most frequent symptoms (**headache, fatigue, and pyrexia**) are selected and are used as the key for merging between different data frames gained from the 3 input CSV files. In other words, vaccine, symptom and demographic information of the 3 selected symptoms for the two vaccines is joined together by matching VAERS_ID. The final processed data output file is called `final_processed_data_output.csv` is used as the main input file for data analysis later.


2. `project_counts_table.jl`

- Input file `final_processed_data_output.csv`
- Output file `updated_project_counts.csv`

  This Julia script tabulates the data and creates a formatted csv file that allows counts for different combinations of wanted categories. The data must have columns 2, 3, and 6 as adverse events, vaccine, and sex. This file first defines the main() function, which does data importing (defining variables), data cleaning, and plotting. There are three groups of variables to define for adverse events, vaccine, and sex. For each of these, the column, list of categories (reference in dataset), list of labels (reference in output csv file), and number of categories are defined. Then, the data is imported (the input file). The `Dict` (dictionary) is defined to keep track of counts. For every row, the key is taken as the entries found in the column according the column of the categories. The aforementioned array is saved as the CSV `updated_project_counts.csv` from the constructed table.

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

  This Julia script constructs two plots: boxplot and scatter plot. Both plots display a sample over onset days vs age (in years). Columns 1, 3, 5, 6, and 9 are used (id, vaccine, age, sex, and onset days). The id column **must be unique** to each subject. The helper function is defined: `is_valid_numerical` and `main` routine. The `main` function (for data importing, data cleaning, and plotting) is defined and run. The data is imported (the input file). The plot options and coding are defined; labels for the plot are defined to map the name of the sex and vaccine. The plots are saved as box plots and scatter plots with the customs plotting function, `make_plot`. The rows are discarded so every row has an unique id. The data was parsed row wise. A valid data row would have non-empty entries for age, onset, sex, vaccine. Vaccine and sex had to have a key in one of the codings. Invalid rows would be discarded.

7. `at_risk_group_plots.jl`

- Input file `final_processed_data_output.csv`
- Output files `fatigue_at_risk_plot.png`, `headache_at_risk_plot.png`, `pyrexia_at_risk_plot.png`

  This Julia script constructs 6 histograms from the preprocessed data (input file). Each output file contains 2 histograms and focuses on the ages of people who reported experiencing the top three most frequently observed adverse event symptoms. One of the histograms in each symptom-specific file shows the age distribution of everyone who reported that symptom, while the other histogram shows the age distribution of everyone who reported that symptom ***and*** is a member of the at-risk population that we identified for that symptom.
  
 8. `onset_time_visualizations.jl`
 
 - Input file `onsite_processed_data_output.csv`
 - Output file `onset_time_v_sex_and_manu.png`

  This Julia script



(last) `vaers_corr.py`

- Input file `final_processed_data_output.csv`
- Output file `corr_3_one-hot.png`

  The three primary factors (**sex, vaccine manufacturer, and symptom**) are selected from the `final_processed_data_output.csv` and are transformed into one-hot encoded features using pandas get_dummies function. Then the correlation matrix of these one-hot encoded features are calculated using the corr function and visualized in the format of heatmap using the seasborn package.


### Contributions
Our contributions to this project are outlined below:

- Adeline Schwartz:
- Anusha Kumar: `project_counts_table.jl`, `updated_project_counts.csv`, `numdays_boxplots_scatterplots.jl`, `boxplot.png`, and `scatter.png`
- Connor Thropp:
- Lindsey Ross: `at_risk_group_plots.jl`, `fatigue_at_risk_plot.png`, `headache_at_risk_plot.png`, `pyrexia_at_risk_plot.png`, `onset_time_visualizations.jl`, `onset_time_v_sex_and_manu.png`
- Ziyin Li: `vaers_data_preprocess.jl`, `symptoms_counts_output.csv`, `final_processed_data_output.csv`, `vaers_eda.jl`, `grouped_percentages_output.csv`, `vax_F.png`, `vax_M.png`, `vaers_onsite_preprocess.jl`, `onsite_processed_data_output.csv`, `vaers_onsite_eda.jl`, `onsite_grouped_percentages_output.csv`, `vaers_corr.py`, and `corr_3_one-hot.png`

### Future Directions
Continuing to research the connection between adverse reactions to vaccines and at-risk populations will be possible using more powerful computational methods, such as machine learning. The findings from further research in this field will help improve vaccines, market them to a wider audience, and address feelings of vaccine hesitancy in the population. In turn, this will help the public make more informed decisions about their own safety and the safety of their peers.
