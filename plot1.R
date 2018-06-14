# Exploratory Data Analysis

# First week assingment

#######################

# Load libraries
library (data.table) #Fast and efficient big data sets tool
library (lattice)

# Load data set

ePower <- fread ("./household_power_consumption.txt", sep = ";", na.strings = "?")

# Format date and time
ePower [, Date := as.Date (Date, "%d/%m/%Y") ]

# Crop the dates under study ("2007-02-01" to "2007-02-02")

ePower <- ePower [ Date >= "2007-02-01" & Date <= "2007-02-02"]

ePower [, dateTime := paste (Date, Time, sep = " ")]

ePower <- as.data.frame (ePower)

ePower$dateTime <- as.POSIXct (ePower$dateTime, "%Y-%m-%d %H:%M:%S")

# Plot 1
png (file = "plot1.png")

with (ePower, hist (Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))

dev.off ()