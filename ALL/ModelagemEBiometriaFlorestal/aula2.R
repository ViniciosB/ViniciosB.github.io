## AULA 2 - Contato com o R
dados <- read.table("dados1.txt",header=TRUE)
dados

dados$Altura
dados$Peso

plot(dados$Altura, dados$Peso)

#lm(formula=, data=, ...) #"l"inear "m"odel
lm(formula= Peso~Altura, data= dados)
lm(Peso~Altura, dados)
#lm(dados, Peso~Altura) #isso vai dar erro!
lm(data=dados, formula=Peso~Altura)

plot(dados$Altura,dados$Peso);abline(a=-102.99,b=99.09)
plot(dados$Altura,dados$Peso);abline(lm(Peso~Altura, dados))

X<-dados$Altura; X
b0<- -102.99; b1<- 99.09; b0; b1

y <- b0 + b1 * X; y
dados$y <- b0 + b1 * X; dados



















