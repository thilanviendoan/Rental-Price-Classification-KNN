install.packages("class")       # For KNN
install.packages("dplyr")       # For data manipulation
install.packages("ggplot2")     # For data visualization
install.packages("caret")       # For confusion matrix

# Load libraries
library(class)
library(dplyr)
library(ggplot2)
library(caret)
setwd('/Users/thilanviendoan/Downloads')
data <- read.csv("apartments_for_rent_classified_10K.csv", sep = ";", 
                 header = TRUE, stringsAsFactors = FALSE)
# View basic structure of the dataset
str(data)

# View a few rows of the dataset
head(data)

install.packages("tidyverse")
library(tidyr)
# Select key numerical columns
numerical_cols <- c('bathrooms', 'bedrooms', 'price', 
                    'square_feet', 'latitude', 'longitude')
# Drop rows with missing values 
df_cleaned <- data %>% drop_na(one_of(numerical_cols))
# Display the cleaned dataset 
head(df_cleaned)

# Install and load dplyr package
install.packages("dplyr")
library(dplyr)

# Create price segment (low, medium, high) based on price distribution
df_cleaned <- df_cleaned %>%
  mutate(price_segment = cut(price, 
                             breaks = quantile(price, probs = c(0, 0.33, 0.66, 1)), 
                             labels = c("low", "medium", "high"), 
                             include.lowest = TRUE))

# Check the new column
table(df_cleaned$price_segment)

# Split into training and testing sets
set.seed(123)
split_ratio <- 0.8
train_index <- sample(seq_len(nrow(df_cleaned)), size = split_ratio * nrow(df_cleaned))

# Training and testing datasets
X_train <- df_cleaned[train_index, c("square_feet", "bedrooms", "bathrooms")]
y_train <- df_cleaned[train_index, "price_segment"]

X_test <- df_cleaned[-train_index, c("square_feet", "bedrooms", "bathrooms")]
y_test <- df_cleaned[-train_index, "price_segment"]

# Check data types
str(X_train)
str(X_test)

# Convert columns to numeric if they are not
X_train <- X_train %>% mutate(across(everything(), as.numeric))
X_test <- X_test %>% mutate(across(everything(), as.numeric))

# Scale your data
X_train <- scale(X_train)
X_test <- scale(X_test)

# Remove problematic values
X_train[is.na(X_train) | is.infinite(X_train)] <- 0
X_test[is.na(X_test) | is.infinite(X_test)] <- 0

# Perform KNN with the cleaned dataset
y_pred <- knn(train = X_train, test = X_test, cl = y_train, k = 5)
# Print the predictions for the test set
print(y_pred)

# Create a confusion matrix
confusion_matrix <- confusionMatrix(as.factor(y_pred), as.factor(y_test))
print(confusion_matrix)

actual_segment_counts <- table(df_cleaned$price_segment)
df_counts <- as.data.frame(actual_segment_counts)
colnames(df_counts) <- c("Segment", "Count")

# Create bar chart with ggplot2
ggplot(df_counts, aes(x = Segment, y = Count, fill = Segment)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Count), vjust = -0.3, size = 3.5) +
  labs(title = "Apartment Distribution by Rental Price Segment", 
       x = "Price Segment", y = "Number of Apartments") +
  theme_minimal()

#Evaluate the Model: Precision, Recall, F1-Score
print(confusion_matrix$byClass)
