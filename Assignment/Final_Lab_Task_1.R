library(ggplot2)
dataset <- read.csv("F:/sem 11/IDS/Datascience/Assignment/USA Housing Dataset.csv")

print(dataset)
is.na(dataset)
Removeddataset<-na.omit(dataset)
Removeddataset
summary(Removeddataset)

unique(dataset$price)
unique(dataset$bedrooms)
unique(dataset$city)


Q1 <- quantile(dataset$price, 0.25)
Q3 <- quantile(dataset$price, 0.75)
IQR_value <- IQR(dataset$price)

lower_bound <- Q1 - 1.5 * IQR_value
upper_bound <- Q3 + 1.5 * IQR_value

dataset_no_outliers <- dataset[dataset$price >= lower_bound & dataset$price <= upper_bound, ]
summary(dataset_no_outliers$price)


PearsonCorrelation <- cor(dataset_no_outliers$price, dataset_no_outliers$bedrooms, method = "pearson")
print(PearsonCorrelation)

ggplot(dataset_no_outliers, aes(x = price, y = bedrooms)) +
  geom_point(color = "blue", size = 3, alpha = 0.7) +  
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  labs(
    title = "Scatter Plot: price vs. bedrooms",
    subtitle = paste("Pearson Correlation Coefficient:",PearsonCorrelation),
    x = "price",
    y = "bedrooms"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.3, size = 14, face = "bold"), 
    plot.subtitle = element_text(hjust = 0.5, size = 12) 
  )




dataset_no_outliers$bedrooms.category <- ifelse(dataset_no_outliers$bedrooms >= 1 & dataset_no_outliers$bedrooms <= 2, "Small",
                                    ifelse(dataset_no_outliers$bedrooms >= 3 & dataset_no_outliers$bedrooms <= 4, "Medium", 
                                           "Large"))


dataset_no_outliers$bedrooms.category <- as.factor(dataset_no_outliers$bedrooms.category)
summary(dataset_no_outliers$bedrooms.category)

anova <- aov(price ~ bedrooms.category, data = dataset_no_outliers)
summary(anova)

ggplot(dataset_no_outliers, aes(x = bedrooms.category, y = price, fill = bedrooms.category)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 12, outlier.size = 2) +
  stat_summary(fun = mean, geom = "point", shape = 20, size = 4, color = "blue", fill = "blue") +
  labs(
    title = "Boxplot of price by bedrooms",
    x = "bedrooms",
    y = "price"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 13),
  )



dataset_no_outliers$price.category <- ifelse(dataset_no_outliers$price >= 0 & dataset_no_outliers$price <= 482071, "lower",
                                    ifelse(dataset_no_outliers$price > 482071 & dataset_no_outliers$price <= 1165000, "higher", 
                                           "na"))

chiSQTable <- table(dataset_no_outliers$bedrooms.category, dataset_no_outliers$price.category)
chiSQTest <- chisq.test(chiSQTable)
print(chiSQTest)

chisq_df <- as.data.frame(chiSQTable)

ggplot(chisq_df, aes(x = Var1, y = Freq, fill = Var2)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(
    title = "Relationship Between price and bedrooms",
    x = "price",
    y = "Frequency",
    fill = "bedrooms"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 7)
  )

