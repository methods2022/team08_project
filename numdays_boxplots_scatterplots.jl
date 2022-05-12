# Imported Packages!
using Plots, StatsPlots

# Standard Lib Packages
using DelimitedFiles

"""
returns true if input is a number otherwise false, this is for validation
of numerical data since DelimitedFiles already 'parses the strings'.
"""
is_valid_numerical(_::Real) = true
is_valid_numerical(_) = false

function main()
    # getting data
    data_file_name = "/gpfs/data/biol1555/projects2022/team08/onsite_processed_data_output.csv"
    delimiter=','
    data, _ = readdlm(data_file_name, delimiter; header=true, quotes=true)
    rows = collect(eachrow(data))

    # plot options
    sex_labels = Dict("M"=>"Male","F"=>"Female")
    vax_labels = Dict("MODERNA"=>"Moderna","PFIZER\\BIONTECH"=>"Pfizer")

    sex_colors = Dict("M"=>:red,"F"=>:blue)
    vax_shapes = Dict("MODERNA"=>:+,"PFIZER\\BIONTECH"=>:x)

    plot_alpha = 0.3
    
    # writing variables for data of interest (these shouldn't change)
    age_col = 5
    onset_days_col = 9
    vax_col = 3
    sex_col = 6
    id_col = 1
    
    # filter by id since ids are unique to a person
    unique!(x -> x[id_col], rows)
    # go through each row and see if valid data,
    # if missing filter out.
    # This uses Julia's "do syntax"
    valid_rows = filter(rows) do row
        isvalid_age = is_valid_numerical(row[age_col])
        isvalid_onset = is_valid_numerical(row[onset_days_col])
        isvalid_sex = haskey(sex_labels, row[sex_col])
        isvalid_vax = haskey(vax_labels, row[vax_col])
        isvalid_age && isvalid_onset && isvalid_sex && isvalid_vax
    end 
    
    # helper function make_plot
    function make_plot(plotfunc, plot_file, plot_title; pltopts...)
        # start a list of plots
        ps = Plots.Plot[]

        # iterate through all combniations of sex and vax combos
        sex_vax_key_combos = Iterators.product(keys(sex_labels),keys(vax_labels))
        for (sex_key, vax_key) in sex_vax_key_combos
            # filter for rows that have the sex and the vax manu.
            sex_vax_rows = filter(valid_rows) do row
                row[sex_col] == sex_key && row[vax_col] == vax_key
            end
            # get the ages and onset
            ages = [r[age_col] for r in sex_vax_rows]
            onset_days = [r[onset_days_col] for r in sex_vax_rows]

            # get plot attr
            color = sex_colors[sex_key]
            shape = plotfunc == scatter ? vax_shapes[vax_key] : :auto
            title = "$(sex_labels[sex_key]) - $(vax_labels[vax_key])"

            p = plotfunc(onset_days, ages; 
                         color=color, markeralpha=plot_alpha, legend=false, shape=shape,
                         title=title, pltopts...
                        )
            # add x-axis label
            xaxis!(p, "Onset Days")
            xticks!(p, collect(minimum(onset_days):maximum(onset_days)))
            # add y-axis label
            yaxis!(p, "Age")

            # add plot to the overll list of plots
            push!(ps, p)
        end
        # save all the plots as one big plot with subplots
        savefig(plot(ps..., layout=length(ps)), plot_file)
    end
    
    # make the box plot (outliers are turned off, ie the outliers=true option
    # was passed to the "plotfunc" in make_plot)
    make_plot(boxplot, "boxplot.png", "Boxplot"; outliers=false)
    # make the scatter plot
    make_plot(scatter, "scatter.png", "Scatter Plot")
    
end

# run the module
main()

end # end module
