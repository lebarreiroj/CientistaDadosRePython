# Este script tem o objetivo de exemplificar alguns pontos que foram
# discutidos na primeira aula.

# Para exectuar os comandos existem duas possibilidades
# 1. Clicar no botão Source do Rstudio
# 2. Utilizar atalhos do teclados:
# 2.1.: ctrl + enter: executa a seleção de código ou onde o cursor do mouse estiver
# 2.2: ctrl + shift + enter: executa o código completo mostrando no console todo 
#  o código do script
# 2.3: ctrl + shift + s: executa o código completo, mas só mostra no console
# aquilo que for expressamente indicado para "printar" na tela

# Vetores --------------------------------------------------------------
# No R um vetor é uma coleção de valores que são unidos usando a função
# c() (combine)
# Exemplo:

vetor1 <- c(10, 20, 30)
vetor1

# Lembre-se, no R, chamamos vetor1 de objeto.
# O símbolo "<-" significa assignment. Ele quer dizer que você deseja
# que o objeto vetor1 guarde o vetor com os valores 10, 20 e 30.
# Depois de executar o código ele deve aparecer na aba 'environment' do 
# RStudio

# Se você não usar o "<-" o comando será executado e o resultado será 
# apresentado no console, mas não será guardado em nenhum objeto

# Os vetores podem ser diferentes tipos.
# Os mais comuns são:
# 1. numeric (número)
# 2. character (texto)
# 3. logical (TRUE ou FALSE)
# 4. factor (variável categórica com níveis pré-estabelecidos. Usaremos pouco).
# Obs: O vetor do tipo integer também é considerado numérico

vetor_num <- c(1.2, 3.41, 7.93)
vetor_num

vetor_chr <- c("mdic", "mf", "mpog")
vetor_chr

vetor_lgl <- c(TRUE, FALSE, TRUE)
vetor_lgl

vetor_fct <- factor(c("azul", "verde"))
vetor_fct

# Caso você não saiba qual é a classe do vetor, pode ser usada a função `class()`

class(vetor_num)
class(vetor_chr)
class(vetor_lgl)
class(vetor_fct)

# Existe também a possibilidade de fazer um teste em relação ao tipo do vetor
# Por exemplo: is.num(vetor) testa se o vetor é numérico
is.numeric(vetor_num)
is.character(vetor_chr)
is.logical(vetor_lgl)
is.factor(vetor_fct)

# Conversão de tipos
# Se por algum motivo você tem um vetor que era pra ser numérico, mas está sendo
# considerado do tipo `character`, você pode converter para número usando a função
# as.numeric() ("como número").
# Existem também as.character(), as.logical(), as.integer() entre outros

vetor_num2 <- c("2", "4", "10")
vetor_num2
class(vetor_num2)

# Agora vamos converter o vetor_num2 para número
vetor_num2 <- as.numeric(vetor_num2)
vetor_num2
class(vetor_num2)

# Funções -------------------------------------------------------------------
# A grande vantagem de usar o R e outros programas similares são as funções
# O R já vem com um conjunto de pacotes e funções que denominamos de R Base.

# Exemplo de uso de função: Raiz Quadrada (sqrt)
# A função abaixo calculará a raiz quadrada para cada elemento do vetor_num
sqrt(x = vetor_num)

# Chamamos "sqrt"  de nome da função e "x" é o seu argumento.
# Colocar expressamente "x" na função é opcional. Podemos utilizar a forma implícita
sqrt(vetor_num)

# Cuidado!!! Para a forma explícita funcionar, é preciso respeitar as posições
# dos argumentos da função.

# Exemplos de funções para vetores no R

# 1. Tamanho do vetor - length()
length(vetor_num)

#2. Média do vetor (se for numérico) - mean()
mean(vetor_num)

#3. Replicando um valor N vezes
rep(x = "R", times = 20)

#4. Criando uma sequência de valores

seq(from = 0, to = 100, by = 5)

# ou

seq(from = 0, to = 100, length.out = 21)

