#importing csv file
irisDataSet<-read.csv("A:/IDS/DataScience/Iris.csv",header = TRUE, sep = ",")
irisDataSet
edit(irisDataSet)

irisDataSet[5:10,]

irisDataSet$Species

subset(irisDataSet,Species=="Iris-virginica")
subset(irisDataSet,PetalLengthCm>=6)
subset(irisDataSet,Species=="Iris-virginica" & PetalLengthCm>=6)

#Library install
#install.packages("dplyr")
#libraryLoad
#library(dplyr)

stats<-data.frame(player=c('A','B','C','D','A','A'),runs=c(100,200,408,19,56,100),wickets=c(17,20,NA,5,2,17))
filter(stats,runs>100)
print(stats)
#remove duplicate rows
distinct(stats)

#remove duplicate based on column
distinct(stats,player, .keep_all=TRUE)

#ordered
arrange(stats,runs)

#fetch column
select(stats,player,wickets)

#renaming the column
rename(stats,runs_scored=runs)

#new column
mutate(stats,avg=runs/4)

#drop all and create a new column
transmute(stats,avg=runs/4)

#summarize
summarize(stats, sum(runs),mean(runs))

#normalizing Iris dataset

normalized_data_Iris <- irisDataSet %>%
mutate(across(c(SepalLengthCm,SepalWidthCm,PetalLengthCm,PetalWidthCm), ~ (. - mean(.)) / max(.)))

mutate(across(2:5, ~ (. - mean(.)) / max(.)))

print(normalized_data_Iris)


# Basic Min-Max Normalization Function
normalize_data <- function(data, columns) {
  # Iterate over each column to normalize
  for (col in columns) {
    # Calculate min and max for each column
    col_min <- min(data[[col]], na.rm = TRUE)
    col_max <- max(data[[col]], na.rm = TRUE)
    
    # Apply Min-Max normalization formula
    data[[col]] <- (data[[col]] - col_min) / (col_max - col_min)
  }
  
  return(data)
}

# Example usage on the iris dataset
normalized_iris <- normalize_data(irisDataSet, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"))

# Print the normalized dataset
print(normalized_iris)
