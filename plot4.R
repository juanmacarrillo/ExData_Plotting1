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


# Plot 4
png (file = "plot4.png")

par (mfrow = c (2, 2))

with (ePower, plot (Global_active_power ~ dateTime, type = "l", col = "black", xlab = "", ylab = "Global Active Power"))

with (ePower, plot (Voltage ~ dateTime, type = "l", col = "black", xlab = "", ylab = "Voltage"))

with (ePower, plot (Sub_metering_1 ~ dateTime, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with (ePower, lines (Sub_metering_2 ~ dateTime, type = "l", col = "red"))
with (ePower, lines (Sub_metering_3 ~ dateTime, type = "l", col = "blue"))
legend ("topright", legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c ("black", "red", "blue"), lty = 1, bty = "n")

with (ePower, plot (Global_reactive_power ~ dateTime, type = "l", col = "black", xlab = ""))

dev.off ()