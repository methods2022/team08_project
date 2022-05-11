## BIOL1555 Final Project: Lindsey Ross's code ##
# Plotting age distributions for the 'at risk groups' we identified:
#   HEADACHE ~ FEMALE + PFIZER
#   PYREXIA ~ MALE + MODERNA
#   FATIGUE ~ FEMALE + PFIZER

using DataFrames, CSV, StatsPlots

# store the input file name
cleaned_data_csv = "/gpfs/data/biol1555/projects2022/team08/final_processed_data_output.csv"

function atrisk_plots()
    # convert dataset into a DataFrame
    vaers_df = DataFrame(CSV.File(cleaned_data_csv))
    # filter for females 
    female_df = filter(:SEX => n -> n==("F"), vaers_df)
    # filter for Pfizer
    fem_pfiz_df = filter(:VAX_MANU => n -> n==("PFIZER\\BIONTECH"), female_df)
    # filter for headache
    fem_pfiz_headache_df = filter(:SYMPTOM => n -> n==("Headache"), fem_pfiz_df)

    ## Construct Age Distribution for Headache High Risk Group ##
    head_atrisk_plot = @df fem_pfiz_headache_df histogram(
        :AGE_YRS, 
        bins=0:5:110, 
        normalize=:probability,
        title="Headache, Female, Pfizer Age Distribution",
        xlabel="Age (years)",
        ylabel="Proportion of Records",
        )

    head_df = filter(:SYMPTOM => n -> n==("Headache"), vaers_df)

    headache_age_dist = @df head_df histogram(
        :AGE_YRS, 
        bins=0:5:110, 
        normalize=:probability,
        title="Headache Age Distribution",
        xlabel="Age (years)",
        ylabel="Proportion of Records",
        fillcolor=:gray,
        )
    
    plot(head_atrisk_plot, headache_age_dist, layout=grid(2,1), legend=false)
    png("headache_at_risk_plot")

    # filter fem_pfiz_df for fatigue
    fem_pfiz_fatigue_df = filter(:SYMPTOM => n -> n==("Fatigue"), fem_pfiz_df)

    ## Construct Age Distribution for Fatigue High Risk Group ##
    fatigue_atrisk_plot = @df fem_pfiz_fatigue_df histogram(
        :AGE_YRS, 
        bins=0:5:110, 
        normalize=:probability,
        title="Fatigue, Female, Pfizer Age Distribution",
        xlabel="Age (years)",
        ylabel="Proportion of Records",
        fillcolor=:coral,
        )

    fatigue_df = filter(:SYMPTOM => n -> n==("Fatigue"), vaers_df)

    fatigue_age_dist = @df fatigue_df histogram(
        :AGE_YRS, 
        bins=0:5:110, 
        normalize=:probability,
        title="Fatigue Age Distribution",
        xlabel="Age (years)",
        ylabel="Proportion of Records",
        fillcolor=:gray,
        )

    plot(fatigue_atrisk_plot, fatigue_age_dist, layout=grid(2,1), legend=false)
    png("fatigue_at_risk_plot")
    
    # filter vaers_df for males, Moderna, and pyrexia
    male_df = filter(:SEX => n -> n==("M"), vaers_df)
    male_Mod_df = filter(:VAX_MANU => n -> n==("MODERNA"), male_df)
    male_Mod_pyrexia_df = filter(:SYMPTOM => n -> n==("Pyrexia"), male_Mod_df)

    ## Construct Age Distribution for Pyrexia High Risk Group ##
    pyrexia_atrisk_plot = @df male_Mod_pyrexia_df histogram(
        :AGE_YRS, 
        bins=0:5:110, 
        normalize=:probability,
        title="Pyrexia, Male, Moderna Age Distribution",
        xlabel="Age (years)",
        ylabel="Proportion of Records",
        fillcolor=:green,
        )

    pyrexia_df = filter(:SYMPTOM => n -> n==("Pyrexia"), vaers_df)

    pyrexia_age_dist = @df pyrexia_df histogram(
        :AGE_YRS,
        bins=0:5:110,
        normalize=:probability,
        fillcolor=:gray,
        title="Pyrexia Age Distribution",
        xlabel="Age (years)",
        ylabel="Proportion of Records",
        )

    plot(pyrexia_atrisk_plot, pyrexia_age_dist, layout=grid(2,1), legend=false)
    png("pyrexia_at_risk_plot")

end

atrisk_plots()
