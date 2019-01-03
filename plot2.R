X <- read.csv("C:/Users/benkahila/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE , sep=";")
xs <-  subset(X, X$Date == "1/2/2007" | X$Date == "2/2/2007")

class(xs$Date)
class(xs$Time)
xs$Date <- as.Date(xs$Date, format="%d/%m/%Y")
xs$Time <- strptime(xs$Time, format="%H:%M:%S")
xs[1:1440,"Time"] <- format(xs[1:1440,"Time"],"2007-02-01 %H:%M:%S")
xs[1441:2880,"Time"] <- format(xs[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
xs$Global_active_power <- as.numeric(as.character(xs$Global_active_power))
plot(xs$Time, xs$Global_active_power ,type="l" , xlab="" , 
     ylab="Global Active Power (kilowatts)")
