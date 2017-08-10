source("makehousedata.R")

par(mfrow = c(2,2))

#first plot on topleft with global active power 
plot(householdpower$DataTime, householdpower$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")
#second plot on top right with voltage
plot(householdpower$DataTime, householdpower$Voltage,
     type = "l",
     xlab = "datatime",
     ylab = "Voltage")
#third plot with sub metering 
plot(householdpower$DataTime, householdpower$Sub_metering_1, type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(householdpower$DataTime ,householdpower$Sub_metering_2, col = "red")
lines(householdpower$DataTime ,householdpower$Sub_metering_3, col = "blue")
legend(x = "topright" ,y = 0.92, col = c("black", "red", "blue"),
       legend = colnames(householdpower)[6:8],
       lty = c(1,1),
       bty = "n",
       cex = 0.4)
#last plot which show global reactive power
plot(householdpower$DataTime, householdpower$Global_reactive_power,
     type = "l",
     xlab = "datatime",
     ylab = "Global_reactive_power")
#create png file default width = 480, height = 480 and units is px
dev.copy(png, file = "plot4.png")
dev.off()