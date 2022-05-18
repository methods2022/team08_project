## Analysis Of The Correlation Between Sex, Vaccine Brand, and Adverse Events After COVID-19 Vaccination Using VAERS Datasets
### Team 08: Adeline Schwartz, Anusha Kumar, Connor Thropp, Lindsey Ross, Ziyin Li

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
  - From this site, download three CSV files from the year 2021: **`2021VAERSVAX.csv`, `2021VAERSSYMPTOMS.csv`, `2021VAERSDATA.csv`**
  - These three files will serve as the input files for the data preprocessing code: `vaers_data_preprocess.jl` and `vaers_onsite_preprocess.jl`
- This project was primarily coded in the Julia programming language, with the exception of the code used to create the correlation matrix and heatmap (`vaers_corr.py`) which was written in Python
- Julia packages required: CSV.jl, DataFrames.jl, Plots.jl, StatsPlots.jl, DelimitedFiles.jl
- Python packages required: pandas, seasborn

### Code Files/Descriptions

#### Primary Analysis

1. `vaers_data_preprocess.jl` 

- Input files `2021VAERSVAX.csv`, `2021VAERSSYMPTOMS.csv`, and `2021VAERSDATA.csv`
- Output files `symptoms_counts_output.csv` and `final_processed_data_output.csv`

  First, VAERS_IDs of the two vaccine manufacturers (**Moderna and Pfizer**) are extracted from `2021VAERSVAX.csv`. After filtering by these VAERS_IDs in `2021VAERSSYMPTOMS.csv`, the total number of occurrences for each symptom (adverse event) is calculated and saved in `symptoms_counts_output.csv`. Then the VAERS_IDs corresponding to the top-3 most frequent symptoms (**headache, fatigue, and pyrexia**) are selected and are used as the key for merging between different data frames gained from the 3 input CSV files. In other words, vaccine, symptoms and demographic information of the 3 selected symptoms for the two vaccines is joined together by matching VAERS_ID. The final processed data output file called `final_processed_data_output.csv` is used as the main input file for analysis later.


2. `project_counts_table.jl`

- Input file `final_processed_data_output.csv`
- Output file `updated_project_counts.csv`

  This Julia script tabulates the data and creates a formatted csv file that allows counts for different combinations of wanted categories. The data must have columns 2, 3, and 6 as adverse events, vaccine, and sex. This file first defines the main() function, which does data importing (defining variables), data cleaning, and plotting. There are three groups of variables to define for adverse events, vaccine, and sex. For each of these, the column, list of categories (reference in dataset), list of labels (reference in output csv file), and number of categories are defined. Then, the data is imported (the input file). The `Dict` (dictionary) is defined to keep track of counts. For every row, the key is taken as the entries found in the column according the column of the categories. The aforementioned array is saved as the CSV `updated_project_counts.csv` from the constructed table.
  

3. `vaers_eda.jl`

- Input file `final_processed_data_output.csv`
- Output file `grouped_percentages_output.csv` and barplots (`vax_F.png` and `vax_M.png`)

  The final processed data CSV file is loaded back into a dataframe and rows with unknown sex information are dropped. Then the counts of each sex-vaccine_manufacturer-symptom group are derived using groupby and combine. The sum of counts of symptoms for each sex-vaccine_manufacturer group is derived similarly. Afterwards, the percentages of symptoms are calculated by dividing the counts of each sex-vaccine_manufacturer-symptom group by the counts of corresponding sex-vaccine_manufacturer group. Finally, the percentages of symptoms for each vaccine manufacturer for females and males are plotted separately by sex in the format of barplot to identify the most at-risk populations in an intrinsic and straightforward way.


4. `bar_plots.jl`

- Data inputted manually from `updated_projects_counts.csv` and `grouped_percentages_output.csv`
- Output files: barplots (`Fatigue.png`, `FatiguePercents.png`, `Headache.png`, `HeadachePercents.png`, `Pyrexia.png`, `PyrexiaPercents.png`)

  This Julia script constructs two grouped barplots for each adverse event based on sex and vaccine manufacturer (six barplots total). It first creates a barplot using counts and then one using percents for each adverse event. 
  
  
5. `age_statistics.jl`
- Input file `final_processed_data_output.csv`
- Output files `age_dictionary_output.txt`, `age_output_min_max.txt`, `mean_age_output.txt`

    This Julia script is designed to create separate dictionaries for each of the 12 at-risk groups and record the ages of reporting individuals who meet the criteria for each dictionary.  At-risk groups are defined by sex, vaccine manufacturer, and reported adverse symptoms.  For this project, we are only looking at the vaccines manufactured by Pfizer and Moderna, and we are only looking at the top three most reported adverse events, which are fatigue, headache, and pyrexia.  Once the dictionaries are created, this script will read the input file line-by-line to determine what dictionary, if any, the individual fits into.  If the individual meets the criteria for that dictionary, the individual's age is added to that dictionary.  This process repeats until all lines of the input file have been read into the script.  Once this has ended, the script will output the entire contents of each dictionary into a text file, `age_dictionary_output.txt`.  Then, the statistics package is called upon to determine the minimum and maximum age in each of the dictionaries.  The results are printed on a text file, `age_output_min_max.txt`.  Finally, the script will compute the mean age in each of the dictionaries by using the keys and counts in the dictionaries.  The results are printed on a text file, `mean_age_output.txt`.  


