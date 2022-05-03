rm(list=ls(all=TRUE))
setwd("C:/Users/vinic/Documents/GitHub/viniciosb.github.io/ALL/ModelagemEBiometriaFlorestal/Exercicio2/Ex2")

lm(Data$peso~Data$altura)
lm(Data$altura~Data$idade)
lm(Data$peso~Data$idade)
   
lm(Data$idade~Data$peso+Data$altura)
plot(Data$altura,Data$peso,cex=2); abline(lm(Data$peso~Data$altura))
plot(Data$idade,Data$altura,cex=2); abline(lm(Data$altura~Data$idade))
plot(Data$peso,Data$idade,cex=2); abline(lm(Data$idade~Data$peso))


summary( lm(Data$peso~Data$idade) )
summary( lm(Data$peso~Data$altura+Data$idade) )
