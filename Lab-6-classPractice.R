#importing csv file
irisDataSet<-read.csv("A:/IDS/DataScience/Iris.csv",header = TRUE, sep = ",")
irisDataSet
edit(irisDataSet)

vars <- c("SepalLengthCm","SepalWidthCm","PetalLengthCm","PetalWidthCm")
vars
head(irisDataSet)
head(irisDataSet[vars])