#################################################################################################
##### Pull in data, keep only dates in question #################################################
#################################################################################################

setwd("C:/Users/Stephen/Documents/Johns Hopkins - Data Science Files/4. Exploratory Data Analysis/ExData_Plotting1")
library(data.table)
data <- fread("./household_power_consumption.txt")
data1 <- data[ which( data$Date == as.Date("01/02/2007") | data$Date == as.Date("02/02/2007")) , ]

#################################################################################################
##### Plot data as histogram, specify color and axises ##########################################
#################################################################################################

plot1 <- hist(as.numeric(data1$Global_active_power))

plot(plot1, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     xaxp= c(0,6,3),
     col = "red")

#################################################################################################
##### Export as png file ########################################################################
#################################################################################################


dev.copy(png, file="plot1.png",
         width=480, height=480)
dev.off()

