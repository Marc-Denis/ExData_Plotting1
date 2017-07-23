#Johns-Hopkins University on Coursera.org
#Data Science Specialisation - Course 4 - Exploratory Data Analysis
#Week 1 - Course Project

#Plot2.png building script

#Step 1 - Download the data and load it into a data frame
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip","curl")
unzip("data.zip")
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE, dec=".", colClasses="character")

#Step 2 - Convert the first column into a date format
hpc$Date<-strptime(hpc$Date,format="%d/%m/%Y")

#Step 3 - Subset the data set: only keep data from the 1st and 2nd Feburary
hpc_sub<-subset(hpc,((Date=="2007-02-01" | Date=="2007-02-02") & Global_active_power!='?'))
rm(hpc)

#Step 4 - Initialisation of the PNG file graphics device
png("plot2.png",480,480,"px")

#Step 5 - Creation of the required plot
plot(as.POSIXlt(paste(hpc_sub$Date,hpc_sub$Time)),as.numeric(hpc_sub$Global_active_power),type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Markers PLEASE NOTE! This exercice has been prepared on a computer with French regional settings.
#Hence, weekdays names appear in French instead of English.
#"jeu." (jeudi) = "Thu", "ven." (vendredi) = "Fri", "sam." (samedi) = "Sat"
#Apologies for any inconvenience this may cause. Thank you for your understanding.

#Step 6 - Closure of the graphics device
dev.off()