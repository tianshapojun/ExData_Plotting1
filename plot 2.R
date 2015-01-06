x<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses = "character")
x$Date<-as.Date(x$Date,"%d/%m/%Y")

y<-x[x$Date=="2007-2-1" | x$Date=="2007-2-2",]

z<-strptime(paste(y[,1],y[,2]),"%Y-%m-%d %H:%M:%S")
plot(z,as.numeric(y$Global_active_power),type="l",
ylab="Global Active Power(kilowatts)",xlab="")

dev.copy(png,file="plot2.png")
dev.off