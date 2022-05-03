rm(list=ls(all=TRUE))
setwd("C:/Users/vinic/Documents/GitHub/viniciosb.github.io/ALL/ModelagemEBiometriaFlorestal/Exercicio2/Ex2")
require('wakefield')



Hora<-c(1:15)

Distancia<-c(round(rnorm(15,5:15),2))
Distancia<-c(Distancia/1.609)
#X2
Distancia
Valor<-c(round(rnorm(15,7:12)+runif(1, min=0, max=5),2))

lm(Valor~Distancia)
plot(Distancia,Valor,cex=2); abline(lm(Valor~Distancia))
plot(Distancia,Hora,cex=2); abline(lm(Hora~Distancia))
plot(Distancia,Valor,cex=2); abline(lm(Valor~Distancia))
lm(Valor~Distancia+Hora)
abline(lm(Valor~Distancia+Hora))
summary(lm(Valor~Distancia+Hora))
