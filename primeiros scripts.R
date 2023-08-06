
#teste numerico 
2*2*2

#limpar = ctrl+l

#teste variaveis obs: temos que executar/inicializar na memoria antes de fazer a multiplicação
variavel <- 56#incializar executando
variavel2 <- 10
variavel*variavel2

str <- "zé"
str2 <- "zézão"

ls()#lista todas as variaveis
rm(variavel)#remover a variavel do parametro

#limpar console ctrl+l
#vetores

vet <- c(1,2,2,3,3,4) #inicializa o vetor
vet #printa o vetor no console
vet2 <- 1:50 #atribui vetor ordenado de 1 a 50
vet3 <- 7:1 #atribui vetor ordenado de trás para fente de 7 a 1

vetc <- c(10:1, 1:15) #concatena vetores
vetc2 <- c(1:10, 1:3)
vetc3 <- c(10:1, 10:3)
vetc
vetc2
vetc3

 vetc*vet2
 
 rep(vetc, times=3)#repete o vetor vetc por 3 vezes
 ?rep#abrindo a documentação da função rep()
 
 
 rep(vetc, times=1.5)
 rep(vetc, times=2)
 rep(vetc2, times=2)
 rep(vetc3, times=2)
 
 rep(vetc, each=2)#repete os elementos do vetor de acordo com 
 #a igualdade de each ordenados em repetição 
 rep(vetc, each=2)
 rep(vetc2, each=4)
 rep(vetc3, each=3)
 
 ?seq
 seq(1, 11, 1)#gerador de sequencia primeiro parametro = incio da sequencia, segundo parameto, fim,
 #terceiro parametro de quanto em quanto
 seq(10, 1, -1)
 seq(1.1, 2.1, 0.001)
 vetseq <- seq(0, 19, 1)
vetseq

#funções 
#amostras aleatorias
variSam <- sample(1:50, 10)#gera de forma aleatoria das numeros de 1 a 50
sample(80:1, 5)
sample(1:6, 1.5)
sample(0:5, 3)
variSam

#minimo
min(variSam)#gera o valor minimo do vetor executado
min(vet2)
min(vetc3)
min(vetseq)

#maximo
max(variSam)#gera o valor maximo
max(vet2)
max(vetc3)
max(vetseq)
#media
mean(variSam)#gera a média
mean(variSam)
mean(vet2)
mean(vetc3)
mean(vetseq)

#mediana
median(variSam)#gera a mediana
median(vet2)
median(vetc3)
median(vetseq)

#função de ordenação

sort(vet2)
sort(vetc3)
sort(vetseq)

sort(vet2, decreasing = TRUE)#função de ordenação ao contrario
sort(vetc3, decreasing = TRUE)
sort(vetseq, decreasing = TRUE)

#desvio padrão

sd(vet2)#gera o desvio padrão do vetor
sd(vetc3)
sd(vetseq)

#tabela de contigencia
vetseq
tbc <- c(vetseq,30,20,30,12,14)
tbc1 <- c(vetseq,1,1,1,1,1,1)
tbc2 <- c(vetseq,2,2,3,2,1,4)
tbc
tbc1
tbc2

table(tbc) #conta quantas vezes(na linha de baixo dele) um numero aparece no vetor
table(tbc1)
table(tbc2)

classe<-rep(c("sim", "não"), 10)
classe1<-rep(c("", "2"), 5)
classe2<-rep(c("t", "t"), 10)
classe
classe1
classe2
table(classe) #conta string tbm
table(classe1)
table(classe2)

vetAleatorio <- sample(1:200, 15)
vetAleatorio

#a operação (-*/+)com escalares são usados em todos os numeros do vetor
vetAleatorio + 10
vetAleatorio-10
vetAleatorio*10
vetAleatorio/5

#raiz quadrada
sqrt(vetAleatorio) #de cada um do vetor

#log
log(vetAleatorio)
log(vetAleatorio, base = 2)
log(vetAleatorio, base = 3)
log(vetAleatorio, base = 15)
log10(50)#ja na base 10
log2(4)#ja na base 2

#potencia

vetAleatorio ^ 3
vetAleatorio ^ 45
vetAleatorio ^ 2

#tamanho do vetor
length(vetAleatorio)

length(vet2)

length(vet3)

length(vetc3)

#seleção de qualquer poarte do vetor por indice

