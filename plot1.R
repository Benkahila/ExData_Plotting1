X <- read.csv("C:/Users/benkahila/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE , sep=";")
xs <-  subset(X, X$Date == "1/2/2007" | X$Date == "2/2/2007")
class(xs$Global_active_power)
xs$Global_active_power = as.numeric(as.character( xs$Global_active_power))
class(xs$Global_active_power)
 hist(xs$Global_active_power , col = "red" , 
      xlab = "Global active power (kilowattes)",main = "Global Active Power") 


 