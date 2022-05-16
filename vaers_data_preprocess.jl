
using DataFrames
using CSV

function main()
    # Note: set run_local to false when running on VNC
    run_local = true
    # define file names
    if run_local
        vaersvax = "./data/2021VAERSVAX.csv"
        vaerssymptoms = "./data/2021VAERSSYMPTOMS.csv"
        vaersdata = "./data/2021VAERSDATA.csv"
    else
        vaersvax = "/gpfs/data/biol1555/0_shared/0_data/vaers/2021VAERSVAX.csv"
        vaerssymptoms = "/gpfs/data/biol1555/0_shared/0_data/vaers/2021VAERSSYMPTOMS.csv"
        vaersdata = "/gpfs/data/biol1555/0_shared/0_data/vaers/2021VAERSDATA.csv"
    end

    # load 2021VAERSVAX.csv as dataframe called df_vax (vaccine info)
    df_vax = DataFrame(CSV.File(vaersvax))
    # filter for Covid-19 vaccines
    cov_vax = filter(:VAX_TYPE => n -> n==("COVID19"), df_vax)
    # filter for Moderna and Pfzier vaccines
    cov_vax = filter(:VAX_MANU => n -> (n==("MODERNA") || n==("PFIZER\\BIONTECH")), cov_vax)
    # select VAERS_ID and the column with vaccine brand
    cov_vax = cov_vax[:, [:VAERS_ID, :VAX_MANU]]
    cov_vax = unique(cov_vax)
    # get VAERS_IDs of the filtered dataframe
    cov_id = select(cov_vax, :VAERS_ID)

    # load 2021VAERSSYMPTOMS.csv as dataframe called df_symptoms (adverse events info)
    df_symptoms = DataFrame(CSV.File(vaerssymptoms))
    # inner join df_symptoms and cov_id to filter for adverse events of Moderna and Pfzier
    cov_symptoms = innerjoin(df_symptoms, cov_id, on = :VAERS_ID)
    # select VAERS_ID and all the symptoms columns
    cov_symptoms = cov_symptoms[:, [:VAERS_ID, :SYMPTOM1, :SYMPTOM2, :SYMPTOM3, :SYMPTOM4, :SYMPTOM5]]
    
    # stack the filtered dataframe (stack: wide-to-long) by symptom to have only one column for all the symptoms
    cov_symptoms_stacked = stack(cov_symptoms, Not(:VAERS_ID))
    # drop rows with missing values in symptoms
    cov_symptoms_stacked = dropmissing(cov_symptoms_stacked, :value)
    # count the occurences of each symptom and save the counts as a new column to a new dataframe called cov_symptoms_counts
    cov_symptoms_counts = combine(groupby(cov_symptoms_stacked, [:value]), nrow => :count)
    # sort the dataframe in reverse order to get top frequently occurred symptoms
    cov_symptoms_counts = sort(cov_symptoms_counts, :count, rev=true)
    # results: the top frequent symptoms are Headache, Fatigue, Pyrexia, Pain, Chills, Dizziness, Nausea, ...
    # output the resulted dataframe to a CSV file
    CSV.write("symptoms_counts_output.csv", cov_symptoms_counts)
    
    # filter for data of the top 3 frequent symptoms
    cov_top = filter(:value => n -> (n==("Headache") || n==("Fatigue") || n==("Pyrexia")), cov_symptoms_stacked)
    # get VAERS_IDs of the filtered dataframe
    cov_top_id = select(cov_top, :VAERS_ID)

    # load 2021VAERSDATA.csv as dataframe called df_demo (demographic info)
    df_demo = DataFrame(CSV.File(vaersdata))
    # select columns we want for demographic info
    df_demo = df_demo[:, [:VAERS_ID, :STATE, :AGE_YRS, :SEX, :RECOVD, :HISTORY]]
    # inner join df_demo and cov_top_id to filter for demographic info of people with the top 3 frequent adverse events after vaccinated with Moderna and Pfzier
    cov_top_demo = innerjoin(df_demo, cov_top_id, on = :VAERS_ID)
    # drop duplicated rows
    cov_top_demo = unique(cov_top_demo)

    # merge the corresponding vaccine info into the cov_top dataframe
    cov_top_final = innerjoin(cov_top, cov_vax, on = :VAERS_ID)
    # merge the corresponding demographic info into the dataframe
    cov_top_final = innerjoin(cov_top_final, cov_top_demo, on = :VAERS_ID)
    cov_top_final = select(cov_top_final, Not(:variable))
    cov_top_final = rename(cov_top_final, :value => :SYMPTOM)
    # output this final dataframe to a CSV file
    CSV.write("final_processed_data_output.csv", cov_top_final)
end

main()