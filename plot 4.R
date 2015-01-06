x<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses = "character")
x$Date<-as.Date(x$Date,"%d/%m/%Y")

y<-x[x$Date=="2007-2-1" | x$Date=="2007-2-2",]

z<-strptime(paste(y[,1],y[,2]),"%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
plot(z,as.numeric(y$Global_active_power),type="l",
ylab="Global Active Power",xlab="")
plot(z,as.numeric(y$Voltage),type="l",
ylab="Voltage",xlab="datetime")
plot(z,as.numeric(y$Sub_metering_1),type="l",
ylab="Energy sub metering",xlab="")
lines(z,as.numeric(y$Sub_metering_2),col="red")
lines(z,as.numeric(y$Sub_metering_3),col="blue")
legend("topright", lty=1,col=c("black","red","blue"),
legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
plot(z,as.numeric(y$Global_reactive_power),type="l",
ylab="Global_reactive_power",xlab="datetime")

dev.copy(png,file="plot4.png")
dev.off