setwd("C:/Users/LogD/Desktop/数据挖掘课程作业")
filename1 = "./数据集/NFL Play by Play 2009-2017 (v4).csv"
filename2 = "./数据集/Building_Permits.csv"
data1 <- read.csv(filename1,header = T, sep = ',')
data2 <- read.csv(filename2,header = T, sep = ',')
attr_name <- c("Drive","sp","qtr","down","time","yrdln","ydstogo",
               "ydsnet","posteam","AirYards","YardsAfterCatch",
               "QBHit","desc")
basic_info <- data1[attr_name]
nominal_name <- c("Drive","sp","qtr","down","posteam","QBHit")
numeric_name  <- c("yrdln","ydstogo","ydsnet","AirYards","YardsAfterCatch")
nominal_attr <- basic_info[nominal_name]
Drive <- as.factor(nominal_attr$Drive)
sp <- as.factor(nominal_attr$sp)
qtr <- as.factor(nominal_attr$qtr)
down <- as.factor(nominal_attr$down)
QBHit <- as.factor(nominal_attr$QBHit)
nominal_attr_factor <- data.frame(Drive=Drive,sp=sp,qtr=qtr,down=down,QBHit=QBHit,posteam=nominal_attr$posteam)
numeric_attr  <- basic_info[numeric_name]
summary(nominal_attr_factor,maxsum= 100)
summary(numeric_attr)
write.csv(summary(numeric_attr),file="numeric.csv")
write.csv(summary(nominal_attr_factor,maxsum= 100),file="nominal.csv")

#缺失值处理
numeric_omitna <- na.omit(numeric_attr)
numeric_attr_mean <- numeric_attr
numeric_attr_median <- numeric_attr
numeric_attr_mean[is.na(numeric_attr$yrdln),"yrdln"]=mean(numeric_attr$yrdln,na.rm = T)
write.csv(summary(numeric_attr_mean),file="numeric_mean.csv")
numeric_attr_median[is.na(numeric_attr$yrdln),"yrdln"]=median(numeric_attr$yrdln,na.rm = T)
write.csv(summary(numeric_attr_median),file="numeric_median.csv")