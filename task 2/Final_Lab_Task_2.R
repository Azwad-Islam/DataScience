library(ggplot2)
library(reshape2)
library(dplyr) 
library(scales)

dataset <- read.csv("F:/sem 11/IDS/Datascience/Assignment/USA Housing Dataset.csv")

Q1 <- quantile(dataset$price, 0.25)
Q3 <- quantile(dataset$price, 0.75)
IQR_value <- IQR(dataset$price)
lower_bound <- Q1 - 1.5 * IQR_value
upper_bound <- Q3 + 1.5 * IQR_value

dataset_no_outliers <- dataset[dataset$price >= lower_bound & dataset$price <= upper_bound, ]
filtered_data <- filter(dataset_no_outliers, bedrooms != 0)

Histogram_density_plot <- ggplot(filtered_data, aes(x = sqft_living)) +
  geom_histogram(aes(y = ..density..), binwidth = 200, fill = "skyblue", color = "black", alpha = 0.7) +
  geom_density(color = "red", size = 1) +
  labs(title = "Histogram and Density Plot of Square Footage of Living Area",
       x = "Square Footage of Living Area",
       y = "Density") +
  theme_minimal() + scale_y_continuous(labels = label_comma())
print(Histogram_density_plot)

attributes <- filtered_data[, c("price", "bedrooms")]
attributes$bedrooms <- as.factor(attributes$bedrooms)
data_long <- melt(attributes, id.vars = "bedrooms", variable.name = "Attribute", value.name = "Value")
violin <- ggplot(data_long, aes(x = bedrooms, y = Value, fill = bedrooms)) +
  geom_violin(alpha = 0.7, color = "black") +
  labs(title = "Violin Plot of House Price Grouped by Number of Bedrooms",
       x = "Number of Bedrooms",
       y = "Price",
       fill = "Bedrooms") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  scale_y_continuous(labels = label_comma())
print(violin)


scatter <- ggplot(attributes, aes(x = bedrooms, y = price, color = bedrooms)) +
  geom_jitter(alpha = 0.7, width = 0.2, height = 0.2) +
  labs(title = "Scatter Plot of House Price vs Number of Bedrooms",
       x = "Number of Bedrooms",
       y = "Price",
       color = "Bedrooms") +
  theme_minimal() + theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  scale_y_continuous(labels = label_comma())

print(scatter)

aggregated_data <- filtered_data %>%
  group_by(bedrooms) %>%
  summarise(Mean_Price = mean(price, na.rm = TRUE))
line_graph <- ggplot(aggregated_data, aes(x = bedrooms, y = Mean_Price)) +
  geom_line(color = "blue", size = 1) +        
  geom_point(color = "red", size = 3) +        
  labs(title = "Mean House Price vs Number of Bedrooms",
       x = "Number of Bedrooms",
       y = "Mean House Price") +
  theme_minimal() + scale_y_continuous(labels = label_comma())
print(line_graph)

