#importing csv file
irisDataSet<-read.csv("A:/IDS/DataScience/Iris.csv",header = TRUE, sep = ",")
irisDataSet
edit(irisDataSet)

irisDataSet[5:10,]

irisDataSet$Species

subset(irisDataSet,Species=="Iris-virginica")