### Load dataset
# Loading necessary librariesa
library(tidyverse)              # For data manipulation
library(rpart)                  # For decision tree modelling
library(rpart.plot)             # for visualizing decision trees  
library(caret)

# loading the dataset
titanic_train <- read.csv("https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv")


### Data Exploration
# Checking the structure
str(titanic_train)

# checking for missing values
colSums(is.na(titanic_train))


### Data Preprocessing
# Replacing missing Age with median
titanic_train$Age[is.na(titanic_train$Age)] <- median(titanic_train$Age, 
                                                      na.rm =TRUE)

#  Replacing missing Embarked values with most frequent category
titanic_train$Embarked[is.na(titanic_train$Embarked)] <- "S"

# Converting categorical variables to factors
titanic_train$Survived <- as.factor(titanic_train$Survived)
titanic_train$Pclass <- as.factor(titanic_train$Pclass)
titanic_train$Sex <- as.factor(titanic_train$Sex)
titanic_train$Embarked <- as.factor(titanic_train$Embarked)

# Select relevant features
titanic_data <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare, Embarked)


#### Splitting data into Training and Test sets
set.seed(123) 

# Creating train-test split
train_index <- createDataPartition(titanic_data$Survived, p = 0.8, list = FALSE)
train_data <- titanic_data[train_index, ]
test_data <- titanic_data[-train_index, ]


###$  BUilding the Decision Tree Model
tree_model <- rpart(Survived ~ ., data = train_data, method = "class")
## Visualizing the decision tree
rpart.plot(tree_model, type = 3, extra = 101, fallen.leaves = TRUE)

#### Evaluating the Model
## Prediction
predictions <- predict(tree_model, test_data, type = "class")

# Computing accuracy
confusion_matrix <- table(Predicted = predictions, 
                          Actual = test_data$Survived)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

# Printing results
print(confusion_matrix)
print(paste("Accuracy:", round(accuracy * 100, 2), "%"))

