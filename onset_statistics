# Created by Connor Thropp
# Week 3 code
# Goal is to Calculate mean, min, and max onset days for each at risk group
# Onset is the days between vaccine and start of adverse event
# At risk groups are determine by sex, manufacturer, and adverse event-12 total at risk  groups
# Input file is a dataframe-CSV file




using Statistics
using CSV

function main()

    println("program is running \n")


    # Open input and output files
    input_file = open("/gpfs/data/biol1555/projects2022/team08/onsite_processed_data_output_1.csv", "r")  
    output_file_all_values = open("cthropp_dictionary_output_onset.txt", "w")
    output_file_min_max = open("cthropp_min_max_output_onset.txt", "w")  
    output_file_mean = open("cthropp_mean_output_onset.txt", "w")


    # Create dctionaries to count onsets in each at-risk group
    female_moderna_fatigue_dict = Dict()
    female_moderna_headache_dict = Dict()
    female_moderna_pyrexia_dict = Dict()

    male_moderna_fatigue_dict = Dict()
    male_moderna_headache_dict = Dict()
    male_moderna_pyrexia_dict = Dict()

    female_pfizer_fatigue_dict = Dict()
    female_pfizer_headache_dict = Dict()
    female_pfizer_pyrexia_dict = Dict()

    male_pfizer_fatigue_dict = Dict()
    male_pfizer_headache_dict = Dict()
    male_pfizer_pyrexia_dict = Dict()

    # start counting 
    line_count = 0
    
    # read line by line from input file
    for line in eachline(input_file)
        line_count += 1
        if line_count == 1
            continue
        end

        # split input file and extract sex, symptom, onset, and manfacturer
        line_part_array = split(line,",")
        sex = line_part_array[6]
        symptom = line_part_array[2]
        brand = line_part_array[3]
        onset_with_missing = line_part_array[8] # includes lines missing onset days
        
        #if onset is missing, skip
        if onset_with_missing == ""
            continue 
        else 
        # change onset to a float variable, need float to use in calculations 
            onset = parse(Float64, onset_with_missing)
        end
    
        # Key for letters used in code
        # F is female
        # M is male
        # MO is moderna 
        # PF is pfizer


     # start counting using dictionaries
        ## FEMALE MODERNA FATIGUE
        if sex == "F" && brand[1:2] == "MO" && symptom =="Fatigue"
            if onset == ""
                continue
            else
                if !haskey(female_moderna_fatigue_dict, onset)
                    female_moderna_fatigue_dict[onset] = 1
                else
                    female_moderna_fatigue_dict[onset] += 1
                end 
            end
    ## FEMALE MODERNA HEADACHE
        elseif sex == "F" && brand[1:2] == "MO" && symptom =="Headache"
            if onset == ""
                continue
            else
                if !haskey(female_moderna_headache_dict, onset)
                    female_moderna_headache_dict[onset] = 1
                else
                    female_moderna_headache_dict[onset] += 1
                end  
            end
        
    ## FEMALE MODERNA PYREXIA   
        elseif sex == "F" && brand[1:2] == "MO" && symptom =="Pyrexia"
            if onset == ""
                continue
            else
                if !haskey(female_moderna_pyrexia_dict, onset)
                    female_moderna_pyrexia_dict[onset] = 1
                else
                    female_moderna_pyrexia_dict[onset] += 1
                end
            end
        #######################################################################
    ## MALE MODERNA FATIGUE
        elseif sex == "M" && brand[1:2] == "MO" && symptom =="Fatigue"
            if onset ==""
                continue
            else
                if !haskey(male_moderna_fatigue_dict, onset)
                    male_moderna_fatigue_dict[onset] = 1
                else
                    male_moderna_fatigue_dict[onset] += 1
                end
            end 
    ## MALE MODERNA HEADACHE  
        elseif sex == "M" && brand[1:2] == "MO" && symptom =="Headache"
            if onset ==""
                continue
            else
                if !haskey(male_moderna_headache_dict, onset)
                    male_moderna_headache_dict[onset] = 1
                else
                    male_moderna_headache_dict[onset] += 1
                end 
            end
    ## MALE MODERNA PYREXIA
        elseif sex == "M" && brand[1:2] == "MO" && symptom =="Pyrexia"
            if onset ==""
                continue
            else
                if !haskey(male_moderna_pyrexia_dict, onset)
                    male_moderna_pyrexia_dict[onset] = 1
                else
                    male_moderna_pyrexia_dict[onset] += 1
                end
            end

            #############################################################################################   
    ## FEMALE PFIZER FATIGUE   
        elseif sex == "F" && brand[1:2] == "PF" && symptom =="Fatigue"
            if onset ==""
                continue
            else
                if !haskey(female_pfizer_fatigue_dict, onset)
                    female_pfizer_fatigue_dict[onset] = 1
                else
                    female_pfizer_fatigue_dict[onset] += 1
                end 
            end
    ## FEMALE PFIZER HEADACHE
        elseif sex == "F" && brand[1:2] == "PF" && symptom =="Headache"
            if onset ==""
                continue
            else 
                if !haskey(female_pfizer_headache_dict, onset)
                    female_pfizer_headache_dict[onset] = 1
                else
                    female_pfizer_headache_dict[onset] += 1
                end 
            end 
    ## FEMALE PFIZER PYREXIA
        elseif sex == "F" && brand[1:2] == "PF" && symptom =="Pyrexia"
            if onset ==""
                continue
            else
                if !haskey(female_pfizer_pyrexia_dict, onset)
                    female_pfizer_pyrexia_dict[onset] = 1
                else
                    female_pfizer_pyrexia_dict[onset] += 1
                end
            end

            #######################################################################
    ## MALE PFIZER FATIGUE    
        elseif sex == "M" && brand[1:2] == "PF" && symptom =="Fatigue"
            if onset ==""
                continue
            else
                if !haskey(male_pfizer_fatigue_dict, onset)
                    male_pfizer_fatigue_dict[onset] = 1
                else
                    male_pfizer_fatigue_dict[onset] += 1
                end 
            end

    ## MALE PFIZER HEADACHE
        elseif sex == "M" && brand[1:2] == "PF" && symptom =="Headache"
            if onset ==""
                continue
            else
                if !haskey(male_pfizer_headache_dict, onset)
                    male_pfizer_headache_dict[onset] = 1
                else
                    male_pfizer_headache_dict[onset] += 1
                end 
            end

    ## MALE PFIZER PYREXIA
        elseif sex == "M" && brand[1:2] == "PF" && symptom =="Pyrexia"
            if onset ==""
                continue
            else
                if !haskey(male_pfizer_pyrexia_dict, onset)
                    male_pfizer_pyrexia_dict[onset] = 1
                else
                    male_pfizer_pyrexia_dict[onset] += 1
                end
            end
        ######################################################
        else 
            continue
        end 
    end


    ## Print resutls to output file - counts are sorted
    print(output_file_all_values, "Results\n")
    print(output_file_all_values, "onset|COUNTS\n")

    print(output_file_all_values, "*****Counts for MODERNA_FEMALE_FATIGUE*****\n")
    for onset in sort(collect(keys(female_moderna_fatigue_dict)))
        print(output_file_all_values, "$onset|$(female_moderna_fatigue_dict[onset])\n")
    end

    print(output_file_all_values, "*****Counts for MODERNA_FEMALE_HEADACHE*****\n")
    for onset in sort(collect(keys(female_moderna_headache_dict)))
        print(output_file_all_values, "$onset|$(female_moderna_headache_dict[onset])\n")
    end

    print(output_file_all_values, "*****Counts for MODERNA_FEMALE_PYREXIA*****\n")
    for onset in sort(collect(keys(female_moderna_pyrexia_dict)))
        print(output_file_all_values, "$onset|$(female_moderna_pyrexia_dict[onset])\n")
    end
    ###############################################################################################

    print(output_file_all_values, "*****Counts for MODERNA_MALE_FATIGUE*****\n")
    for onset in sort(collect(keys(male_moderna_fatigue_dict)))
        print(output_file_all_values, "$onset|$(male_moderna_fatigue_dict[onset])\n")
    end

    print(output_file_all_values, "*****Counts for MODERNA_MALE_HEADACHE*****\n")
    for onset in sort(collect(keys(male_moderna_headache_dict)))
        print(output_file_all_values, "$onset|$(male_moderna_headache_dict[onset])\n")
    end

    print(output_file_all_values, "*****Counts for MODERNA_MALE_PYREXIA*****\n")
    for onset in sort(collect(keys(male_moderna_pyrexia_dict)))
        print(output_file_all_values, "$onset|$(male_moderna_pyrexia_dict[onset])\n")
    end

    #################################################################################################
    print(output_file_all_values, "*****Counts for PFIZER_FEMALE_FATIGUE*****\n")
    for onset in sort(collect(keys(female_pfizer_fatigue_dict)))
        print(output_file_all_values, "$onset|$(female_pfizer_fatigue_dict[onset])\n")
    end

    print(output_file_all_values, "*****Counts for PFIZER_FEMALE_HEADACHE*****\n")
    for onset in sort(collect(keys(female_pfizer_headache_dict)))
        print(output_file_all_values, "$onset|$(female_pfizer_headache_dict[onset])\n")
    end

    print(output_file_all_values, "*****Counts for PFIZER_FEMALE_PYREXIA*****\n")
    for onset in sort(collect(keys(female_pfizer_pyrexia_dict)))
        print(output_file_all_values, "$onset|$(female_pfizer_pyrexia_dict[onset])\n")
    end
    #############################################################################
    print(output_file_all_values, "*****Counts for PFIZER_MALE_FATIGUE*****\n")
    for onset in sort(collect(keys(male_pfizer_fatigue_dict)))
        print(output_file_all_values, "$onset|$(male_pfizer_fatigue_dict[onset])\n")
    end

    print(output_file_all_values, "*****Counts for PFIZER_MALE_HEADACHE*****\n")
    for onset in sort(collect(keys(male_pfizer_headache_dict)))
        print(output_file_all_values, "$onset|$(male_pfizer_headache_dict[onset])\n")
    end

    print(output_file_all_values, "*****Counts for PFIZER_MALE_PYREXIA*****\n")
    for onset in sort(collect(keys(male_pfizer_pyrexia_dict)))
        print(output_file_all_values, "$onset|$(male_pfizer_pyrexia_dict[onset])\n")
    end
