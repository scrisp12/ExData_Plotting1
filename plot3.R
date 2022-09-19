#################################################################################################
##### Pull in data, keep only dates in question #################################################
#################################################################################################

setwd("C:/Users/Stephen/Documents/Johns Hopkins - Data Science Files/4. Exploratory Data Analysis/ExData_Plotting1")
library(data.table)

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep =";",
                   na.strings = "?",
                   colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data1 <- data[ which( data$Date == "2007-02-01" | data$Date == "2007-02-02") , ]

#################################################################################################
##### create new column for date+time ###########################################################
#################################################################################################

Date2 <- as.POSIXct(paste(data1$Date,data1$Time))
data2 <- cbind(data1,Date2)

#################################################################################################
##### Plot data as histogram, specify color and axises ##########################################
#################################################################################################


plot(data2$Sub_metering_1~data2$Date2, 
     ylab = "Energy sub metering",
     type="l",
     xlab="")

lines(data2$Sub_metering_2~data2$Date2,
      col = "red")

lines(data2$Sub_metering_3~data2$Date2,
      col = "blue")

legend("topright", 
       col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=c(1,1,1))


#################################################################################################
##### Export as png file ########################################################################
#################################################################################################

dev.copy(png, file="plot3.png",
    width=480, height=480)
dev.off()

