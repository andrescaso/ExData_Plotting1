## Load the data
household <- read_delim("household_power_consumption.txt", 
                        ";", 
                        escape_double = FALSE, 
                        col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
                        na = "NA", 
                        trim_ws = TRUE)
## Subset the data
household <- subset(household, Date >= '2007-02-01' & Date <= '2007-02-02')

## Create and trasnsform Date and Time in a variable date/time class
library(lubridate)
datetime <- as_datetime(paste(household$Date, household$Time))
household <- cbind(household,datetime)

## Create Plot 4
paro <- par()
par(mfrow=c(2,2))

## Plot 1
with(household, 
     plot(datetime, Global_active_power, 
          type = "l", 
          ylab = "Global Active Power (Killowats)", 
          xlab = ""))

## Plot 2
with(household, 
     plot(datetime, Voltage, 
          type = "l", 
          ylab = "Voltage", 
          xlab = "Datetime"))

## Plot 3
with(household, 
     plot(datetime, Sub_metering_1, 
          type = "l",
          col = "black",
          ylab = "Global Active Power (Killowats)", 
          xlab = ""))
points(household$datetime, household$Sub_metering_2, 
       col = "red",
       type = "l")
points(household$datetime, household$Sub_metering_3, 
       col = "blue",
       type = "l")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       cex = 0.5,
       pch = "_")

## Plot 4
with(household, 
     plot(datetime, Global_reactive_power, 
          type = "l", 
          ylab = "Global_reactive_power", 
          xlab = "Datetime"))
dev.copy(png, file = "Plot_4.png", width=480, height=480)
dev.off()
par(paro)