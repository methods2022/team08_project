
using CSV
using DataFrames

# get grouped counts and percentages for sex:
function onsite_grouped_percentages()
    # read the onsite processed output csv into dataframe
    data = "onsite_processed_data_output.csv"
    df = DataFrame(CSV.File(data))
    # drop rows with unknown sex info (SEX is 'U')
    df = filter(:SEX => n -> (n==("F") || n==("M")), df)
    # restrict the onsite interval to no greater than 2 days
    df = filter(:NUMDAYS => n -> (n<=2), df)
    # calculate counts for each sex-nd-symptom group
    sex_nd_symp_counts = combine(groupby(df, [:SEX, :NUMDAYS, :SYMPTOM]), nrow => :count)
    # calculate counts for each sex-nd group
    sex_nd_counts = combine(groupby(df, [:SEX, :NUMDAYS]), nrow => :sum_count)
    # merge the two dataframes together (left join)
    grouped_counts = leftjoin(sex_nd_symp_counts, sex_nd_counts, on = [:SEX, :NUMDAYS])
    # calculate percentages of symptoms for each sex-nd-symptom group
    grouped_counts[!, :percentage] = grouped_counts.count ./ grouped_counts.sum_count
    # write dataframes to csv files
    CSV.write("onsite_grouped_counts_output.csv", sex_nd_symp_counts)
    CSV.write("onsite_sum_counts_by_symptom.csv", sex_nd_counts)
    CSV.write("onsite_grouped_percentages_output.csv", grouped_counts)
end

# onsite_grouped_percentages()

# get grouped counts and percentages for vaccine brand:
function onsite_grouped_percentages()
    # read the onsite processed output csv into dataframe
    data = "onsite_processed_data_output.csv"
    df = DataFrame(CSV.File(data))
    # drop rows with unknown sex info (SEX is 'U')
    df = filter(:SEX => n -> (n==("F") || n==("M")), df)
    # restrict the onsite interval to no greater than 2 days
    df = filter(:NUMDAYS => n -> (n<=2), df)
    # calculate counts for each vax-nd-symptom group
    vax_nd_symp_counts = combine(groupby(df, [:VAX_MANU, :NUMDAYS, :SYMPTOM]), nrow => :count)
    # calculate counts for each vax-nd group
    vax_nd_counts = combine(groupby(df, [:VAX_MANU, :NUMDAYS]), nrow => :sum_count)
    # merge the two dataframes together (left join)
    grouped_counts = leftjoin(vax_nd_symp_counts, vax_nd_counts, on = [:VAX_MANU, :NUMDAYS])
    # calculate percentages of symptoms for each vax-nd-symptom group
    grouped_counts[!, :percentage] = grouped_counts.count ./ grouped_counts.sum_count
    # write dataframes to csv files
    CSV.write("onsite_grouped_counts_vax.csv", vax_nd_symp_counts)
    CSV.write("onsite_sum_counts_by_symptom_vax.csv", vax_nd_counts)
    CSV.write("onsite_grouped_percentages_vax.csv", grouped_counts)
end

onsite_grouped_percentages()



using StatsPlots

# generate grouped barplots for each sex using the percentages data:
function grouped_barplots()
    # read the percentages csv back into a dataframe
    fractions = "grouped_percentages_output.csv"
    df = DataFrame(CSV.File(fractions))

    # change group names for vaccine brand
    df.VAX_MANU .= replace.(df.VAX_MANU, "MODERNA" => "Moderna", "PFIZER\\BIONTECH" => "Pfizer")

    # generate grouped barplot for females
    df_F = filter(:SEX => n -> n==("F"), df)
    plot_F = @df df_F groupedbar(:VAX_MANU, :count, group=:SYMPTOM, bar_width=0.67, c=[:purple :skyblue :orange],
    lw=0, legend=:bottomright, xlabel="Vaccine brand", ylabel="Fraction of reports", 
    title = "Fraction of adverse events grouped by\nvaccine brand and symptom for females")
    # save plot
    savefig(plot_F, "julia_plot_F.png")

    # generate grouped barplot for males
    df_M = filter(:SEX => n -> n==("M"), df)
    plot_M = @df df_M groupedbar(:VAX_MANU, :count, group=:SYMPTOM, bar_width=0.67, c=[:purple :skyblue :orange],
    lw=0, legend=:bottomright, xlabel="Vaccine brand", ylabel="Fraction of reports", 
    title = "Fraction of adverse events grouped by\nvaccine brand and symptom for males")
    # save plot
    savefig(plot_M, "julia_plot_M.png")
end

# grouped_barplots()