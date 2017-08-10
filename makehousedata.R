# Download and unzip data

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists("household_power_consumption")) {
     print("Download Electric Power Comsumtion file (20,6 MB)")
     download.file(fileUrl, "./household_power_consumption")   
}
if (!file.exists("household_power_consumption.txt")) {
     print(paste("Unzip file in : ", getwd()))
     unzip("household_power_consumption")
}
# check is file exist in environment
if(!exists("householdpower") || !(identical(dim(householdpower), as.integer(c(2880, 8))))){
#read only days which will use in project
     print("Create data file ...")
     householdpower <- read.table("household_power_consumption.txt",
                                   sep = ";", 
                                   header = TRUE, 
                                   na.strings = "?")
     householdpower$Date <- as.Date(householdpower$Date, "%d/%m/%Y")
     householdpower <- householdpower[householdpower$Date >= "2007/02/01" 
                                   & householdpower$Date <= "2007/02/02", ]
#convert Date and Time variables to Data/Time classes
     householdpower$Date <- as.Date(householdpower$Date, "%Y/%m/%d")
     householdpower$DataTime <- strptime(paste(householdpower$Date, householdpower$Time), 
                                           format = "%Y-%m-%d %H:%M:%S")
#remove Data and Time columns
     householdpower$Date <- NULL
     householdpower$Time <- NULL
     householdpower <- subset(householdpower, select = c(DataTime, 1:7))
}

