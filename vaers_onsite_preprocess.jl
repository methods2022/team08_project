
using DataFrames
using CSV

function main()
    # read the original VAERS data csv into dataframe
    vaersdata = "/gpfs/data/biol1555/0_shared/0_data/vaers/2021VAERSDATA.csv"
    df_num = DataFrame(CSV.File(vaersdata))
    # select columns
    df_num = df_num[:, [:VAERS_ID, :NUMDAYS]]
    # drop rows with missing values in num days
    df_num = dropmissing(df_num, :NUMDAYS)

    # read the processed output csv into dataframe
    processed = "final_processed_data_output.csv"
    df = DataFrame(CSV.File(processed))
    # merge the two dataframes together (inner join)
    df_onsite = innerjoin(df, df_num, on = [:VAERS_ID])

    # filter for num days no greater than 10 days
    df_onsite = filter(:NUMDAYS => n -> n<=10, df_onsite)
    # write dataframe to csv file
    CSV.write("onsite_processed_data_output.csv", df_onsite)
end

main()


