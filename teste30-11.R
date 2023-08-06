install.packages('superml')
library('superml')

rf <- RFTrainer$new()
gst <-GridSearchCV$new(trainer = rf,
                       parameters = list(n_estimators = c(100),
                                         max_depth = c(5,2,10)),
                       n_folds = 3,
                       scoring = c('accuracy','auc'))
data("MaternalRisk")
gst$fit(MaternalRisk, "RiskLevel")
gst$best_iteration()

set.seed(123)
model <- train(RiskLevel ~., maternal_train,
               method = "" ,
               #tuneLength = 3 ,
               tuneGrid = expand.grid(iter = c(50:60)))

model

### Passo 1= testar os algoritmos com tuneLength = 3

###gbm_h2o == 75,20
#treebag === 75,82
#logicBag ==
#bartMachine =
#xgbTree == 70:30== 80,47,  80:20==== 82,50
#

## PASSO 2: Pegar os 3 maiores e testar com tuneLength = 10 - 20
# relata o que foi

####
# Quero classifcar o risco. Não conseguir usar o mesmo do cara q deu 97 pq ele nao disponibilioxu
# Como os resultados dele foram bons com arvore, vamos testar variações de árvores.
# O melhor que consegui foi X com o algoritmo Y.

#wsrf tune 10, 80:20 treino:0,7751, teste: 0,8069
#

set.seed(123)
model <- train(RiskLevel ~., maternal_train,
               method = "RRFglobal" ,
               tuneLength = 10 )
#model
model 
max(model$results$Accuracy)


cm <- confusionMatrix(predict(model, maternal_test[-ncol(maternal_test)]), as.factor(maternal_test$RiskLevel))
print(cm$overall[1])
print(cm)#resultado do teste!!

max(model$results$Accuracy)

