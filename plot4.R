plot4<-function()
{
  power<-read.csv("household_power_consumption.txt", sep=";", na.strings="?")
  power<-subset(power, subset=(Date == "1/2/2007" | Date == "2/2/2007"))
  dt<-strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
 
{
  attach(power)
  par(mfrow=c(2,2))
  
  plot(x=dt,y=power[,"Global_active_power"],type="l",ylab="Global Active Power(Kilowatts)",xlab="")

  plot(x=dt,y=power[,"Voltage"],type="l",ylab="Voltage",xlab="datetime")
  
  y1<-power[,"Sub_metering_1"]
  y2<-power[,"Sub_metering_2"]
  y3<-power[,"Sub_metering_3"]
  plot(dt,y1,type="l",col="black",ylab="Energy sub metering",xlab="")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1, col=c("black", "red", "blue"))
  lines(dt,y2,type="l",col="red")
  lines(dt,y3,type="l",col="blue")

  plot(x=dt,y=power[,"Global_reactive_power"],type="l",ylab="Golbal Reactive Power",xlab="datetime")
  
  
  dev.copy(png,file="plot4.png",height=480,width=480)
  dev.off()
}
}