vetAleatorio[1:5] #obs: colchetes para verificação de indices
vetc2[1:3]
vetc3[1:8]
vet2[1:6]

vetc2[15:3]
vetc3[10:8]
vet2[length(vet2):(length(vet2)- 2)]#verificação dos ultimos, com ultimo indice até, o ultimo indice menos o escalar no caso 2
vet2

#acessando por indices
vet2[c(2,3,5,14)]
vet3[c(2,3,5,14)]#não tendo retorna NA

vet2[-2] #retira do vetor a variavel do indice passado
vet2[-c(3,4,1,5)] #retira o vetor pássado como parametro do vet2

vetAleatorio[-c(30,4,10,5, 2)]
vet2[-c(30,4,10,5, 12)]
vetseq[-c(30,4,6,5, 20)]

#estrutura de dados

#vetor

vets<-1:10
class(vets)#retorna o tipo do vetor
is.matrix(vets)# retorna se é uma matriz ou não


#matriz

mtrx <- matrix(1:20,nrow = 4, ncol = 5  )
mtrx #byrow false começa a preencher a matriz por linha
class(mtrx)
is.matrix(mtrx)


mtrx2 <- matrix(1:20,nrow = 4, ncol = 5,byrow = TRUE  )
mtrx2 #byrow true, começa a preencher por coluna
is.matrix(mtrx2)
class(mtrx2)

#transformando vetores em matriz
vx<-1:5
vy<-10:14
vz<-21:25

vxyz <- matrix(c(vx,vy,vz), nrow = 5, ncol=3, byrow = FALSE )
vxyz

colnames(vxyz)<-c("vx", "vy", "vz")# muda o nome das colunas
rownames(vxyz)<-c("a", "b", "c", "d", "e")#muda o nome das linhas
vxyz

vxyz2<- cbind(vx,vy,vz)#concatena o vetor preenchendo a coluna
vxyz2
vxyz3<-rbind(vx,vy,vz) #concatena preenchendo a linha
vxyz3

row.names(vxyz) #retorna se tem nome de linhas 
row.names(vxyz2)
row.names(vxyz3)


#data frame, coleção de variáveis
dtf1 <- data.frame(1:20)#insere todos em uma coluna só
dtf1
dtf2 <- data.frame(x=1:5,y=6:10,z=11:15)# da nome e quebra em colunas o preenchimento da mesma 
dtf2
dtf3 <- data.frame()
dtf3

class(dtf1)
class(dtf2)
class(dtf3)

#comando str

str(vxyz)#mostra o nome das linhas e colunas a matriz
str(dtf1)#mostra o nome  data frame de uma coluna preechida
str(dtf2)#mostra data frame como o nome das colunas e o inteiro que preenchem o mesmo
str(dtf3)

summary(dtf1)#mostra um resumo de cada variavel, com o minimo,
              #1 quartil, mediana, media, 3 quartil e maximo
summary(dtf2)
summary(dtf3)

summary(vxyz)#funciona com a matriz

#exemplo para matriz
 x<-c("a","b","c")
 y<- 10:12
 z<- 13:15
 vxyz1 <- matrix(c(x,y,z), nrow = 3, ncol=3, byrow = FALSE )
 vxyz1 # caso seja feito como acima, a matriz será interpretada como string
 
 #exemplo para data frame
 dtf4<- data.frame(x=x,y=y,z=z)
 dtf4
 str(dtf4)
 #em data frame trabalhamos com diferentes tipos de dado
 #dtf4[LINHA, COLUNA]
dtf4[,1]# mostra as linhas da 1º coluna
dtf4[1,] #mostra as colunas da primeira linha
dtf4[,1:2]# mostra as linhas da coluna 1 e 2

dtf4$x #mostra a o valor da coluna x
dtf4$y #mostra a o valor da coluna y
dtf4$z #mostra a o valor da coluna z

#transformação dos valores
# função as.(alguma coisa)funções pré definidas
dtf4
as.character(dtf4$y) #transforma os valores da coluna y em caracter
as.numeric(dtf4$y)#transforma em numerico


dtf4$y <- as.factor(dtf4$y)
str(dtf4)

#transformando factor para numerico
as.numeric(dtf4$y) # não fazer dessa forma pq acha so o numero do factor
as.numeric(as.character(dtf4$y))#aqui acha o numero original da coluna


#levels, mostra as categorias de cada variável
dtf5 <- dtf4

dtf5$y=as.numeric(as.character(dtf4$y))

