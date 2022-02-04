#primeira aula de r em modelaem!!!!
dados<-read.table("dados1.txt",header = TRUE)
plot(dados$Altura,dados$Peso);abline(lm(Peso~Altura,dados))


X<-dados$Altura;X
b0<- -102.99
b1<- 99.09
b0
b1
dados$y<-b0+b1*X
dados