#5. Valores únicos:

unique(c(10, 10, 20, 30, 40, 40))
unique(c("João", "João", "José"))

# Outras funções estatísticas comuns:
# var() - variância
# sd() - desvio-padrão
# max() - máximo
# min() - mínimo
# median() - mediana
# quantile() - quantil

# Ficou em dúvida sobre alguma função? Olhe o help
# O help é utilizado da seguinte forma:
?rep()

# Lembre-se que o RStudio também fornece uma aba de ajuda (help)

# Estruturas de Dados no R ----------------------------------------------------

# O R aceita diversas estruturas de dados: vetores, matrizes, data.frames, 
# listas e arrays

# Utilizaremos principalmente vetores e data.frames.

# Já falamos um pouco sobre vetores. Agora, falaremos sobre data.frames
# O data.frame é uma estrutura de dados que é semelhante a uma tabela de excel
# Os data.frames pode ser criados manualmente, carregados a partir de dados
# que já estão disponíveis como exemplo no R ou carregados a partir de arquivos
# xlsx (excel), csv, txt etc.
# Na próxima aula trataremos de leitura de dados a partir de arquivos externos
# Por enquanto, vamos começar carregando uma base que já está disponível no R.

# Dados que estão disponíveis nos pacotes do R pode ser carregados usando a 
# função data() ou chamando diretamente o seu nome. Exemplo:
data("mtcars")
mtcars
# Visualizar os dados no RStudio, clicando no nome do objeto que está disponível
# na aba environment. Ou:
View(mtcars)

# Algumas funções básicas aplicadas a data.frames:
# 1. Dimensões dos dados
dim(mtcars)

#2. Número de linhas
nrow(mtcars)

#3. Número de colunas
ncol(mtcars)

#4. Estrutura dos dados:
str(mtcars)

# Criando um data.frame manualmente:
uf <- c("SP", "DF", "RJ")
taxa_desemprego <- c(9.2, 8.5, 10.2)

desemprego <- data.frame(uf, taxa_desemprego)
str(desemprego)

# Perceba que automaticamente o R converteu a coluna uf para Factor.
# Para evitar esse comportamento, podemos usar o argumento `stringAsFactor = FALSE`
desemprego <- data.frame(uf, taxa_desemprego, stringsAsFactors = FALSE)
str(desemprego)

# Valores faltantes (Missing Values). No R, os valores faltantes são representados
# por NA
# Exemplo: Vetor com NA
vetor_na <- c(10, NA, NA)
vetor_na

# Como saber se existe alguma NA em um vetor ou data.frame? Usando a função is.na()
is.na(vetor_na)
# Também é possível saber quantos NA's existem usando a função sum()
sum(is.na(vetor_na))

# Para data.frames a função summary() ajuda:
data("airquality")
# Veja que existem NA's, por exemplo, na coluna Ozone
View(airquality)
summary(airquality)

# A função complete.cases() checa se não existe nenhum valor faltante para cada linha
# Ou seja, se a linha 1 tem valores para todas as variáveis, ela é uma "caso completo"
complete.cases(airquality)

# Pacotes ------------------------------------------------------------------
# O R já vem com um conjunto de funções e pacotes que são conhecidos como
# R-Base.
# Contudo, vários pacotes foram desenvolvidos com o intuido de disponibilizar
# novas funcionalidades ou aperfeiçoar aquelas existentes.
# Para instalar o pacote basta usar a função install.packages(nome_do_pacote)
# Por exemplo. Instalar o pacote "dplyr" (remova # se você quiser realmente
# instalar).

# install.packages(dplyr)

# Uma vez instalado, o pacote precisa ser carregado.
# Isso é feito usando a função library()
# Por Exemplo:

# Remova o # para executar o código.
# library(dplyr)


#############################################################################

# Na próxima aula será discutido como importar dados e como manipular os dados.
# Substituir valores, criar novas variáveis, filtrar os dados, calcular valores
# por grupos, juntar duas tabelas de dados etc.

###############################################################################