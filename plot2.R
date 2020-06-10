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

## Create Plot 2
with(household, 
     plot(datetime, Global_active_power, 
          type = "l", 
          ylab = "Global Active Power (Killowats)", 
          xlab = ""))
dev.copy(png, file = "Plot_2.png")
dev.off()