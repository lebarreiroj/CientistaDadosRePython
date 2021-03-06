# Este script tem o objetivo de exemplificar alguns pontos que foram
# discutidos na primeira aula.

# Para exectuar os comandos existem duas possibilidades
# 1. Clicar no bot�o Source do Rstudio
# 2. Utilizar atalhos do teclados:
# 2.1.: ctrl + enter: executa a sele��o de c�digo ou onde o cursor do mouse estiver
# 2.2: ctrl + shift + enter: executa o c�digo completo mostrando no console todo 
#  o c�digo do script
# 2.3: ctrl + shift + s: executa o c�digo completo, mas s� mostra no console
# aquilo que for expressamente indicado para "printar" na tela

# Vetores --------------------------------------------------------------
# No R um vetor � uma cole��o de valores que s�o unidos usando a fun��o
# c() (combine)
# Exemplo:

vetor1 <- c(10, 20, 30)
vetor1

# Lembre-se, no R, chamamos vetor1 de objeto.
# O s�mbolo "<-" significa assignment. Ele quer dizer que voc� deseja
# que o objeto vetor1 guarde o vetor com os valores 10, 20 e 30.
# Depois de executar o c�digo ele deve aparecer na aba 'environment' do 
# RStudio

# Se voc� n�o usar o "<-" o comando ser� executado e o resultado ser� 
# apresentado no console, mas n�o ser� guardado em nenhum objeto

# Os vetores podem ser diferentes tipos.
# Os mais comuns s�o:
# 1. numeric (n�mero)
# 2. character (texto)
# 3. logical (TRUE ou FALSE)
# 4. factor (vari�vel categ�rica com n�veis pr�-estabelecidos. Usaremos pouco).
# Obs: O vetor do tipo integer tamb�m � considerado num�rico

vetor_num <- c(1.2, 3.41, 7.93)
vetor_num

vetor_chr <- c("mdic", "mf", "mpog")
vetor_chr

vetor_lgl <- c(TRUE, FALSE, TRUE)
vetor_lgl

vetor_fct <- factor(c("azul", "verde"))
vetor_fct

# Caso voc� n�o saiba qual � a classe do vetor, pode ser usada a fun��o `class()`

class(vetor_num)
class(vetor_chr)
class(vetor_lgl)
class(vetor_fct)

# Existe tamb�m a possibilidade de fazer um teste em rela��o ao tipo do vetor
# Por exemplo: is.num(vetor) testa se o vetor � num�rico
is.numeric(vetor_num)
is.character(vetor_chr)
is.logical(vetor_lgl)
is.factor(vetor_fct)

# Convers�o de tipos
# Se por algum motivo voc� tem um vetor que era pra ser num�rico, mas est� sendo
# considerado do tipo `character`, voc� pode converter para n�mero usando a fun��o
# as.numeric() ("como n�mero").
# Existem tamb�m as.character(), as.logical(), as.integer() entre outros

vetor_num2 <- c("2", "4", "10")
vetor_num2
class(vetor_num2)

# Agora vamos converter o vetor_num2 para n�mero
vetor_num2 <- as.numeric(vetor_num2)
vetor_num2
class(vetor_num2)

# Fun��es -------------------------------------------------------------------
# A grande vantagem de usar o R e outros programas similares s�o as fun��es
# O R j� vem com um conjunto de pacotes e fun��es que denominamos de R Base.

# Exemplo de uso de fun��o: Raiz Quadrada (sqrt)
# A fun��o abaixo calcular� a raiz quadrada para cada elemento do vetor_num
sqrt(x = vetor_num)

# Chamamos "sqrt"  de nome da fun��o e "x" � o seu argumento.
# Colocar expressamente "x" na fun��o � opcional. Podemos utilizar a forma impl�cita
sqrt(vetor_num)

# Cuidado!!! Para a forma expl�cita funcionar, � preciso respeitar as posi��es
# dos argumentos da fun��o.

# Exemplos de fun��es para vetores no R

# 1. Tamanho do vetor - length()
length(vetor_num)

