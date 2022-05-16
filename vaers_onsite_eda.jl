
using CSV
using DataFrames

# get grouped counts and percentages based on sex:
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

onsite_grouped_percentages()

