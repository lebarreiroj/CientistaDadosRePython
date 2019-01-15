# Este script tem o objetivo de exemplificar alguns pontos que foram
# discutidos na segunda aula.

# Para exectuar os comandos existem duas possibilidades
# 1. Clicar no botão Source do Rstudio
# 2. Utilizar atalhos do teclados:
# 2.1.: ctrl + enter: executa a seleção de código ou onde o cursor do mouse estiver
# 2.2: ctrl + shift + enter: executa o código completo mostrando no console todo 
#  o código do script
# 2.3: ctrl + shift + s: executa o código completo, mas só mostra no console
# aquilo que for expressamente indicado para "printar" na tela


# Definindo o diretório de trabalho ---------------------------------------

# O R segue uma lógica de diretório de trabalho. Isto é, ele trabalha "olhando"
# para uma pasta específica do seu computador. E os arquivos que serão lidos
# ou escritos serão encontrados pelo R a partir dessa pasta.

# Para saber qual pasta está atualmente definida como diretório de trabalho,
# use a função getwd()
getwd()

# Para definir a pasta do diretório de trabalho, use a função setwd()
# Aqui eu irei definir para a pasta do curso "Curso - R - MDIC".
# O R já inicia olhando para a pasta "Meus Documentos". 
# Dessa forma, se a pasta do curso estiver em documentos, é suficiente executar
# o seguinte código:
#setwd("Curso - R - MDIC/")

# Você também pode definir o caminho completo (mais seguro)
setwd("C:/Users/paulo/Documents/Curso - R - MDIC/")

#Vamos checar se o diretório de trabalho foi realmente alterado:
getwd()

# Leitura de Dados --------------------------------------------------------

# A tarefa inicial de uma análise de dados é importar os dados para dentro do R
# Em geral, fazemos isso a partir de arquivos externos.
# Na pasta do curso, existe uma pasta chamada dados em que serão armazenados 
# alguns arquivos de dados que utilizaremos durantes os encontros.

# Para ler os dados, precisamos de uma função.
# O R base disponibiliza as funções read.csv() (arquivo separado por vírgula),
# read.csv2() (arquivo separado por ponto e vírgula ;), read.table() para 
# ler arquivos com outro tipo de separador.

# No curso, utilizaremos o pacote readr que faz parte do tidyverse.
# Esse pacote disponibiliza funções similares: read_csv(), read_csv2(), 
# read_delim() etc.

# Primeiro precisamos carregar o pacote
library(tidyverse) # ou library(readr)

# Vamos carregar o arquivo EXP_2018.csv
# Esse arquivo é separado por ;
exp_2018 <- read_delim(file = "dados/EXP_2018.csv", delim = ";")
#ou
#exp_2018 <- read_csv2(file = "dados/EXP_2018.csv")

# Para visualizar os dados no RStudio:
View(exp_2018)

# Para "printar" as primeiras linhas:
head(exp_2018)

# Para "printar" as últimas linhas:
tail(exp_2018)

# Para ver a estrutura dos dados:
str(exp_2018)

# Para ver um "resumo":
summary(exp_2018)


# Manipulando Dados -------------------------------------------------------

# Existem vários pacotes e formas de manipular dados no R
# Durante o curso utilizaremos os pacotes do tidyverse
# No entanto, vamos fazer uma pequena introdução sobre manipulação no R base

# R-Base 

# Cada coluna de um data.frame é um vetor e pode ser acessada com o $:
head(exp_2018$VL_FOB)
tail(exp_2018$VL_FOB)
is.vector(exp_2018$VL_FOB)

# Obtendo os valores únicos de um vetor
paises <- unique(exp_2018$CO_PAIS)
paises
# Para quantos países exportamos em 2018?
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

# Também é possível selecionar elementos a partir de condições
valor_fob <- exp_2018$VL_FOB
length(valor_fob) # número de observações no valor_fob
# Observações com valor de exportação superior a US$ 1 bilhão
valor_fob[valor_fob > 1e9]

# Para data.frames, a seleção é parecida.
# A diferença é que o data.frame tem duas dimensões:
# linha e coluna

# Para acessar as 10 primeiras linhas do data.frame exp_2018
exp_2018[1:10, ]

# Para acessar as linhas 20 a 30 e colunas 2 a 4
exp_2018[20:30, 2:4]

# Também é possível selecionar colunas a partir dos nomes
exp_2018[20:30, c("CO_NCM", "VL_FOB")]

# Selecionando a partir de condições
exp_2018[exp_2018$CO_NCM == "12019000",] # exportações de soja

# Exemplos de condições:

# 1. Compara se valores são iguais
exp_2018$SG_UF_NCM == "SP"

# 2. Compara se valores são diferentes:
exp_2018$SG_UF_NCM != "SP"

# 3. Teste em números >, <, >=, <=
exp_2018$VL_FOB >= 1000000000

