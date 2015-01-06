x<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses = "character")
x$Date<-as.Date(x$Date,"%d/%m/%Y")

y<-x[x$Date=="2007-2-1" | x$Date=="2007-2-2",]

hist(as.numeric(y$Global_active_power),
xlab="Global Active Power(kilowatts)",
col="red",main="Global Active Power")

dev.copy(png,file="plot1.png")
dev.off