###########################################################################################
    # Determine on and max number of onset days using the previously created dictionaries
    # Print results to outputfile
    print(output_file_min_max, "Min or max|at risk group| onset\n")
    print(output_file_min_max, "min|FEMALE_MODERNA_FATIGUE|")
    print(output_file_min_max, minimum(keys(female_moderna_fatigue_dict))) 
    print(output_file_min_max, "\nmax|FEMALE_MODERNA_FATIGUE|")
    print(output_file_min_max, maximum(keys(female_moderna_fatigue_dict)))

    print(output_file_min_max, "\nmin|FEMALE_MODERNA_HEADACHE|")
    print(output_file_min_max, minimum(keys(female_moderna_headache_dict))) 
    print(output_file_min_max, "\nmax|FEMALE_MODERNA_HEADACHE|")
    print(output_file_min_max, maximum(keys(female_moderna_headache_dict)))

    print(output_file_min_max, "\nmin|FEMALE_MODERNA_PYREXIA|")
    print(output_file_min_max, minimum(keys(female_moderna_pyrexia_dict))) 
    print(output_file_min_max, "\nmax|FEMALE_MODERNA_PYREXIA|")
    print(output_file_min_max, maximum(keys(female_moderna_pyrexia_dict)))

    #########################

    print(output_file_min_max, "\nmin|MALE_MODERNA_FATIGUE is|")
    print(output_file_min_max, minimum(keys(male_moderna_fatigue_dict))) 
    print(output_file_min_max, "\nmax|MALE_MODERNA_FATIGUE|")
    print(output_file_min_max, maximum(keys(male_moderna_fatigue_dict)))

    print(output_file_min_max, "\nmin|MALE_MODERNA_HEADACHE|")
    print(output_file_min_max, minimum(keys(male_moderna_headache_dict))) 
    print(output_file_min_max, "\nmax|MALE_MODERNA_HEADACHE|")
    print(output_file_min_max, maximum(keys(male_moderna_headache_dict)))

    print(output_file_min_max, "\nmin|MALE_MODERNA_PYREXIA|")
    print(output_file_min_max, minimum(keys(male_moderna_pyrexia_dict))) 
    print(output_file_min_max, "\nmax|MALE_MODERNA_PYREXIA|")
    print(output_file_min_max, maximum(keys(male_moderna_pyrexia_dict)))

    #####################

    print(output_file_min_max, "\nmin|FEMALE_PFIZER_FATIGUE|")
    print(output_file_min_max, minimum(keys(female_pfizer_fatigue_dict))) 
    print(output_file_min_max, "\nmax|FEMALE_PFIZER_FATIGUE|")
    print(output_file_min_max, maximum(keys(female_pfizer_fatigue_dict)))

    print(output_file_min_max, "\nmin|FEMALE_PFIZER_HEADACHE|")
    print(output_file_min_max, minimum(keys(female_pfizer_headache_dict))) 
    print(output_file_min_max, "\nmax|FEMALE_PFIZER_HEADACHE|")
    print(output_file_min_max, maximum(keys(female_pfizer_headache_dict)))

    print(output_file_min_max, "\nmin|FEMALE_PFIZER_PYREXIA|")
    print(output_file_min_max, minimum(keys(female_pfizer_pyrexia_dict))) 
    print(output_file_min_max, "\nmax|FEMALE_PFIZER_PYREXIA|")
    print(output_file_min_max, maximum(keys(female_pfizer_pyrexia_dict)))

    #########################

    print(output_file_min_max, "\nmin|MALE_PFIZER_FATIGUE|")
    print(output_file_min_max, minimum(keys(male_pfizer_fatigue_dict))) 
    print(output_file_min_max, "\nmax|MALE_PFIZER_FATIGUE|")
    print(output_file_min_max, maximum(keys(male_pfizer_fatigue_dict)))

    print(output_file_min_max, "\nmin|MALE_PFIZER_HEADACHE|")
    print(output_file_min_max, minimum(keys(male_pfizer_headache_dict))) 
    print(output_file_min_max, "\nmax|MALE_PFIZER_HEADACHE|")
    print(output_file_min_max, maximum(keys(male_pfizer_headache_dict)))

    print(output_file_min_max, "\nmin|MALE_PFIZER_PYREXIA|")
    print(output_file_min_max, minimum(keys(male_pfizer_pyrexia_dict))) 
    print(output_file_min_max, "\nmax|MALE_PFIZER_PYREXIA|")
    print(output_file_min_max, maximum(keys(male_pfizer_pyrexia_dict)))

    ##################################################################################

    ## Determine the mean value of onset days for each at risk group
    ## FMF is FEMALE MODERNA FATIGUE---- SEX BRAND SYMPTOM

    ## This section multiplies each onset by counts of that onset
    ## Then is determines the total number of counts
    ## Mean is calculated by dividing sum by number
    ## Output is printed to output for mean

    print(output_file_mean, "AT RISK GROUP | MEAN onset\n")

    sum_FMF = 0
    number_FMF = 0
    for onset in keys(female_moderna_fatigue_dict)
        sum_FMF += onset * female_moderna_fatigue_dict[onset]
        number_FMF += female_moderna_fatigue_dict[onset]
    end

    print(output_file_mean, "FEMALE_MODERNA_FATIGUE|")
    mean_FMF = round((sum_FMF / number_FMF); digits =2)
    print(output_file_mean, mean_FMF)

    sum_FMH = 0
    number_FMH = 0
    for onset in keys(female_moderna_headache_dict)
        sum_FMH += onset * female_moderna_headache_dict[onset]
        number_FMH+= female_moderna_headache_dict[onset]
    end
        
    print(output_file_mean, "\nFEMALE_MODERNA_HEADACHE|")
    mean_FMH = round((sum_FMH / number_FMH); digits =2)
    print(output_file_mean, mean_FMH)

    sum_FMP = 0
    number_FMP = 0
    for onset in keys(female_moderna_pyrexia_dict)
        sum_FMP += onset * female_moderna_pyrexia_dict[onset]
        number_FMP += female_moderna_pyrexia_dict[onset]
    end
        
    print(output_file_mean, "\nFEMALE_MODERNA_PYREXIA|")
    mean_FMP = round((sum_FMP / number_FMP); digits =2)
    print(output_file_mean, mean_FMP)

    sum_MMF = 0
    number_MMF = 0
    for onset in keys(male_moderna_fatigue_dict)
        sum_MMF += onset * male_moderna_fatigue_dict[onset]
        number_MMF += male_moderna_fatigue_dict[onset]
    end

    print(output_file_mean, "\nMALE_MODERNA_FATIGUE|")
    mean_MMF = round((sum_MMF / number_MMF); digits =2)
    print(output_file_mean, mean_MMF)

    sum_MMH = 0
    number_MMH = 0
    for onset in keys(male_moderna_headache_dict)
        sum_MMH += onset * male_moderna_headache_dict[onset]
        number_MMH += male_moderna_headache_dict[onset]
    end
        
    print(output_file_mean, "\nMALE_MODERNA_HEADACHE|")
    mean_MMH = round((sum_MMH / number_MMH); digits =2)
    print(output_file_mean, mean_MMH)

    sum_MMP = 0
    number_MMP = 0
    for onset in keys(male_moderna_pyrexia_dict)
        sum_MMP += onset * male_moderna_pyrexia_dict[onset]
        number_MMP += male_moderna_pyrexia_dict[onset]
    end
        
    print(output_file_mean, "\nMALE_MODERNA_PYREXIA|")
    mean_MMP = round((sum_MMP / number_MMP); digits =2)
    print(output_file_mean, mean_MMP)

    #########################
    sum_FPF = 0
    number_FPF = 0
    for onset in keys(female_pfizer_fatigue_dict)
        sum_FPF += onset * female_pfizer_fatigue_dict[onset]
        number_FPF += female_pfizer_fatigue_dict[onset]
    end

    print(output_file_mean, "\nFEMALE_PFIZER_FATIGUE|")
    mean_FPF = round((sum_FPF / number_FPF); digits =2)
    print(output_file_mean, mean_FPF)

    sum_FPH = 0
    number_FPH = 0
    for onset in keys(female_pfizer_headache_dict)
        sum_FPH += onset * female_pfizer_headache_dict[onset]
        number_FPH+= female_pfizer_headache_dict[onset]
    end
        
    print(output_file_mean, "\nFEMALE_PFIZER_HEADACHE|")
    mean_FPH = round((sum_FPH / number_FPH); digits =2)
    print(output_file_mean, mean_FPH)

    sum_FPP = 0
    number_FPP = 0
    for onset in keys(female_pfizer_pyrexia_dict)
        sum_FPP += onset * female_pfizer_pyrexia_dict[onset]
        number_FPP += female_pfizer_pyrexia_dict[onset]
    end
        
    print(output_file_mean, "\nFEMALE_PFIZER_PYREXIA|")
    mean_FPP = round((sum_FPP / number_FPP); digits =2)
    print(output_file_mean, mean_FPP)


    sum_MPF = 0
    number_MPF = 0
    for onset in keys(male_pfizer_fatigue_dict)
        sum_MPF += onset * male_pfizer_fatigue_dict[onset]
        number_MPF += male_pfizer_fatigue_dict[onset]
    end

    print(output_file_mean, "\nMALE_PFIZER_FATIGUE|")
    mean_MPF = round((sum_MPF / number_MPF); digits =2)
    print(output_file_mean, mean_MPF)

    sum_MPH = 0
    number_MPH = 0
    for onset in keys(male_pfizer_headache_dict)
        sum_MPH += onset * male_pfizer_headache_dict[onset]
        number_MPH+= male_pfizer_headache_dict[onset]
    end
        
    print(output_file_mean, "\nMALE_PFIZER_HEADACHE|")
    mean_MPH = round((sum_MPH / number_MPH); digits =2)
    print(output_file_mean, mean_MPH)

    sum_MPP = 0
    number_MPP = 0
    for onset in keys(male_pfizer_pyrexia_dict)
        sum_MPP += onset * male_pfizer_pyrexia_dict[onset]
        number_MPP += male_pfizer_pyrexia_dict[onset]
    end
        
    print(output_file_mean, "\nMALE_PFIZER_PYREXIA|") 
    mean_MPP = round((sum_MPP / number_MPP); digits =2)
    print(output_file_mean, mean_MPP)

    # End of program
    # close files

    close(output_file_all_values)
    close(output_file_min_max)
    close(output_file_mean)
   
















    println("program has ended. Check output files for results")


end


main()
