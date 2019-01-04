# CURSO: Formação Cientista de Dados com R e Python
# INSTITUIÇÃO: UDEMY
# ALUNO: LUIS EDUARDO
# E-MAIL: lebarreiroj@gmail.com


# Tema: Amostras
# Sub-Temas: Simples, Extratificada e por Unidade Monetária

# Funções R: 

#--------------------------------
#sample()
#--------------------------------
dim(iris)

## gera amostra com 150 - aleatória com 0 e 1 - pode repetir - com 50% de chance para cada
amostra = sample(c(0,1),150, replace=TRUE, prob=c(0.5,0.5))

## Mostra o resultado - a amostra
amostra

## verifica o tamanho da amostra 
length(amostra[amostra==1])
length(amostra[amostra==0])

set.seed(2345)
sample(c(100),1)

#--------------------------------
#Strata()
#--------------------------------
## ver iris
summary(iris)

## instalação do pacote SAMPLING
install.packages("sampling")
library(sampling)

## Gerar amostra com 25 elementos de cada espécie (estratificada)
amostrairis2 = strata(iris,c("Species"), size=c(25,25,25), method="srswor")

#--------------------------------
#S.SY()
#--------------------------------
##Amostragem Sistemática
install.packages("TeachingSampling")
library(TeachingSampling)

##amostra iris - 150 numero da amostra - sistematizado a cada 10