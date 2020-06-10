## Load the data
setwd("C:/Andres/Teoria/Cursos/Data Science/Exploratory Data Analysis/ExData_Plotting1")
household <- read_delim("household_power_consumption.txt", 
                        ";", 
                        escape_double = FALSE, 
                        col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
                        na = "NA", getwd()
                        trim_ws = TRUE)
## Subset the data
library(lubridate)
household <- subset(household, Date >= '2007-02-01' & Date <= '2007-02-02')

## Create and trasnsform Date and Time in a variable date/time class
datetime <- as_datetime(paste(household$Date, household$Time))
household <- cbind(household,datetime)

## Create Plot 1

hist(household$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (Killowats)")
dev.copy(png, file = "Plot_1.png")
dev.off()