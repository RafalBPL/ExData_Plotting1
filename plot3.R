source("makehousedata.R")

#plot Energy sub metering
par(mfrow = c(1,1))
plot(householdpower$DataTime, householdpower$Sub_metering_1, type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(householdpower$DataTime ,householdpower$Sub_metering_2, col = "red")
lines(householdpower$DataTime ,householdpower$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       legend = colnames(householdpower)[6:8],
       lty = c(1,1))
#create png file default width = 480, height = 480 and units is px
dev.copy(png, file = "plot3.png")
dev.off()