6. `at_risk_group_plots.jl`
- Input file `final_processed_data_output.csv`
- Output files `fatigue_at_risk_plot.png`, `headache_at_risk_plot.png`, `pyrexia_at_risk_plot.png`

  This Julia script constructs 6 histograms from the preprocessed data (input file). Each output file contains 2 histograms and focuses on the ages of people who reported experiencing the top three most frequently observed adverse event symptoms. One of the histograms in each symptom-specific file shows the age distribution of everyone who reported that symptom, while the other histogram shows the age distribution of everyone who reported that symptom ***and*** is a member of the at-risk population that we identified for that symptom. The plots and output files are created in the function `atriskplots()` which is called in the Julia script; therefore, running the Julia script will produce all outputs.


7. `vaers_corr.py`

- Input file `final_processed_data_output.csv`
- Output file `corr_3_one-hot.png`

  The three primary factors (**sex, vaccine manufacturer, and symptom**) are selected from the `final_processed_data_output.csv` and are transformed into one-hot encoded features using pandas get_dummies function. Then the correlation matrix of these one-hot encoded features are calculated using the corr function and visualized in the format of heatmap using the seasborn package.


#### Extended Analysis - Onsite Interval

1. `vaers_onsite_preprocess.jl`

- Input files `2021VAERSDATA.csv` and `final_processed_data_output.csv`
- Output file `onsite_processed_data_output.csv`

   For onsite data analysis, a new processed data file is generated by merging the information of onsite interval (NUMDAYS) gained from `2021VAERSDATA.csv` into the dataframe of `final_processed_data_output.csv` using innerjoin on VAERS_IDs. This processed data output file called `onsite_processed_data_output.csv` is used as the main input file for analysis later.


2. `vaers_onsite_eda.jl`

- Input file `onsite_processed_data_output.csv`
- Output file `onsite_grouped_percentages_output.csv`

  Since most of the onsite intervals lie in the range of 0 to 2 days, the input processed data is filtered for onsite interval no greater than 2 days in the first place. Then the similar process is conducted for calculating counts and percentages of adverse events for each sex-onsite_interval group as what has been done in the primary analysis. The output counts and percentages are saved in `onsite_grouped_percentages_output.csv`.

  
3. `bar_plots_onsetdata.jl`

- Data inputted manually from `onsite_grouped_percentages_output.csv`
- Output files: barplots (`Fatigue_Onset.png`, `Fatigue_Onset_Percents.png`, `Fatigue_Onset_Vaccine.png`, `Fatigue_Onset_Vaccine_Percents.png`, `Headache_Onset.png`, `Headache_Onset_Percents.png`, `Headache_Onset_Vaccine.png`, `Headache_Onset_Vaccine_Percents.png`, `Pyrexia_Onset.png`, `Pyrexia_Onset_Percents.png`, `Pyrexia_Onset_Vaccine.png`, `Pyrexia_Onset_Vaccine_Percents.png`)
  
  This Julia script constructs four grouped barplots for the onset interval data for each adverse event (twelve barplots total). The code first creates barplots for each adverse event using counts and percentages based on sex, and then creates barplots using counts and percentages based on vaccine manufacturer. For all barplots, data is sourced from the output file noted above. 


4. `onset_time_visualizations.jl`
 
- Input file `onsite_processed_data_output.csv`
- Output file `onset_time_v_sex_and_manu.png`

  This Julia script constructs boxplots from the preprocessed data file that contains onset time intervals. In the first boxplot, sex is compared to onset time intervals, and in the second boxplot, vaccine manufacturer is compared to onset time intervals. Both boxplots are included in the same output file, which is created in the function `main()`, which is called in the Julia script. Running the Julia script will automatically produce the output.


