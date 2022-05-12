#### PHP2561 Final Project: Anusha Kumar's code ####

# package for parsing the input file
using DelimitedFiles: readdlm, writedlm

# main program to run
function main()

    # input and output files
    input_file = "/gpfs/data/biol1555/projects2022/team08/final_processed_data_output.csv"
    output_file = "updated_project_counts.csv"

    # adverse effect column and categories and number of and table labels
    sym_col = 2 
    sym_cats = ["Fatigue", "Headache", "Pyrexia"]
    sym_labs = sym_cats
    n_sym = length(sym_cats)
    # vaccine column and categories and number of and table labels
    vac_col = 3
    vac_cats = ["MODERNA", "PFIZER\\BIONTECH"]
    vac_labs = ["Moderna", "Pfizer"]
    n_vac = length(vac_cats)
    # sex column and categories and number of and table labels
    sex_col = 6
    sex_cats = ["F","M"]
    sex_labs = ["Female","Male"]
    n_sex = length(sex_cats)

    # category counts is a dictionary that keeps track of all possible combinations of the
    # categories. For example, one combination is ("Fatigue", "Moderna", "Female")
    # The category combinations are made with Julia's product function.
    category_combinations = Iterators.product(sym_cats, vac_cats, sex_cats)
    category_counts = Dict(cp => 0 for cp in category_combinations)

    # using DelimitedFiles to read in data and header.
    delimiter = ','
    has_header = true
    data, header = readdlm(input_file, delimiter; header=has_header)

    # iterate the rows of the data to count the instances of each category combination
    for row in eachrow(data)
        # using the column number we can create the key for the category_counts variable
        # which has to be a tuple of strings!
        row_cat = (row[sym_col], row[vac_col], row[sex_col])
        # We check here to see if the key in in the diction, otherwise we move on to the
        # next row
        if haskey(category_counts, row_cat)
            category_counts[row_cat] += 1
        end
    end

    # make an empty output table to fill.
    output_table = fill("",n_sym+2, n_sex*n_vac+2)

    # we reshape the counts to be the same shape as the numerical part of the table 
    count_array = reshape(
                          [category_counts[cp] for cp in category_combinations],
                          (n_sym, n_sex*n_vac)
                         )
    # now we add the counts to the table on the "bottom right"
    output_table[3:end, 3:end] = string.(count_array)

    # adding "Adverse Event" to the left of the table
    output_table[2+n_sym÷2+1,1] = "Adverse Event"

    # now add the adverse effects column header.
    output_table[3:end,2] = sym_labs
    
    # now adding the male and female header row
    output_table[1, 3:n_vac:end] = sex_labs
    
    # now adding the symptom column
    output_table[2, 3:3+n_vac-1] = vac_labs
    output_table[2, 3+n_vac:3+2*n_vac-1] = vac_labs

    # adding "Counts" to the top left of the table
    output_table[1,1] = "Counts"

    # using DelimitedFiles to write to a csv file, output_file.
    writedlm(output_file, output_table, delimiter)

end

# run main program!
main()
