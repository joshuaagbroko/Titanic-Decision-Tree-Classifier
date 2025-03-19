# Titanic-Decision-Tree-Classifier

A machine learning project using Decision Trees to predict Titanic survival rates. The model is trained on the Kaggle Titanic dataset, with hyperparameter tuning to improve performance.


## 📜 Dataset

    Source: Kaggle Titanic Dataset
    Target Variable: Survived (1 = Survived, 0 = Did not survive)
    Features:
        Pclass (Ticket class)
        Sex (Gender)
        Age (Age in years)
        SibSp (No. of siblings/spouses aboard)
        Parch (No. of parents/children aboard)
        Fare (Ticket price)
        Embarked (Port of Embarkation)
        FamilySize (New feature: SibSp + Parch + 1)

## 📊 Model Performance
Model	Accuracy
Initial Decision Tree	77.97%
Tuned Decision Tree (cp = 0.02)	79.1%


##  🔍 Future Improvements

    Try Random Forest or XGBoost
    Explore feature engineering (e.g., cabin deck, ticket prefixes)
    Test model performance with cross-validation
