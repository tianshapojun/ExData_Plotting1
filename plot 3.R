x<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses = "character")
x$Date<-as.Date(x$Date,"%d/%m/%Y")

y<-x[x$Date=="2007-2-1" | x$Date=="2007-2-2",]

z<-strptime(paste(y[,1],y[,2]),"%Y-%m-%d %H:%M:%S")
plot(z,as.numeric(y$Sub_metering_1),type="l",
ylab="Energy sub metering",xlab="")
lines(z,as.numeric(y$Sub_metering_2),col="red")
lines(z,as.numeric(y$Sub_metering_3),col="blue")
legend("topright", lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png")
dev.off