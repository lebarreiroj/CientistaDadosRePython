# Este script tem o objetivo de exemplificar alguns pontos que foram
# discutidos na segunda aula.

# Para exectuar os comandos existem duas possibilidades
# 1. Clicar no bot�o Source do Rstudio
# 2. Utilizar atalhos do teclados:
# 2.1.: ctrl + enter: executa a sele��o de c�digo ou onde o cursor do mouse estiver
# 2.2: ctrl + shift + enter: executa o c�digo completo mostrando no console todo 
#  o c�digo do script
# 2.3: ctrl + shift + s: executa o c�digo completo, mas s� mostra no console
# aquilo que for expressamente indicado para "printar" na tela


# Definindo o diret�rio de trabalho ---------------------------------------

# O R segue uma l�gica de diret�rio de trabalho. Isto �, ele trabalha "olhando"
# para uma pasta espec�fica do seu computador. E os arquivos que ser�o lidos
# ou escritos ser�o encontrados pelo R a partir dessa pasta.

# Para saber qual pasta est� atualmente definida como diret�rio de trabalho,
# use a fun��o getwd()
getwd()

# Para definir a pasta do diret�rio de trabalho, use a fun��o setwd()
# Aqui eu irei definir para a pasta do curso "Curso - R - MDIC".
# O R j� inicia olhando para a pasta "Meus Documentos". 
# Dessa forma, se a pasta do curso estiver em documentos, � suficiente executar
# o seguinte c�digo:
#setwd("Curso - R - MDIC/")

# Voc� tamb�m pode definir o caminho completo (mais seguro)
setwd("C:/Users/paulo/Documents/Curso - R - MDIC/")

#Vamos checar se o diret�rio de trabalho foi realmente alterado:
getwd()

# Leitura de Dados --------------------------------------------------------

# A tarefa inicial de uma an�lise de dados � importar os dados para dentro do R
# Em geral, fazemos isso a partir de arquivos externos.
# Na pasta do curso, existe uma pasta chamada dados em que ser�o armazenados 
# alguns arquivos de dados que utilizaremos durantes os encontros.

# Para ler os dados, precisamos de uma fun��o.
# O R base disponibiliza as fun��es read.csv() (arquivo separado por v�rgula),
# read.csv2() (arquivo separado por ponto e v�rgula ;), read.table() para 
# ler arquivos com outro tipo de separador.

# No curso, utilizaremos o pacote readr que faz parte do tidyverse.
# Esse pacote disponibiliza fun��es similares: read_csv(), read_csv2(), 
# read_delim() etc.

# Primeiro precisamos carregar o pacote
library(tidyverse) # ou library(readr)

# Vamos carregar o arquivo EXP_2018.csv
# Esse arquivo � separado por ;
exp_2018 <- read_delim(file = "dados/EXP_2018.csv", delim = ";")
#ou
#exp_2018 <- read_csv2(file = "dados/EXP_2018.csv")

# Para visualizar os dados no RStudio:
View(exp_2018)

# Para "printar" as primeiras linhas:
head(exp_2018)

# Para "printar" as �ltimas linhas:
tail(exp_2018)

# Para ver a estrutura dos dados:
str(exp_2018)

# Para ver um "resumo":
summary(exp_2018)


# Manipulando Dados -------------------------------------------------------

# Existem v�rios pacotes e formas de manipular dados no R
# Durante o curso utilizaremos os pacotes do tidyverse
# No entanto, vamos fazer uma pequena introdu��o sobre manipula��o no R base

# R-Base 

# Cada coluna de um data.frame � um vetor e pode ser acessada com o $:
head(exp_2018$VL_FOB)
tail(exp_2018$VL_FOB)
is.vector(exp_2018$VL_FOB)

# Obtendo os valores �nicos de um vetor
paises <- unique(exp_2018$CO_PAIS)
paises
# Para quantos pa�ses exportamos em 2018?
length(paises)

# Ordenando um vetor
paises <- sort(paises)
paises

# Acessando elementos de um vetor
# Para ver o elemento 8 do vetor paises:
paises[8]

# Para ver os 20 primeiros elementos do vetor paises:
paises[1:20]

# Para ver os elemento 1 e 50 do vetor paises:
paises[c(1, 50)]

# Tamb�m � poss�vel selecionar elementos a partir de condi��es
valor_fob <- exp_2018$VL_FOB
length(valor_fob) # n�mero de observa��es no valor_fob
# Observa��es com valor de exporta��o superior a US$ 1 bilh�o
valor_fob[valor_fob > 1e9]

# Para data.frames, a sele��o � parecida.
# A diferen�a � que o data.frame tem duas dimens�es:
# linha e coluna

# Para acessar as 10 primeiras linhas do data.frame exp_2018
exp_2018[1:10, ]

# Para acessar as linhas 20 a 30 e colunas 2 a 4
exp_2018[20:30, 2:4]

# Tamb�m � poss�vel selecionar colunas a partir dos nomes
exp_2018[20:30, c("CO_NCM", "VL_FOB")]

# Selecionando a partir de condi��es
exp_2018[exp_2018$CO_NCM == "12019000",] # exporta��es de soja

# Exemplos de condi��es:

# 1. Compara se valores s�o iguais
exp_2018$SG_UF_NCM == "SP"

# 2. Compara se valores s�o diferentes:
exp_2018$SG_UF_NCM != "SP"

# 3. Teste em n�meros >, <, >=, <=
exp_2018$VL_FOB >= 1000000000

