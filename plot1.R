source("makehousedata.R")

# make first histogram 
par(mfrow = c(1,1))
hist(householdpower$Global_active_power,
     col = "red",
     xlab = "Global Active Power (Kilowatts)",
     main = "Global Active Power")
#create png file default width = 480, height = 480 and units is px
dev.copy(png, file = "plot1.png")
dev.off()