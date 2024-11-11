#readline function

var1 = readline(prompt = "enter any value: ")
Var2= readline(prompt = "enter any number: ")

var2= as.integer(Var2)

print(var1)
print(var2)


#scan function
x = scan()
print(paste(x, "is best")) #paste for string and variable

d= scan(what = "")#not checked

#edit function
mydata<-data.frame(age=numeric(0),gender = character(0),weight = numeric(0))
mydata <- edit(mydata)

#csv file function
write.csv(mydata, "A:/IDS/DataScience/lab4Mydata.csv")

#importing csv file
irisDataSet<-read.csv("A:/IDS/DataScience/Iris.csv",header = TRUE, sep = ",")
irisDataSet
edit(irisDataSet)