# 4. Tamb�m � poss�vel testar se um valor pertence a um conjunto de valores
ce_sp <- c("CE", "SP")
ce_sp %in% c("RJ", "DF", "MG", "CE")

# 5. Combinando condi��es

# "E" = &
exp_2018$SG_UF_NCM == "SP" & exp_2018$CO_MES == "06"

# "OU" = | 
exp_2018$SG_UF_NCM == "SP" | exp_2018$CO_MES == "06"

# Manipula��o com o dplyr (tidyverse)
# Necess�rio carregar o pacote tidyverse ou dplyr
# library(tidyverse) ou library(dplyr)

# O grande diferencial do dplyr � o %>%  ("pipe")
# O "pipe" � um encadeador de fun��es.
# Exemplo:
# Replicar o c�digo abaixo com o "pipe" ("raiz da raiz de 16")
sqrt(sqrt(16))
# Com o pipe:
# L�-se: Calcula a raiz de 16 e ent�o calcule a raiz do resultado da 
# primeira opera��o
sqrt(16) %>% 
  sqrt

# Atalho para o pipe: ctrl + shift + m
# Adiante ficar� mais claro a utilidade

# Fun��o do dplyr: select()
# Seleciona colunas de uma data.frame

# Selecionando as colunas CO_NCM e VL_FOB
exp_2018 %>% 
  select(CO_NCM, VL_FOB)

# Selecionando todas as colunas menos a coluna CO_ANO
exp_2018 %>% 
  select(-CO_ANO)

# Al�m desses exemplos, existe uma infinidade de sele��o de colunas com o dplyr
# Vou deixar alguns exemplo

# Seleciona da coluna CO_ANO at� a coluna CO_UNID
exp_2018 %>% 
  select(CO_ANO:CO_UNID)

# Seleciona colunas que come�am com "CO"
exp_2018 %>% 
  select(starts_with("CO_ANO"))

# Seleciona as colunas num�ricas
exp_2018 %>% 
  select_if(is.numeric)

# Fun��o do dplyr: filter()
# Filtra os dados de acordo com uma condi��o

# Selecionando as linhas em que SG_UF_NCM == "SP"
exp_2018 %>% 
  filter(SG_UF_NCM == "SP")

# Selecionando as linhas em que SG_UF_NCM == "SP" ou "PE"
exp_2018 %>% 
  filter(SG_UF_NCM == "SP" | SG_UF_NCM == "PE") %>% 
  select(SG_UF_NCM) %>% # seleciona apenas a coluna SG_UF_NCM
  distinct() # essa fun��o traz as linhas distinas/�nicas

# Selecionando as linhas em que CO_MES == "05" E VL_FOB > 1000
exp_2018 %>% 
  filter(CO_MES == "05" & VL_FOB > 1000)

# Fun��o do dplyr: mutate()
# Cria novas colunas

# Exemplo: Coluna "PRECO_KG" que � igual ao VL_FOB dividido pelo KG_LIQUIDO
# E "PRECO_QT" que � igual VL_FOB divido pelo QT_ESTAT
exp_2018 %>% 
  mutate(PRECO_KG = VL_FOB/KG_LIQUIDO,
         PRECO_QT = VL_FOB/QT_ESTAT) %>% 
  # Seleciona as vari�veis VL_FOB, KG_LIQUIDO, QT_ESTAT e aquelas que
  # cont�m o termo "PRECO"
  select(VL_FOB, KG_LIQUIDO, contains("PRECO"))

# Fun��o do dplyr: group_by()
# Particiona (internamente) os dados em grupos
# Se o dado est� agrupado, as fun��es s�o aplicada grupo a grupo
# A fun��o group_by() n�o faz nada sozinha
# Ela � usada principalmente com o mutate e com summarise

exp_2018 %>% 
  group_by(SG_UF_NCM)

# Fun��o do dplyr: summarise()
# Aplica uma fun��o que recebe uma conjunto de valores e retorna um valor para cada
# grupo

# Exemplo: Total exportado por m�s
exp_2018 %>% 
  group_by(CO_MES) %>% 
  summarise(VL_FOB = sum(VL_FOB))

# Os grupos podem ser combinados utilizando m�ltiplas vari�veis
exp_2018 %>% 
  group_by(CO_ANO, CO_MES) %>% 
  summarise(VL_FOB = sum(VL_FOB))

# Exemplo: Total por NCM e UF
exp_uf_ncm <- exp_2018 %>% 
  group_by(SG_UF_NCM, CO_NCM) %>% 
  summarise(VL_FOB = sum(VL_FOB))

View(exp_uf_ncm)

# Continuando o exemplo anterior. Qual � a NCM com maior valor exportado 
# por (group_by) UF
top_ncm_uf <- exp_uf_ncm %>% 
  group_by(SG_UF_NCM) %>% 
  top_n(VL_FOB, n = 1) # Fun��o que retorna os top n valores de uma vari�vel

View(top_ncm_uf)

# Para desagrupar os dados utilize a fun��o ungroup()
top_ncm_uf <- top_ncm_uf %>% 
  ungroup()
top_ncm_uf

# Fun��o do dplyr: arrange()
# Ordena os dados em ordem crescente
exp_2018 %>% 
  group_by(SG_UF_NCM) %>% 
  summarise(VL_FOB = sum(VL_FOB)) %>% 
  arrange(VL_FOB)

# Ordena os dados em ordem decrescente
exp_2018 %>% 
  group_by(SG_UF_NCM) %>% 
  summarise(VL_FOB = sum(VL_FOB)) %>% 
  arrange(-VL_FOB) # ou arrange(desc(VL_FOB))
