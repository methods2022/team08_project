using StatsPlots

function main()


    #Fatigue Counts by Sex 

    Female = [26456, 21127, 3060]
    Male = [7028, 7031, 1054]

    Fatigue_Counts = groupedbar(["Day 0", "Day 1", "Day 2"], [Female Male], label = ["Female" "Male"], xlabel = "Onset of Symptoms", ylabel = "Counts", title = "Onset of Fatigue based on Sex")
    plot!(legend=:outertopright)
    savefig(Fatigue_Counts, "Fatigue_Onset.png")

    #Fatigue Counts by Vaccine Manufacturer 
    Moderna = [17650, 14483, 1901]
    Pfizer = [15834, 13675, 2213]

    Fatigue_Counts_Vaccine = groupedbar(["Day 0", "Day 1", "Day 2"], [Moderna Pfizer], label = ["Moderna" "Pfizer"], xlabel = "Onset of Symptoms", ylabel = "Counts", title = "Onset of Fatigue based on Vaccine Manufacturer")
    plot!(legend=:outertopright)
    savefig(Fatigue_Counts_Vaccine, "Fatigue_Onset_Vaccine.png")

    #Headache Counts by Sex

    Female = [34047, 25434, 3278]
    Male = [8270, 7850, 1079]

    Headache_Counts = groupedbar(["Day 0", "Day 1", "Day 2"], [Female Male], label = ["Female" "Male"], xlabel = "Onset of Symptoms", ylabel = "Counts", title = "Onset of Headache based on Sex")
    plot!(legend=:outertopright)
    savefig(Headache_Counts, "Headache_Onset.png")

    #Headache Counts by Vaccine Manufacturer
    Moderna = [22073, 17073, 2008]
    Pfizer = [20244, 16211, 2349]

    Headache_Counts_Vaccine = groupedbar(["Day 0", "Day 1", "Day 2"], [Moderna Pfizer], label = ["Moderna" "Pfizer"], xlabel = "Onset of Symptoms", ylabel = "Counts", title = "Onset of Headache based on Vaccine Manufacturer")
    plot!(legend=:outertopright)
    savefig(Headache_Counts_Vaccine, "Headache_Onset_Vaccine.png")

    #Pyrexia Counts by Sex
    Female = [24271, 24037, 2249]
    Male = [7232, 8867, 1052]

    Pyrexia_Counts = groupedbar(["Day 0", "Day 1", "Day 2"], [Female Male], label = ["Female" "Male"], xlabel = "Onset of Symptoms", ylabel = "Counts", title = "Onset of Pyrexia based on Sex")
    plot!(legend=:outertopright)
    savefig(Pyrexia_Counts, "Pyrexia_Onset.png")

    #Pyrexia Counts by Vaccine Manufacturer
    Moderna = [18274, 17884, 1606]
    Pfizer = [13229, 15020, 1695]

    Pyrexia_Counts_Vaccine = groupedbar(["Day 0", "Day 1", "Day 2"], [Moderna Pfizer], label = ["Moderna" "Pfizer"], xlabel = "Onset of Symptoms", ylabel = "Counts", title = "Onset of Pyrexia based on Vaccine Manufacturer")
    plot!(legend=:outertopright)
    savefig(Pyrexia_Counts_Vaccine, "Pyrexia_Onset_Vaccine.png")

    #Fatigue Percentages by Sex

    Female = [0.31207, 0.299258, 0.356353]
    Male = [0.311940, 0.296067, 0.330926]

    Fatigue_Percents = groupedbar(["Day 0", "Day 1", "Day 2"], [Female Male], label = ["Female" "Male"], xlabel = "Onset of Symptoms", ylabel = "Percentages", title = "Onset of Fatigue based on Sex")
    plot!(legend=:outertopright)
    savefig(Fatigue_Percents, "Fatigue_Onset_Percents.png")

    #Fatigue Percentages by Vaccine Manufacturer
    Moderna = [0.304, 0.293, 0.345]
    Pfizer = [0.321, 0.305, 0.354]

    Fatigue_Percents_Vaccine = groupedbar(["Day 0", "Day 1", "Day 2"], [Moderna Pfizer], label = ["Moderna" "Pfizer"], xlabel = "Onset of Symptoms", ylabel = "Percents", title = "Onset of Fatigue based on Vaccine Manufacturer")
    plot!(legend=:outertopright)
    savefig(Fatigue_Percents_Vaccine, "Fatigue_Onset_Vaccine_Percents.png")

    #Headache Percentages by Sex 

    Female = [0.401621, 0.360265, 0.381740]
    Male = [0.367066, 0.330554, 0.338776]

    Headache_Percents = groupedbar(["Day 0", "Day 1", "Day 2"], [Female Male], label = ["Female" "Male"], xlabel = "Onset of Symptoms", ylabel = "Percentages", title = "Onset of Headache based on Sex")
    plot!(legend=:outertopright)
    savefig(Headache_Percents, "Headache_Onset_Percents.png")

    #Headache Percentages by Vaccine Manufacturer
    Moderna = [0.381, 0.345, 0.364]
    Pfizer = [0.411, 0.361, 0.375]

    Headache_Percents_Vaccine = groupedbar(["Day 0", "Day 1", "Day 2"], [Moderna Pfizer], label = ["Moderna" "Pfizer"], xlabel = "Onset of Symptoms", ylabel = "Percents", title = "Onset of Headache based on Vaccine Manufacturer")
    plot!(legend=:outertopright)
    savefig(Headache_Percents_Vaccine, "Headache_Onset_Vaccine_Percents.png")

    #Pyrexia Percentages by Sex 
    Female = [0.286302, 0.340477, 0.261908]
    Male = [0.320994, 0.373379, 0.330298]

    Pyrexia_Percents = groupedbar(["Day 0", "Day 1", "Day 2"], [Female Male], label = ["Female" "Male"], xlabel = "Onset of Symptoms", ylabel = "Percentages", title = "Onset of Pyrexia based on Sex")
    plot!(legend=:outertopright)
    savefig(Pyrexia_Percents, "Pyrexia_Onset_Percents.png")

    #Pyrexia Percentages by Vaccine Manufacturer
    Moderna = [0.315, 0.362, 0.291]
    Pfizer = [0.268, 0.334, 0.271]

    Pyrexia_Percents_Vaccine = groupedbar(["Day 0", "Day 1", "Day 2"], [Moderna Pfizer], label = ["Moderna" "Pfizer"], xlabel = "Onset of Symptoms", ylabel = "Percents", title = "Onset of Pyrexia based on Vaccine Manufacturer")
    plot!(legend=:outertopright)
    savefig(Pyrexia_Percents_Vaccine, "Pyrexia_Onset_Vaccine_Percents.png")


    println("this worked!")

end 

main()
