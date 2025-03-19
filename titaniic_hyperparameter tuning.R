### Hyperparameter Tuning
# Tuning the complexity parameter (cp)
tuned_model <- rpart(Survived ~ ., data = train_data, 
                     method = "class", 
                     cp = 0.02)
# Viusualizing tuned tree
rpart.plot(tuned_model,type = 3, extra = 101, fallen.leaves = TRUE)

# Evaluating tuned model
predictions_tuned <- predict(tuned_model, test_data, type = "class")

confusion_matrix_tuned <- table(Predicted = predictions_tuned, 
                                Actual = test_data$Survived)
accuracy_tuned <- sum(diag(confusion_matrix_tuned)) / sum(confusion_matrix_tuned)

# Printing results
print(confusion_matrix_tuned)
print(paste("Accuracy:", round(accuracy_tuned * 100, 2), "%"))


### Further Tuning

## Feature Engineering
# Creating  anew family size feature(Sibsp + parch)
train_data$FamilySize <- train_data$SibSp + train_data$Parch + 1
test_data$FamilySize <- test_data$SibSp + test_data$Parch + 1


## Using information Gain (entropy) for better splits

tuned_model_entropy <- rpart(Survived ~ .,
                             data = train_data,
                             method = "class",
                             parms = list(split = "information"),
                             cp = 0.02)
rpart.plot(tuned_model_entropy, type = 3,
           extra = 101, 
           fallen.leaves = TRUE)
# Evaluating entropy tuned model
predictions_tuned_entropy <- predict(tuned_model_entropy, test_data, type = "class")

confusion_matrix_tuned_entropy <- table(Predicted = predictions_tuned_entropy, 
                                Actual = test_data$Survived)
accuracy_tuned_entropy <- sum(diag(confusion_matrix_tuned_entropy)) / sum(confusion_matrix_tuned_entropy)

# Printing results
print(confusion_matrix_tuned_entropy)
print(paste("Accuracy:", round(accuracy_tuned_entropy * 100, 2), "%"))

### Tuniing hyperparameters further 
tuned_model_advanced <- rpart(Survived ~ .,
                              data = train_data,
                              method = "class",
                              cp = 0.015,
                              minsplit = 20,
                              maxdepth = 5)

rpart.plot(tuned_model_advanced, type = 3,
           extra = 101, 
           fallen.leaves = TRUE)
# Evaluating entropy tuned model
predictions_tuned_advanced <- predict(tuned_model_advanced, test_data, type = "class")

confusion_matrix_tuned_advanced <- table(Predicted = predictions_tuned_advanced, 
                                        Actual = test_data$Survived)
accuracy_tuned_advanced <- 
  sum(diag(confusion_matrix_tuned_advanced)) / sum(confusion_matrix_tuned_advanced)

# Printing results
print(confusion_matrix_tuned_advanced)
print(paste("Accuracy:", round(accuracy_tuned_advanced * 100, 2), "%"))
