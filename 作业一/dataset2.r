setwd("C:/Users/LogD/Desktop/数据挖掘课程作业")
filename1 = "./数据集/NFL Play by Play 2009-2017 (v4).csv"
filename2 = "./数据集/Building_Permits.csv"
data1 <- read.csv(filename1,header = T, sep = ',')
data2 <- read.csv(filename2,header = T, sep = ',')

numeric_name  <- c("Number.of.Existing.Stories","Number.of.Proposed.Stories","Estimated.Cost",
                   "Revised.Cost")
numeric_attr  <- data2[numeric_name]
write.csv(summary(numeric_attr),file="numeric.csv")
#缺失值处理
numeric_omitna <- na.omit(numeric_attr)
numeric_attr_mean <- numeric_attr
numeric_attr_median <- numeric_attr
numeric_attr_mean[is.na(numeric_attr$Number.of.Existing.Stories),
                  "Number.of.Existing.Stories"]=mean(numeric_attr$Number.of.Existing.Stories,na.rm = T)
write.csv(summary(numeric_attr_mean),file="numeric_mean.csv")
numeric_attr_median[is.na(numeric_attr$Number.of.Existing.Stories),
                    "Number.of.Existing.Stories"]=median(numeric_attr$Number.of.Existing.Stories,na.rm = T)
write.csv(summary(numeric_attr_median),file="numeric_median.csv")