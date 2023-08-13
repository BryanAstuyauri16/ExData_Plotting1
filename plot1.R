
file.choose()

doc <- unzip("exdata_data_household_power_consumption.zip")
df <- read.delim(doc, sep = ";")

df$Date <- as.Date(df$Date, '%d/%m/%Y')
df$DateTime <- strptime(paste(df$Date,df$Time), format = "%Y-%m-%d %H:%M:%S")

data <- subset(df, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))
data$Global_active_power <- as.numeric(data$Global_active_power)

hist(data$Global_active_power, col = "red", xlab = "Gobal Active Power (kilowatts)", ylab = "Frequency", main="Global Active Power")

dev.copy(device = png, width = 480, height = 480, "plot1.png")