#2. M�dia do vetor (se for num�rico) - mean()
mean(vetor_num)

#3. Replicando um valor N vezes
rep(x = "R", times = 20)

#4. Criando uma sequ�ncia de valores

seq(from = 0, to = 100, by = 5)

# ou

seq(from = 0, to = 100, length.out = 21)

#5. Valores �nicos:

unique(c(10, 10, 20, 30, 40, 40))
unique(c("Jo�o", "Jo�o", "Jos�"))

# Outras fun��es estat�sticas comuns:
# var() - vari�ncia
# sd() - desvio-padr�o
# max() - m�ximo
# min() - m�nimo
# median() - mediana
# quantile() - quantil

# Ficou em d�vida sobre alguma fun��o? Olhe o help
# O help � utilizado da seguinte forma:
?rep()

# Lembre-se que o RStudio tamb�m fornece uma aba de ajuda (help)

# Estruturas de Dados no R ----------------------------------------------------

# O R aceita diversas estruturas de dados: vetores, matrizes, data.frames, 
# listas e arrays

# Utilizaremos principalmente vetores e data.frames.

# J� falamos um pouco sobre vetores. Agora, falaremos sobre data.frames
# O data.frame � uma estrutura de dados que � semelhante a uma tabela de excel
# Os data.frames pode ser criados manualmente, carregados a partir de dados
# que j� est�o dispon�veis como exemplo no R ou carregados a partir de arquivos
# xlsx (excel), csv, txt etc.
# Na pr�xima aula trataremos de leitura de dados a partir de arquivos externos
# Por enquanto, vamos come�ar carregando uma base que j� est� dispon�vel no R.

# Dados que est�o dispon�veis nos pacotes do R pode ser carregados usando a 
# fun��o data() ou chamando diretamente o seu nome. Exemplo:
data("mtcars")
mtcars
# Visualizar os dados no RStudio, clicando no nome do objeto que est� dispon�vel
# na aba environment. Ou:
View(mtcars)

# Algumas fun��es b�sicas aplicadas a data.frames:
# 1. Dimens�es dos dados
dim(mtcars)

#2. N�mero de linhas
nrow(mtcars)

#3. N�mero de colunas
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

# Valores faltantes (Missing Values). No R, os valores faltantes s�o representados
# por NA
# Exemplo: Vetor com NA
vetor_na <- c(10, NA, NA)
vetor_na

# Como saber se existe alguma NA em um vetor ou data.frame? Usando a fun��o is.na()
is.na(vetor_na)
# Tamb�m � poss�vel saber quantos NA's existem usando a fun��o sum()
sum(is.na(vetor_na))

# Para data.frames a fun��o summary() ajuda:
data("airquality")
# Veja que existem NA's, por exemplo, na coluna Ozone
View(airquality)
summary(airquality)

# A fun��o complete.cases() checa se n�o existe nenhum valor faltante para cada linha
# Ou seja, se a linha 1 tem valores para todas as vari�veis, ela � uma "caso completo"
complete.cases(airquality)

# Pacotes ------------------------------------------------------------------
# O R j� vem com um conjunto de fun��es e pacotes que s�o conhecidos como
# R-Base.
# Contudo, v�rios pacotes foram desenvolvidos com o intuido de disponibilizar
# novas funcionalidades ou aperfei�oar aquelas existentes.
# Para instalar o pacote basta usar a fun��o install.packages(nome_do_pacote)
# Por exemplo. Instalar o pacote "dplyr" (remova # se voc� quiser realmente
# instalar).

# install.packages(dplyr)

# Uma vez instalado, o pacote precisa ser carregado.
# Isso � feito usando a fun��o library()
# Por Exemplo:

# Remova o # para executar o c�digo.
# library(dplyr)


#############################################################################

# Na pr�xima aula ser� discutido como importar dados e como manipular os dados.
# Substituir valores, criar novas vari�veis, filtrar os dados, calcular valores
# por grupos, juntar duas tabelas de dados etc.

###############################################################################