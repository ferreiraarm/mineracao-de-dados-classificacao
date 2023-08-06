# install.packages("devtools")
library("devtools")
install_github("kassambara/factoextra")

library("factoextra")

?install_tensorflow




hist(MaternalRisk$Age, main = "Histograma de frequência de amostras coletadas", xlab = "Idade", ylab = "Frequência" )#cria um histograma da idade O histograma mostra a
#frequência em que as idades ocorrem, ou seja, 
#a frequência de idades de risco maior ou menor




# Contributions of variables to PC1 Cria um gráfico de barras mostrando a 
#porcentagem de contribuição pelas outras variáveis quantitativas.

res.pca <- prcomp(MaternalRisk[-ncol(MaternalRisk)])


fviz_contrib(res.pca, choice = "var")


# Color by cos2 values: quality on the factor map  gráfico que delimita 
#as variáveis das seguintes formas: As variáveis mais perto do círculo
#de correlações, melhor será sua representação no mapa de fatores,
#variáveis perto do centro do gráfico são menos importante para os primeiros
#componentes.
fviz_pca_var(res.pca, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
             repel = TRUE # Avoid text overlapping
)

#Cria uma matriz das biblioteca bar plot,
#que fornece um gráfico de correlação que suporta 
#a reordenação automática das variáveis e ajuda a detectar 
#padrões ocultos entre as variáveis através das cores.

library("corrplot")
corrplot(var$cos2, is.corr=FALSE)


#cria gráfico de individuos
fviz_pca_ind(res.pca, col.ind = "cos2", 
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE # Avoid text overlapping (slow if many points)
)

fviz_pca_ind(res.pca, pointsize = "cos2", 
             pointshape = 21, fill = "#E7B800",
             repel = TRUE # Avoid text overlapping (slow if many points)
)
#Os dois gráficos acima representam de 1 a 1014 individuos


# Create a random continuous variable of length 23,
# Same length as the number of active individuals in the PCA

#cria gráfico colorido de individuos pela idade
my.cont.var <-MaternalRisk$Age
# Color individuals by the continuous variable
fviz_pca_ind(res.pca, col.ind = my.cont.var,
             gradient.cols = c("blue", "yellow", "red", "green","magenta", " Black", " cyan"),
             legend.title = "Cont.Var")


#Cria um gráfico a partir da variavel qualitativa nominal, separando em classes
#por cor e figura geometrica
fviz_pca_ind(res.pca,
             geom.ind = "point", # show points only (nbut not "text")
             col.ind = MaternalRisk$RiskLevel, # color by groups
             palette = c("#00AFBB", "#E7B800", "#FC4E07","green","magenta", " Black", " cyan"),
             addEllipses = TRUE, # Concentration ellipses
             legend.title = "Risco"
)

#gráfico biplot
fviz_pca_biplot(res.pca, repel = TRUE,
                col.var = "#2E9FDF", # Variables color
                col.ind = "#696969"  # Individuals color
)


#gráfico biplot dos riscos
fviz_pca_biplot(res.pca, 
                col.ind = MaternalRisk$RiskLevel, palette = "jco", 
                addEllipses = TRUE, label = "var",
                col.var = "black", repel = TRUE,
                legend.title = "Species") 

#Gráfico PCA de contribuição com os riscos
fviz_pca_biplot(res.pca, 
                # Individuals
                geom.ind = "point",
                fill.ind = MaternalRisk$RiskLevel, col.ind = "black",
                pointshape = 21, pointsize = 2,
                palette = "jco",
                addEllipses = TRUE,
                # Variables
                alpha.var ="contrib", col.var = "contrib",
                gradient.cols = "RdYlBu",
                
                legend.title = list(fill = "Riscos", color = "Contrib",
                                    alpha = "Contrib")
)
#analise exploratoria para cima

table(MaternalRisk$RiskLevel) ##high risk 272  low risk 406  mid risk 336

library(caret)
set.seed(10)
in_train <- createDataPartition(MaternalRisk$RiskLevel, p = 0.8,
list = FALSE)#adicionando na variavel in_train 70% 
              ## dos dados voltados para teste


length(in_train)#me retorna a quantidade de amostras na 
                #variavel in_train
                
table(MaternalRisk$RiskLevel[in_train])#gera a tabela das amostras e suas quantidades em relação a variavel classe MaternalRisk$RiskLevel

maternal_train <- MaternalRisk[in_train, ]#atribui os 70% dos dados na varivael maternal_train 


maternal_test <- MaternalRisk[-in_train, ] # atribui o restante do valores do banco de dados na varivel                                        #maternal_test

str(maternal_test)
str(maternal_train)
#mostra no console as amostras, os 70% para teste e 30% para treino
#str(maternal_train)
#str(maternal_test)
#str(maternal_test$RiskLevel)
table(maternal_train$RiskLevel)
length(maternal_test)
#### seguir para o aprendizado de máquina
set.seed(10)
model <- train(RiskLevel ~., maternal_train, method = "svmRadial" , tuneLength = 10 )#adicina na variavel model o treinamento  usando o metodo de treino svmRadial
#para com c em 128 e treino foi obtido a maior Accuracy de 0,7155933

model

cm <- confusionMatrix(predict(model, maternal_test[-ncol(maternal_test)]), as.factor(maternal_test$RiskLevel))
print(cm$overall[1])
print(cm)#resultado do teste!!

max(model$results$Accuracy)#mostra no console a accuracy máxima do treino!!

#str(model)

#utilização do metodo de predição e atribui o resultado na variavem predicao




                    
