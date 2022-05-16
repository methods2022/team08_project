# This program was created by Connor Thropp
# Program name is cthropp_at_risk_age.jl
# Goal is to calculate mean, min, and max age for each at risk group

using CSV 
using Statistics

function main()

    println("program is running \n")


    # Open input and output files
    input_file = open("/gpfs/data/biol1555/projects2022/team08/final_processed_data_output.csv", "r")  
    output_file_all_values = open("/gpfs/data/biol1555/projects2022/team08/dictionary_results_all_values.txt", "w")
    output_file_min_max = open("/gpfs/data/biol1555/projects2022/team08/min_max.txt", "w")  
    output_file_mean = open("/gpfs/data/biol1555/projects2022/team08/mean.txt", "w")


    # Create dctionaries to count ages in each group
    # At risk groups are determined by age, brand, and symptom
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
    for line in eachline(input_file)
        line_count += 1
        if line_count == 1
            continue
        end
    # split input file and extract sex, symptom, age, and manfuc
        line_part_array = split(line,",")
        sex = line_part_array[6]
        symptom = line_part_array[2]
        age_with_missing = line_part_array[5]
        brand = line_part_array[3]

    # if age is missing, skip
        if age_with_missing == ""
            continue 
        else 
    # change age to a float variable - will be useful for calculations
            age = parse(Float64, age_with_missing)
        end
        
        
    # Determine at risk group for each individual 
    # Key for code
    # F is female
    # M is male
    # MO is moderna 
    # PF is pfizer
        
    ## FEMALE MODERNA FATIGUE
        if sex == "F" && brand[1:2] == "MO" && symptom =="Fatigue"
            if age == ""
                continue
            else
                if !haskey(female_moderna_fatigue_dict, age)
                    female_moderna_fatigue_dict[age] = 1
                else
                    female_moderna_fatigue_dict[age] += 1
                end 
            end
    ## FEMALE MODERNA HEADACHE
        elseif sex == "F" && brand[1:2] == "MO" && symptom =="Headache"
            if age == ""
                continue
            else
                if !haskey(female_moderna_headache_dict, age)
                    female_moderna_headache_dict[age] = 1
                else
                    female_moderna_headache_dict[age] += 1
                end  
            end
        
    ## FEMALE MODERNA PYREXIA   
        elseif sex == "F" && brand[1:2] == "MO" && symptom =="Pyrexia"
            if age == ""
                continue
            else
                if !haskey(female_moderna_pyrexia_dict, age)
                    female_moderna_pyrexia_dict[age] = 1
                else
                    female_moderna_pyrexia_dict[age] += 1
                end
            end
        #######################################################################
    ## MALE MODERNA FATIGUE
        elseif sex == "M" && brand[1:2] == "MO" && symptom =="Fatigue"
            if age ==""
                continue
            else
                if !haskey(male_moderna_fatigue_dict, age)
                    male_moderna_fatigue_dict[age] = 1
                else
                    male_moderna_fatigue_dict[age] += 1
                end
            end 
    ## MALE MODERNA HEADACHE  
        elseif sex == "M" && brand[1:2] == "MO" && symptom =="Headache"
            if age ==""
                continue
            else
                if !haskey(male_moderna_headache_dict, age)
                    male_moderna_headache_dict[age] = 1
                else
                    male_moderna_headache_dict[age] += 1
                end 
            end
    ## MALE MODERNA PYREXIA
        elseif sex == "M" && brand[1:2] == "MO" && symptom =="Pyrexia"
            if age ==""
                continue
            else
                if !haskey(male_moderna_pyrexia_dict, age)
                    male_moderna_pyrexia_dict[age] = 1
                else
                    male_moderna_pyrexia_dict[age] += 1
                end
            end

            #############################################################################################   
    ## FEMALE PFIZER FATIGUE   
        elseif sex == "F" && brand[1:2] == "PF" && symptom =="Fatigue"
            if age ==""
                continue
            else
                if !haskey(female_pfizer_fatigue_dict, age)
                    female_pfizer_fatigue_dict[age] = 1
                else
                    female_pfizer_fatigue_dict[age] += 1
                end 
            end
    ## FEMALE PFIZER HEADACHE
        elseif sex == "F" && brand[1:2] == "PF" && symptom =="Headache"
            if age ==""
                continue
            else 
                if !haskey(female_pfizer_headache_dict, age)
                    female_pfizer_headache_dict[age] = 1
                else
                    female_pfizer_headache_dict[age] += 1
                end 
            end 
    ## FEMALE PFIZER PYREXIA
        elseif sex == "F" && brand[1:2] == "PF" && symptom =="Pyrexia"
            if age ==""
                continue
            else
                if !haskey(female_pfizer_pyrexia_dict, age)
                    female_pfizer_pyrexia_dict[age] = 1
                else
                    female_pfizer_pyrexia_dict[age] += 1
                end
            end

            ########################################################################
    ## MALE PFIZER FATIGUE    
        elseif sex == "M" && brand[1:2] == "PF" && symptom =="Fatigue"
            if age ==""
                continue
            else
                if !haskey(male_pfizer_fatigue_dict, age)
                    male_pfizer_fatigue_dict[age] = 1
                else
                    male_pfizer_fatigue_dict[age] += 1
                end 
            end

    ## MALE PFIZER HEADACHE
        elseif sex == "M" && brand[1:2] == "PF" && symptom =="Headache"
            if age ==""
                continue
            else
                if !haskey(male_pfizer_headache_dict, age)
                    male_pfizer_headache_dict[age] = 1
                else
                    male_pfizer_headache_dict[age] += 1
                end 
            end

    ## MALE PFIZER PYREXIA
        elseif sex == "M" && brand[1:2] == "PF" && symptom =="Pyrexia"
            if age ==""
                continue
            else
                if !haskey(male_pfizer_pyrexia_dict, age)
                    male_pfizer_pyrexia_dict[age] = 1
                else
                    male_pfizer_pyrexia_dict[age] += 1
                end
            end
        ######################################################
        else 
            continue
        end 
    end


    ## Display the counts (sorted)
    print(output_file_all_values, "Results\n")
    print(output_file_all_values, "AGE|COUNTS\n")

    print(output_file_all_values, "*****Counts for MODERNA_FEMALE_FATIGUE*****\n")
    for age in sort(collect(keys(female_moderna_fatigue_dict)))
        print(output_file_all_values, "$age|$(female_moderna_fatigue_dict[age])\n")
    end

    print(output_file_all_values, "*****Counts for MODERNA_FEMALE_HEADACHE*****\n")
    for age in sort(collect(keys(female_moderna_headache_dict)))
        print(output_file_all_values, "$age|$(female_moderna_headache_dict[age])\n")
    end

    print(output_file_all_values, "*****Counts for MODERNA_FEMALE_PYREXIA*****\n")
    for age in sort(collect(keys(female_moderna_pyrexia_dict)))
        print(output_file_all_values, "$age|$(female_moderna_pyrexia_dict[age])\n")
    end
    ###############################################################################################

    print(output_file_all_values, "*****Counts for MODERNA_MALE_FATIGUE*****\n")
    for age in sort(collect(keys(male_moderna_fatigue_dict)))
        print(output_file_all_values, "$age|$(male_moderna_fatigue_dict[age])\n")
    end

    print(output_file_all_values, "*****Counts for MODERNA_MALE_HEADACHE*****\n")
    for age in sort(collect(keys(male_moderna_headache_dict)))
        print(output_file_all_values, "$age|$(male_moderna_headache_dict[age])\n")
    end

    print(output_file_all_values, "*****Counts for MODERNA_MALE_PYREXIA*****\n")
    for age in sort(collect(keys(male_moderna_pyrexia_dict)))
        print(output_file_all_values, "$age|$(male_moderna_pyrexia_dict[age])\n")
    end

    #################################################################################################
    print(output_file_all_values, "*****Counts for PFIZER_FEMALE_FATIGUE*****\n")
    for age in sort(collect(keys(female_pfizer_fatigue_dict)))
        print(output_file_all_values, "$age|$(female_pfizer_fatigue_dict[age])\n")
    end

    print(output_file_all_values, "*****Counts for PFIZER_FEMALE_HEADACHE*****\n")
    for age in sort(collect(keys(female_pfizer_headache_dict)))
        print(output_file_all_values, "$age|$(female_pfizer_headache_dict[age])\n")
    end

    print(output_file_all_values, "*****Counts for PFIZER_FEMALE_PYREXIA*****\n")
    for age in sort(collect(keys(female_pfizer_pyrexia_dict)))
        print(output_file_all_values, "$age|$(female_pfizer_pyrexia_dict[age])\n")
    end
    #############################################################################
    print(output_file_all_values, "*****Counts for PFIZER_MALE_FATIGUE*****\n")
    for age in sort(collect(keys(male_pfizer_fatigue_dict)))
        print(output_file_all_values, "$age|$(male_pfizer_fatigue_dict[age])\n")
    end

    print(output_file_all_values, "*****Counts for PFIZER_MALE_HEADACHE*****\n")
    for age in sort(collect(keys(male_pfizer_headache_dict)))
        print(output_file_all_values, "$age|$(male_pfizer_headache_dict[age])\n")
    end

    print(output_file_all_values, "*****Counts for PFIZER_MALE_PYREXIA*****\n")
    for age in sort(collect(keys(male_pfizer_pyrexia_dict)))
        print(output_file_all_values, "$age|$(male_pfizer_pyrexia_dict[age])\n")
    end


    #################################################################
    ## Find the minimum and maximum age in each group
    ## using Statistics
    ## print to output file for min/max
    print(output_file_min_max, "Min or max|at risk group| Age\n")
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

    ## Find the mean value for each at risk group
    ## FMF is FEMALE MODERNA FATIGUE
    ## SEX BRAND SYMPTOM
    ## This section multiplies each age by counts of that age
    ## Then is determines the total number of counts
    ## Mean is calculated by dividing sum by number
    ## Output is printed to output for mean

    print(output_file_mean, "AT RISK GROUP | MEAN AGE\n")

    sum_FMF = 0
    number_FMF = 0
    for age in keys(female_moderna_fatigue_dict)
        sum_FMF += age * female_moderna_fatigue_dict[age]
        number_FMF += female_moderna_fatigue_dict[age]
    end

    print(output_file_mean, "FEMALE_MODERNA_FATIGUE|")
    mean_FMF = round((sum_FMF / number_FMF); digits =2)
    print(output_file_mean, mean_FMF)

    sum_FMH = 0
    number_FMH = 0
    for age in keys(female_moderna_headache_dict)
        sum_FMH += age * female_moderna_headache_dict[age]
        number_FMH+= female_moderna_headache_dict[age]
    end
        
    print(output_file_mean, "\nFEMALE_MODERNA_HEADACHE|")
    mean_FMH = round((sum_FMH / number_FMH); digits =2)
    print(output_file_mean, mean_FMH)

    sum_FMP = 0
    number_FMP = 0
    for age in keys(female_moderna_pyrexia_dict)
        sum_FMP += age * female_moderna_pyrexia_dict[age]
        number_FMP += female_moderna_pyrexia_dict[age]
    end
        
    print(output_file_mean, "\nFEMALE_MODERNA_PYREXIA|")
    mean_FMP = round((sum_FMP / number_FMP); digits =2)
    print(output_file_mean, mean_FMP)

    sum_MMF = 0
    number_MMF = 0
    for age in keys(male_moderna_fatigue_dict)
        sum_MMF += age * male_moderna_fatigue_dict[age]
        number_MMF += male_moderna_fatigue_dict[age]
    end

    print(output_file_mean, "\nMALE_MODERNA_FATIGUE|")
    mean_MMF = round((sum_MMF / number_MMF); digits =2)
    print(output_file_mean, mean_MMF)

    sum_MMH = 0
    number_MMH = 0
    for age in keys(male_moderna_headache_dict)
        sum_MMH += age * male_moderna_headache_dict[age]
        number_MMH += male_moderna_headache_dict[age]
    end
        
    print(output_file_mean, "\nMALE_MODERNA_HEADACHE|")
    mean_MMH = round((sum_MMH / number_MMH); digits =2)
    print(output_file_mean, mean_MMH)

    sum_MMP = 0
    number_MMP = 0
    for age in keys(male_moderna_pyrexia_dict)
        sum_MMP += age * male_moderna_pyrexia_dict[age]
        number_MMP += male_moderna_pyrexia_dict[age]
    end
        
    print(output_file_mean, "\nMALE_MODERNA_PYREXIA|")
    mean_MMP = round((sum_MMP / number_MMP); digits =2)
    print(output_file_mean, mean_MMP)

    #########################
    sum_FPF = 0
    number_FPF = 0
    for age in keys(female_pfizer_fatigue_dict)
        sum_FPF += age * female_pfizer_fatigue_dict[age]
        number_FPF += female_pfizer_fatigue_dict[age]
    end

    print(output_file_mean, "\nFEMALE_PFIZER_FATIGUE|")
    mean_FPF = round((sum_FPF / number_FPF); digits =2)
    print(output_file_mean, mean_FPF)

    sum_FPH = 0
    number_FPH = 0
    for age in keys(female_pfizer_headache_dict)
        sum_FPH += age * female_pfizer_headache_dict[age]
        number_FPH+= female_pfizer_headache_dict[age]
    end
        
    print(output_file_mean, "\nFEMALE_PFIZER_HEADACHE|")
    mean_FPH = round((sum_FPH / number_FPH); digits =2)
    print(output_file_mean, mean_FPH)

    sum_FPP = 0
    number_FPP = 0
    for age in keys(female_pfizer_pyrexia_dict)
        sum_FPP += age * female_pfizer_pyrexia_dict[age]
        number_FPP += female_pfizer_pyrexia_dict[age]
    end
        
    print(output_file_mean, "\nFEMALE_PFIZER_PYREXIA|")
    mean_FPP = round((sum_FPP / number_FPP); digits =2)
    print(output_file_mean, mean_FPP)


    sum_MPF = 0
    number_MPF = 0
    for age in keys(male_pfizer_fatigue_dict)
        sum_MPF += age * male_pfizer_fatigue_dict[age]
        number_MPF += male_pfizer_fatigue_dict[age]
    end

    print(output_file_mean, "\nMALE_PFIZER_FATIGUE|")
    mean_MPF = round((sum_MPF / number_MPF); digits =2)
    print(output_file_mean, mean_MPF)

    sum_MPH = 0
    number_MPH = 0
    for age in keys(male_pfizer_headache_dict)
        sum_MPH += age * male_pfizer_headache_dict[age]
        number_MPH+= male_pfizer_headache_dict[age]
    end
        
    print(output_file_mean, "\nMALE_PFIZER_HEADACHE|")
    mean_MPH = round((sum_MPH / number_MPH); digits =2)
    print(output_file_mean, mean_MPH)

    sum_MPP = 0
    number_MPP = 0
    for age in keys(male_pfizer_pyrexia_dict)
        sum_MPP += age * male_pfizer_pyrexia_dict[age]
        number_MPP += male_pfizer_pyrexia_dict[age]
    end
        
    print(output_file_mean, "\nMALE_PFIZER_PYREXIA|") 
    mean_MPP = round((sum_MPP / number_MPP); digits =2)
    print(output_file_mean, mean_MPP)

   

    close(output_file_all_values)
    close(output_file_min_max)
    close(output_file_mean)
 
    println("Program has ended\n")
    println("Check output files for results \n")

end

main()
