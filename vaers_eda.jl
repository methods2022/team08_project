
using CSV
using DataFrames
using StatsPlots

# get grouped counts:
function grouped_counts()
    vaers = "final_processed_data_output.csv"
    df = DataFrame(CSV.File(vaers))
    # drop rows with unknown sex info (SEX is 'U')
    df = filter(:SEX => n -> (n==("F") || n==("M")), df)
    # calculate counts for each sex-vax-symptom group
    sex_vax_symp_counts = combine(groupby(df, [:SEX, :VAX_MANU, :SYMPTOM]), nrow => :count)
    CSV.write("grouped_counts_output.csv", sex_vax_symp_counts)
end

# grouped_counts()


using CSV
using DataFrames

# get grouped counts and percentages:
function grouped_percentages()
    # read the processed output csv into dataframe
    vaers = "final_processed_data_output.csv"
    df = DataFrame(CSV.File(vaers))
    # drop rows with unknown sex info (SEX is 'U')
    df = filter(:SEX => n -> (n==("F") || n==("M")), df)
    # calculate counts for each sex-vax-symptom group
    sex_vax_symp_counts = combine(groupby(df, [:SEX, :VAX_MANU, :SYMPTOM]), nrow => :count)
    # calculate counts for each sex-vax group
    sex_vax_counts = combine(groupby(df, [:SEX, :VAX_MANU]), nrow => :sum_count)
    # merge the two dataframes together (left join)
    grouped_counts = leftjoin(sex_vax_symp_counts, sex_vax_counts, on = [:SEX, :VAX_MANU])
    # calculate percentages of symptoms for each sex-vax-symptom group
    grouped_counts[!, :percentage] = grouped_counts.count ./ grouped_counts.sum_count
    # write dataframes to csv files
    CSV.write("grouped_counts_output.csv", sex_vax_symp_counts)
    CSV.write("sum_counts_by_symptom.csv", sex_vax_counts)
    CSV.write("grouped_percentages_output.csv", grouped_counts)
end

# grouped_percentages()


# generate grouped barplots for each sex using the percentages data:
function grouped_barplots()
    # read the percentages csv back into a dataframe
    fractions = "grouped_percentages_output.csv"
    df = DataFrame(CSV.File(fractions))

    # change group names for vaccine brand
    df.VAX_MANU .= replace.(df.VAX_MANU, "MODERNA" => "Moderna", "PFIZER\\BIONTECH" => "Pfizer")

    # generate grouped barplot for females
    df_F = filter(:SEX => n -> n==("F"), df)
    plot_F = @df df_F groupedbar(:VAX_MANU, :percentage, group=:SYMPTOM, bar_width=0.67, c=[:purple :skyblue :orange],
    lw=0, legend=:bottomright, xlabel="Vaccine brand", ylabel="Fraction of reports", 
    title = "Fraction of adverse events grouped by\nvaccine brand and symptom for females")
    # save plot
    savefig(plot_F, "vax_F.png")

    # generate grouped barplot for males
    df_M = filter(:SEX => n -> n==("M"), df)
    plot_M = @df df_M groupedbar(:VAX_MANU, :percentage, group=:SYMPTOM, bar_width=0.67, c=[:purple :skyblue :orange],
    lw=0, legend=:bottomright, xlabel="Vaccine brand", ylabel="Fraction of reports", 
    title = "Fraction of adverse events grouped by\nvaccine brand and symptom for males")
    # save plot
    savefig(plot_M, "vax_M.png")
end

grouped_barplots()

