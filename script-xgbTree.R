#teste co gridseach

install.packages('caTools')
install.packages('tidyverse')

install.packages('xgboost')     # for fitting the xgboost model

install.packages('caret')       # for general data preparation and model fitting

library(caTools)

library(xgboost)

library(caret)

library(tidyverse)



set.seed(10)

in_train <- createDataPartition(MaternalRisk$RiskLevel, p = 0.8,
                                list = FALSE)#adicionando na variavel in_train 70% 
## dos dados voltados para teste

maternal_train <- MaternalRisk[in_train, ]#atribui os 80% dos dados na varivael maternal_train 


maternal_test <- MaternalRisk[-in_train, ] # atribui o restante do valores do banco de dados na varivel     

#classifier <- train(form = RiskLevel ~ ., data = maternal_train, method = 'rf')
#classifier

train_control = trainControl(method = "cv", number = 5, search = "grid")


#### seguir para o aprendizado de máquina
set.seed(10)

gbmGrid <-  expand.grid(max_depth = c(3,4, 5, 6,7), 
                        nrounds = (1:10)*50,    # number of trees
                        # default values below
                        eta = 0.3,
                        gamma = 0,
                        subsample = 1,
                        min_child_weight = 1,
                        colsample_bytree = 0.6)

#model <- train(RiskLevel ~., maternal_train, method = "svmRadial" , tuneLength = 10 )#adicina na variavel model o treinamento  usando o metodo de treino svmRadial
#para com c em 128 e treino foi obtido a maior Accuracy de 0,7155933

model = train(RiskLevel ~., data = maternal_train, method = "xgbTree", trControl = train_control, tuneGrid = gbmGrid)

model
max(model$results$Accuracy)


cm <- confusionMatrix(predict(model, maternal_test[-ncol(maternal_test)]), as.factor(maternal_test$RiskLevel))
print(cm$overall[1])
print(cm)#resultado do teste!!

max(model$results$Accuracy)#mostra no console a accuracy máxima do treino!!
