#Data Splitting into train and test data

set.seed(567)

#Row numbers for training set
index_train <- sample(1:nrow(loan2), 2/3 * nrow(loan2)) #2/3 of dataset

loan_train <- loan2[index_train, ]
loan_test <- loan2[-index_train, ]

#Logistic Regression Model

lr_loan <- glm(loan_status~ age + int_rate + grade + loan_amnt +
                 annual_inc, family = "binomial", data = loan_train )

summary(lr_loan)

loan_predict <- predict(lr_loan, loan_test, type = "response")
loan_predict
range(loan_predict)

#Cut off of 20%

lr_cutoff <- ifelse(loan_predict > 0.2, 1, 0)
lr_cutoff

#confusion Matrix
tab_cm <- table(loan_test$loan_status, lr_cutoff)

# Computing Accuracy
acc_logit <- sum(diag(tab_cm)) / nrow(loan_test)
acc_logit

