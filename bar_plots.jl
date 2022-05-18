using StatsPlots

function main()


# Fatigue Counts 

Female = [35599, 32668]
Male = [11122, 10703]

Fatigue = groupedbar(["Moderna", "Pfizer/Biotech"], [Female Male], label = ["Female" "Male"], xlabel = "Vaccine Manufacturer" , ylabel = "Counts", title = "Fatigue Counts based on Sex and Vaccine") 
savefig(Fatigue, "Fatigue.png")

# Fatigue Percents 
Female = [0.311894, 0.324874]
Male = [0.308097, 0.321180]

Fatigue_Percents = groupedbar(["Moderna", "Pfizer/Biotech"], [Female Male], label = ["Female" "Male"], xlabel = "Vaccine Manufacturer" , ylabel = "Percents", title = "Fatigue Percents based on Sex and Vaccine") 
plot!(legend=:outertopright)
savefig(Fatigue_Percents, "FatiguePercents.png")

#Headache Counts 

Female = [41976, 39270]
Male = [11888, 11507]

Headache = groupedbar(["Moderna", "Pfizer/Biotech"], [Female Male], label = ["Female" "Male"], xlabel = "Vaccine Manufacturer" , ylabel = "Counts", title = "Headache Counts based on Sex and Vaccine") 
savefig(Headache, "Headache.png")

#Headache Percents 
Female = [0.367765, 0.390529]
Male = [0.329317, 0.345307]

Headache_Percents = groupedbar(["Moderna", "Pfizer/Biotech"], [Female Male], label = ["Female" "Male"], xlabel = "Vaccine Manufacturer" , ylabel = "Percents", title = "Headache Percents based on Sex and Vaccine") 
plot!(legend=:outertopright)
savefig(Headache_Percents, "HeadachePercents.png")

#Pyrexia 

Female = [36563, 28618]
Male = [13089, 11114]

Pyrexia = groupedbar(["Moderna", "Pfizer/Biotech"], [Female Male], label = ["Female" "Male"], xlabel = "Vaccine Manufacturer" , ylabel = "Counts", title = "Pyrexia Counts based on Sex and Vaccine") 
savefig(Pyrexia, "Pyrexia.png")

#Pyrexia Percents 
Female = [0.320340, 0.284598]
Male = [0.362586, 0.333513]

Pyrexia_Percents = groupedbar(["Moderna", "Pfizer/Biotech"], [Female Male], label = ["Female" "Male"], xlabel = "Vaccine Manufacturer" , ylabel = "Percents", title = "Pyrexia Percents based on Sex and Vaccine") 
plot!(legend=:outertopright)
savefig(Pyrexia_Percents, "PyrexiaPercents.png")

#Total Counts 

Female = [114138, 100556]
Male = [36099, 33324]
Total = groupedbar(["Moderna", "Pfizer/Biotech"], [Female Male], label = ["Female" "Male"], xlabel = "Vaccine Manufacturer" , ylabel = "Counts", title = "Total Sex Counts based on Vaccine Received")
savefig(Total, "Total.png")


println("this worked")


end 

main()