levels(dtf5$x)#é lançado NULL porque a função acima retira y de fator para numerico
levels(dtf5$y)
levels(dtf5$z)
levels(dtf5)
levels(dtf4$y)#factor ainda
levels(dtf4$x)
levels(dtf4$z)

#listas

lt <- list(1:10)
str(lt)
lt #diz que o primeiro elemento da lista é um vetor de 1 a 10


lt2 <- as.list(1:10)
str(lt2)
lt2


x
y
z
lt3 <- as.list(c(x))


lt4<- list(x,
           y,
           z,
           mtrx2,
           mtrx,
           dtf5,
           dtf2,
           matrix(1:2, nrow = 2,ncol = 2,byrow = FALSE),
           data.frame(x,y,z))
str(lt4)#adiciona todos o parametros na lista de 9 itens
lt4

names(lt4)<- c("x","y","z", "matriz01", "matriz02","dataframe01", "dataframe02", "matriz 2x2", "dataframe03" )#nomeia a lista
lt4

str(lt4)

#condicionais if e else

x<-10
if(x<5){
  print("x é menor que 5")
  
}else{
  if(x<10){
    print("x é maior ou igual que 5 e menor que 10")
  }else{
    if(x<15){
      print("x maior ou igual a 10 e menor que 15")
    }
  }
    
}

x<-50

ifelse(x<10, "x é menor que 10", "x é maior que 10")
ifelse( x<2, "x menor que 2", x<-3 )
#ifelse(condição, TRUE, FALSE)

n1<-scan()
n2<-scan()
n3<-scan()

#ordenando 3 numeros

if(n1<n2){
  if(n3<n3){
    print(n1)
    print(n2)
   print( n3)
 }else if(n1<n3){
   print(n1)
   print( n3)
   print(n2)
}else{
  print(n3)
  print(n1)
  print( n2)
}
}else if(n2<n3){
  if(n1<n3){
    print(n2)
    print(n1)
    print(n3)
    
  }else{
    print( n2)
    print( n3)
    print(n1)
  }

}else{
  print(n3)
  print(n2)
  print(n1)
}


#laços de repetição em R

for(i in 1:12){
  print(i)
  
}

#somar os numeros de 1 a 10
soma<-0
for(i in 1:10){
 soma <- soma +i
 soma
  
}
print(soma)

soma2<-sum(1:10)#soma os elementos
soma2
mtl <- 0

dtf2
rowSums(dtf2)
colSums(dtf2)

rowSums(dtf4)
colSums(dtf4)#erro pq x não é numerico

rowSums(dtf3)
colSums(dtf3) #é 0 pq a data frame é 0

rowMeans(dtf1)
colMeans(dtf1)


for(i in seq(1,20,3))print(i)


for (i in sample(1:30, 8)) {#oito numeros aleatorios entre 1 a 30
  print(i)
}  

foreach(i=1:3) #dando erro
  sqrt(i)

m <- matrix(rnorm(9), 3, 3)
  foreach(i=1:ncol(m), .combine=c) #dando erro
  mean(m[,i])

#apply é calculado sobre uma matriz ou data frame
#
  data("iris")
  summary(iris)

  
  #media de cada variavel
  apply(iris[,1:4], 1, sum)#aplica a soma pela linha
  apply(iris[, 1:4], 2, sum)#aplica a soma pela coluna

  apply(iris[,1:4], 1,function(x){sum(x)*2/5+214524})
    
  apply(iris[,1:4], 2,function(x){sum(x)*2/5+214524})
  
  #lapply aplicado sobre uma lista ou um vetor
  
   x<- list(1:10, 1:41 , 1:12, 1:23)
   names(x)<- c("a", "b", "c", "d")
    str(x)
   
    lapply(x, mean)
    lapply(x, min)
    lapply(x, max)
    lapply(x, median)
    lapply(x, sum)
    lapply(x, function(x){x<- 101/10*55+65})
   
    #tapply tabela
    summary(iris)
    tapply(iris$Sepal.Length, iris$Species, min)
    tapply(iris$Sepal.Length, iris$Species, max)
    tapply(iris$Sepal.Length, iris$Species, mean)
    tapply(iris$Sepal.Length, iris$Species, median)
    tapply(iris$Sepal.Length, iris$Species, sum)
    tapply(iris$Sepal.Length, iris$Species, function(iris){
     iris*iris 
      
    })
    
    