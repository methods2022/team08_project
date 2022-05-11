## BIOL1555 Final Project: Lindsey Ross code ##

using CSV, DataFrames, StatsPlots

# store the input file name
onset_processed_data_filename = "/gpfs/data/biol1555/projects2022/team08/onsite_processed_data_output_1.csv"

function main()
    # convert dataset into a DataFrame
    onset_df = DataFrame(CSV.File(onset_processed_data_filename))
    # drop missing values
    all_onset_df = dropmissing(onset_df)
    # remove unknown sex
    onset_clean_df = filter(:SEX => n -> (n==("F") || n==("M")), all_onset_df)
    # remove unreasonable onset times, i.e. anything > 3 days
    onset_clean_filtered_df = filter(:NUMDAYS => n -> (n <= 3), onset_clean_df)
    # rename the vaccine manufacturers and sex names to improve readability
    replace!(onset_clean_filtered_df.VAX_MANU, "PFIZER\\BIONTECH" =>  "Pfizer")
    replace!(onset_clean_filtered_df.VAX_MANU, "MODERNA" => "Moderna")

    ## Produce Boxplot of Onset Time by Sex ##
    age_v_onset_box = @df onset_clean_filtered_df boxplot(
        :SEX, 
        :NUMDAYS,
        title="Onset by Sex",
        xlabel="Sex",
        ylabel="Onset Time (days)",
        color="red"
        )

    ## Produce Boxplot of Onset Time by Vax Manufacturer ##
    manu_v_onset_box = @df onset_clean_filtered_df boxplot(
        :VAX_MANU, 
        :NUMDAYS,
        title="Onset by Manufacturer",
        xlabel="Vaccine Manufacturer",
        ylabel="Onset Time (days)",
        color="blue"
    )

    #println(describe(onset_clean_filtered_df, :min, :q25, :median, :q75, :max))

    plot(age_v_onset_box, manu_v_onset_box, layout=grid(1,2), legend=false)
    png("onset_time_v_sex_and_manu")

end

main()
