source("makehousedata.R")

#plot Global Active Power consumption
par(mfrow = c(1,1))
plot(householdpower$DataTime, householdpower$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
#create png file default width = 480, height = 480 and units is px
dev.copy(png, file = "plot2.png")
dev.off()