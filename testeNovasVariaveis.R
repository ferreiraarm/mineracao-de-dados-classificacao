library(FSelector)
library(rJava)

cfs(RiskLevel ~., MaternalRisk)

relief(RiskLevel ~., MaternalRisk)#verificar as variaveis atrave´s da menor até a maior, testando uma variavel e adiconando as demais do menor para o maior
chi.squared(RiskLevel ~., MaternalRisk)






maternal_train <- MaternalRisk[in_train, c("SystolicBP","BS", "RiskLevel") ]#atribui os 70% dos dados na varivael maternal_train 

maternal_test <- MaternalRisk[-in_train,c("SystolicBP","BS", "RiskLevel") ] # atribui o restante do valores do banco de dados na varivel                                        #maternal_test

#mostra no console as amostras, os 70% para teste e 30% para treino
str(maternal_train)

str(maternal_test)

str(maternal_test$RiskLevel)

#### seguir para o aprendizado de máquina
set.seed(10)
#LMT
model <- train(RiskLevel ~., maternal_train, method = "LMT" , tuneLength = 10 )#adicina na variavel model o treinamento  usando o metodo de treino svmRadial
#para com c em 128 e treino foi obtido a maior Accuracy de 0,7155933

model



cm <- confusionMatrix(predict(model, maternal_test[-ncol(maternal_test)]), as.factor(maternal_test$RiskLevel))

print(cm$overall[1])

print(cm)#resultado do teste!!

max(model$results$Accuracy)#mostra no console a accuracy máxima do treino!!

