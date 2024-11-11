a<-c(1,2,5,3,7,-2)#vector
print(a)
max(a)
min(a)
mean(a)
sd(a) #standard deviation

name<-c("hello","world")
length(name)
nchar(name)
sort(a)
#order(a)
#order(a,decreasing=TRUE,na.last=TRUE)

sort(a,decreasing = TRUE)
p<-a[3]
print(p)

a[1:3]
a[c(1,3)]    #specific indexes

mymatrix<-matrix(1:20,nrow=5,ncol=4)
print(mymatrix)

mymatrix<-matrix(1:20,nrow=5,ncol=4,byrow = TRUE)
print(mymatrix)

mymatrix<-matrix(1:20,nrow=5,ncol=4,dimname=list(c('a','b','c','d','e'),c('e','f','g','h')))
print(mymatrix) #row col index name changed

print(mymatrix['a','g'])#specific index using name


rNames<-c('a','b','c','d','e')
cNames<-c('e','f','g','h')
cells<-c(1:20)
NewMatrix<-matrix(cells,nrow = length(rNames),ncol = length(cNames),dimnames = list(rNames,cNames))
print(NewMatrix)
print(NewMatrix['b','f'])
print(NewMatrix['b',])

NewArray<-array(1:24,c(2,3,2))
print(NewArray)

NewArray<-array(1:24,c(2,3,3))#array row, col, number of arrays
print(NewArray)

print(NewArray[1,4,1])#dont work


patientID<- c(1,2,3,4)
age<-c(25,34,28,52)
diabetes<-c("type1","type2","type1","type1")
status <- c("poor","improved", "excellent","poor")
patientdata<-data.frame(patientID,age,diabetes,status)
patientdata
#what kind of work can be done using data frames






