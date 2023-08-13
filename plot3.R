
file.choose()

doc <- unzip("exdata_data_household_power_consumption.zip")
df <- read.delim(doc, sep = ";")

df$Date <- as.Date(df$Date, '%d/%m/%Y')
df$DateTime <- strptime(paste(df$Date,df$Time), format = "%Y-%m-%d %H:%M:%S")

data <- subset(df, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

with(data, plot(DateTime, Sub_metering_1, type = 'l', xaxt = "n"))
axis(side = 1, at = c(as.numeric(data$DateTime[1]),
                      as.numeric(data$DateTime[1441]),
                      as.numeric(data$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(data, lines(DateTime, Sub_metering_2, col = 'red'))
with(data, lines(DateTime, Sub_metering_3, col = 'blue'))

legend('topright', col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(device = png, width = 480, height = 480, "plot3.png")

