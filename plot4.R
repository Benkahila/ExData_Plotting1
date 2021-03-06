X <- read.csv("C:/Users/benkahila/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE , sep=";")
xs <-  subset(X, X$Date == "1/2/2007" | X$Date == "2/2/2007")

class(xs$Date)
class(xs$Time)
xs$Date <- as.Date(xs$Date, format="%d/%m/%Y")
xs$Time <- strptime(xs$Time, format="%H:%M:%S")
xs[1:1440,"Time"] <- format(xs[1:1440,"Time"],"2007-02-01 %H:%M:%S")
xs[1441:2880,"Time"] <- format(xs[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


par(mfrow=c(2,2))


with(xs,{
  plot(xs$Time,as.numeric(as.character(xs$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(xs$Time,as.numeric(as.character(xs$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(xs$Time,xs$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(xs,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(xs,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(xs,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(xs$Time,as.numeric(as.character(xs$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
