mydata <- read.csv('2002to2016Annual_Summary.csv',header=TRUE,na.strings=c("","-",NA))
msubdata <- read.csv('msubdata.csv',row.names = 1)
mysubdata <- as.matrix(msubdata)

mset <- read.table('b.txt')

myperiod <- read.table('subperiod.txt')

data <- read.table('vitalchart.txt')
names(data)[2] <- "Region"
data$Region <- as.factor(data$Region)
# subdata <- subset(mydata[,c(1,16,18)])
# library(doBy)
# csubdata <- summaryBy(Num_Customers_Affected ~ Began_Year + Event_Type, data = subdata,
#                      FUN = function(x){c(mean(x))})
# names(csubdata)[3]<-"m.Num"
# msubdata <- reshape(csubdata, timevar = "Event_Type", idvar = "Began_Year", direction = "wide")
# attr(msubdata, "row.names") <- msubdata$Began_Year
# msubdata <- msubdata[,-1]
# write.csv(msubdata,"D:/mxs92/Documents/Innovizo/app/msubdata.csv")


# subdata2 <- subset(mydata[,c(1,12)])
# csubdata2 <- table(subdata2)
# csubdata2[,2] <- substr(csubdata2[,2], 1, 6)
# a <- csubdata2[1:15,]
# b <- as.matrix(a)
# colnames(b) <- substr(colnames(b),1,15)
# write.table(b,"D:/mxs92/Documents/Innovizo/app/b.txt")

# subperiod <- subset(mydata[,c(6:10,12)])
# write.table(subperiod,"D:/mxs92/Documents/Innovizo/app/subperiod.txt")

# vital <- subset(mydata[,c(1,14,17,18)])
# library(doBy)
# vitalg <- summaryBy(Num_Customers_Affected + Demand_Loss_MW ~ Began_Year + NERC_Region, data = vital,
#                       FUN = function(x){c(mean(x))})
# names(vitalg)[3] <- "CustomerAffected"
# names(vitalg)[4] <- "DemandLossMW"
# write.table(vitalg,"D:/mxs92/Documents/Innovizo/app/vitalchart.txt")