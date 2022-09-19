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

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

  plot(data2$Global_active_power~data2$Date2, 
       type="l", 
       ylab="Global Active Power (kilowatts)", 
       xlab="")
  
  
  plot(data2$Voltage~data2$Date2, 
       type="l", 
       ylab="Voltage (volt)", 
       xlab="")
  
  
  plot(data2$Sub_metering_1~data2$Date2, 
       type="l", 
       ylab="Global Active Power (kilowatts)", 
       xlab="")
  lines(data2$Sub_metering_2~data2$Date2,
        col='Red')
  lines(data2$Sub_metering_3~data2$Date2,
        col='Blue')
  legend("topright", 
         col=c("black", "red", "blue"), 
         lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  
  plot(data2$Global_reactive_power~data2$Date2, 
       type="l", 
       ylab="Global Reactive Power (kilowatts)",
       xlab="")


#################################################################################################
##### Export as png file ########################################################################
#################################################################################################

dev.copy(png, file="plot4.png",
         width=480, height=480)
dev.off()