5. `onset_statistics.jl`
- Input file `onsite_processed_data_output_1.csv`
- Output files `onset_dictionary_output.txt`, `onset_min_max_output.txt`, `onset_mean_output.txt`

  This Julia script is designed to create separate dictionaries for each of the 12 at-risk groups and record the onset interval of reporting individuals who meet the criteria for each dictionary.  At-risk groups are defined by sex, vaccine manufacturer, and reported adverse symptoms.  For this project, we are only looking at the vaccines manufactured by Pfizer and Moderna, and we are only looking at the top three most reported adverse events, which are fatigue, headache, and pyrexia.  The onset interval is the number of days between vaccination and start of the adverse event.  In the input file, the onset interval is named “NUMDAYS”.  Once the dictionaries are created, this script will read the input file line-by-line to determine what dictionary, if any, the individual fits into.  If the individual meets the criteria for that dictionary, the individual's onset interval is added to that dictionary.  This process repeats until all lines of the input file have been read into the script.  Once this has ended, the script will output the entire contents of each dictionary into a text file, `onset_dictionary_output.txt`.  Then, the statistics package is called upon to determine the minimum and maximum onset interval in each of the dictionaries.  The results are printed on a text file, `onset_min_max_output.txt`.  Finally, the script will compute the mean onset interval in each of the dictionaries by using the keys and counts in the dictionaries.  The results are printed on a text file, `onset_mean_output.txt`.  

6. `numdays_boxplots_scatterplots.jl`

- Input file `onsite_processed_data_output.csv`
- Output files `boxplot.png` and `scatter.png`

  This Julia script constructs 4 boxplots and 4 scatterplots. These plots display a sample over onset days vs age (in years). Columns 1, 3, 5, 6, and 9 are used (id, vaccine, age, sex, and onset days). The id column **must be unique** to each subject. The helper function is defined: `is_valid_numerical` and `main` routine. The `main` function (for data importing, data cleaning, and plotting) is defined and run. The data is imported (the input file). The plot options and coding are defined; labels for the plot are defined to map the name of the sex and vaccine. The plots are saved as boxplots and scatterplots with the customs plotting function, `make_plot`. `make_plot(plotfunc, plot_file, plot_title; pltopts...)` does the main job of plotting, given some data. First, it makes an array of plots to store the subplots to be created. It then goes through every combination of sex and vaccine, and going through the data, the row that matches the given combination of sex and vaccine are taken. The rows are discarded so every row has an unique id. The data was parsed row wise. A valid data row would have non-empty entries for age, onset, sex, vaccine. Vaccine and sex had to have a key in one of the codings. Invalid rows would be discarded. Using `savefig`, the plots  in the vector of plots are saved as a plot array in an image file called `plot_file`.
  
  The plots are created as follows:

```julia
    make_plot(boxplot, "boxplot.png", "Boxplot"; outliers=false)
    make_plot(scatter, "scatter.png", "Scatter Plot")
```

### Contributions
We would like to thank all group members for their hard work and dedication. Our contributions to this project are outlined below:

- Adeline Schwartz: `bar_plots.jl`, `Fatigue.png`, `FatiguePercents.png`, `Headache.png`, `HeadachePercents.png`, `Pyrexia.png`, `PyrexiaPercents.png`, `bar_plots_onsetdata.jl`, `Fatigue_Onset.png`, `Fatigue_Onset_Percents.png`, `Fatigue_Onset_Vaccine.png`, `Fatigue_Onset_Vaccine_Percents.png`, `Headache_Onset.png`, `Headache_Onset_Percents.png`, `Headache_Onset_Vaccine.png`, `Headache_Onset_Vaccine_Percents.png`, `Pyrexia_Onset.png`, `Pyrexia_Onset_Percents.png`, `Pyrexia_Onset_Vaccine.png`, `Pyrexia_Onset_Vaccine_Percents.png`
- Anusha Kumar: `project_counts_table.jl`, `updated_project_counts.csv`, `numdays_boxplots_scatterplots.jl`, `boxplot.png`, `scatter.png`
- Connor Thropp:`onset_dictionary_output.txt`, `onset_min_max_output.txt`, `onset_mean_output.txt`, `age_dictionary_output.txt`, `age_output_min_max.txt`, `mean_age_output.txt`, `age_statistics.jl`, `onset_statistics.jl`
- Lindsey Ross: `at_risk_group_plots.jl`, `fatigue_at_risk_plot.png`, `headache_at_risk_plot.png`, `pyrexia_at_risk_plot.png`, `onset_time_visualizations.jl`, `onset_time_v_sex_and_manu.png`
- Ziyin Li: `vaers_data_preprocess.jl`, `symptoms_counts_output.csv`, `final_processed_data_output.csv`, `vaers_eda.jl`, `grouped_percentages_output.csv`, `vax_F.png`, `vax_M.png`, `vaers_onsite_preprocess.jl`, `onsite_processed_data_output.csv`, `vaers_onsite_eda.jl`, `onsite_grouped_percentages_output.csv`, `vaers_corr.py`, and `corr_3_one-hot.png`


### Future Directions
This code was developed and run using the COVID-19 vaccine adverse event reports from 2021, but could also be used to analyze this data as it is produced in future years. More broadly, continuing to research the connection between adverse reactions to vaccines and at-risk populations will be possible using more powerful computational methods, such as machine learning. The findings from further research in this field will help improve vaccines, market them to a wider audience, and address feelings of vaccine hesitancy in the population. In turn, this will help the public make more informed decisions about their own safety and the safety of their peers.
