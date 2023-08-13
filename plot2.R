
file.choose()

doc <- unzip("exdata_data_household_power_consumption.zip")
df <- read.delim(doc, sep = ";")

df$Date <- as.Date(df$Date, '%d/%m/%Y')
df$DateTime <- strptime(paste(df$Date,df$Time), format = "%Y-%m-%d %H:%M:%S")

data <- subset(df, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))
data$Global_active_power <- as.numeric(data$Global_active_power)

with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n"))
axis(side = 1, at = c(as.numeric(data$DateTime[1]),
                      as.numeric(data$DateTime[1441]),
                      as.numeric(data$DateTime[2880])),labels = c("Thu","Fri","Sat"))

dev.copy(device = png, width = 480, height = 480, "plot2.png")

