install.packages("pROC")
library(pROC)

#ROC curve for Logistic Regression
roc_logit <- roc(loan_test$loan_status, loan_predict)

plot(roc_logit)

auc(roc_logit)