# 4. Também é possível testar se um valor pertence a um conjunto de valores
ce_sp <- c("CE", "SP")
ce_sp %in% c("RJ", "DF", "MG", "CE")

# 5. Combinando condições

# "E" = &
exp_2018$SG_UF_NCM == "SP" & exp_2018$CO_MES == "06"

# "OU" = | 
exp_2018$SG_UF_NCM == "SP" | exp_2018$CO_MES == "06"

# Manipulação com o dplyr (tidyverse)
# Necessário carregar o pacote tidyverse ou dplyr
# library(tidyverse) ou library(dplyr)

# O grande diferencial do dplyr é o %>%  ("pipe")
# O "pipe" é um encadeador de funções.
# Exemplo:
# Replicar o código abaixo com o "pipe" ("raiz da raiz de 16")
sqrt(sqrt(16))
# Com o pipe:
# Lê-se: Calcula a raiz de 16 e então calcule a raiz do resultado da 
# primeira operação
sqrt(16) %>% 
  sqrt

# Atalho para o pipe: ctrl + shift + m
# Adiante ficará mais claro a utilidade

# Função do dplyr: select()
# Seleciona colunas de uma data.frame

# Selecionando as colunas CO_NCM e VL_FOB
exp_2018 %>% 
  select(CO_NCM, VL_FOB)

# Selecionando todas as colunas menos a coluna CO_ANO
exp_2018 %>% 
  select(-CO_ANO)

# Além desses exemplos, existe uma infinidade de seleção de colunas com o dplyr
# Vou deixar alguns exemplo

# Seleciona da coluna CO_ANO até a coluna CO_UNID
exp_2018 %>% 
  select(CO_ANO:CO_UNID)

# Seleciona colunas que começam com "CO"
exp_2018 %>% 
  select(starts_with("CO_ANO"))

# Seleciona as colunas numéricas
exp_2018 %>% 
  select_if(is.numeric)

# Função do dplyr: filter()
# Filtra os dados de acordo com uma condição

# Selecionando as linhas em que SG_UF_NCM == "SP"
exp_2018 %>% 
  filter(SG_UF_NCM == "SP")

# Selecionando as linhas em que SG_UF_NCM == "SP" ou "PE"
exp_2018 %>% 
  filter(SG_UF_NCM == "SP" | SG_UF_NCM == "PE") %>% 
  select(SG_UF_NCM) %>% # seleciona apenas a coluna SG_UF_NCM
  distinct() # essa função traz as linhas distinas/únicas

# Selecionando as linhas em que CO_MES == "05" E VL_FOB > 1000
exp_2018 %>% 
  filter(CO_MES == "05" & VL_FOB > 1000)

# Função do dplyr: mutate()
# Cria novas colunas

# Exemplo: Coluna "PRECO_KG" que é igual ao VL_FOB dividido pelo KG_LIQUIDO
# E "PRECO_QT" que é igual VL_FOB divido pelo QT_ESTAT
exp_2018 %>% 
  mutate(PRECO_KG = VL_FOB/KG_LIQUIDO,
         PRECO_QT = VL_FOB/QT_ESTAT) %>% 
  # Seleciona as variáveis VL_FOB, KG_LIQUIDO, QT_ESTAT e aquelas que
  # contêm o termo "PRECO"
  select(VL_FOB, KG_LIQUIDO, contains("PRECO"))

# Função do dplyr: group_by()
# Particiona (internamente) os dados em grupos
# Se o dado está agrupado, as funções são aplicada grupo a grupo
# A função group_by() não faz nada sozinha
# Ela é usada principalmente com o mutate e com summarise

exp_2018 %>% 
  group_by(SG_UF_NCM)

# Função do dplyr: summarise()
# Aplica uma função que recebe uma conjunto de valores e retorna um valor para cada
# grupo

# Exemplo: Total exportado por mês
exp_2018 %>% 
  group_by(CO_MES) %>% 
  summarise(VL_FOB = sum(VL_FOB))

# Os grupos podem ser combinados utilizando múltiplas variáveis
exp_2018 %>% 
  group_by(CO_ANO, CO_MES) %>% 
  summarise(VL_FOB = sum(VL_FOB))

# Exemplo: Total por NCM e UF
exp_uf_ncm <- exp_2018 %>% 
  group_by(SG_UF_NCM, CO_NCM) %>% 
  summarise(VL_FOB = sum(VL_FOB))

View(exp_uf_ncm)

# Continuando o exemplo anterior. Qual é a NCM com maior valor exportado 
# por (group_by) UF
top_ncm_uf <- exp_uf_ncm %>% 
  group_by(SG_UF_NCM) %>% 
  top_n(VL_FOB, n = 1) # Função que retorna os top n valores de uma variável

View(top_ncm_uf)

# Para desagrupar os dados utilize a função ungroup()
top_ncm_uf <- top_ncm_uf %>% 
  ungroup()
top_ncm_uf

# Função do dplyr: arrange()
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
