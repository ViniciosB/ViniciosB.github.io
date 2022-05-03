##----------------------##
## Modelos Não-Lineares ##
##----------------------##

classes<-c("10-15","15-20","20-25","25-30","30-35","35-40","40-45","45-50","50-55","55-60")
x <- c(12.5,17.5,22.5,27.5,32.5,37.5,42.5,47.5,52.5,57.5)
y <- c(250,127,59,36,19,18,8,8,4,5)

dat<-data.frame(classes,x,y)

ggplot(dat,aes(classes,y))+
  scale_y_continuous(limits = c(0,270),breaks=seq(0,250,50) )+
  geom_bar(position = 'dodge',stat='identity')+ylab('Núm. de Indivíduos')+xlab('Classes Diamétricas (cm)')+
  geom_text(aes(label=y), position=position_dodge(width=0.9), vjust=-0.25)+
  theme(axis.text.x=element_text(angle=45,vjust=1,hjust=1))

x <- c(.2,1,2,3,4)
y <- c(4,1.8,.7,.25,.1)

ajuste<-lm(I(log(y))~x )

#esses betas irão ajustar valores transformados (log)
b0<-ajuste$coefficients[1]
b1<-ajuste$coefficients[2]

#para obter os parâmetros do modelo ñ-linear, fazer:
a <- exp(b0)
tau <- -1 / b1

equacao <- function(x,a,tau){
  fx <- a*exp( (-1/tau)*x  )
  return(fx)
}

plot(x,equacao(x,a,tau),type =  "l")

plot(equacao(x),y);abline(0,1)

###--------------------------------###
## Comparando modelos Não-Lineares ###
###--------------------------------###

# Ajustando modelos não lineares: Relação Hipsoétrica

# Carregando dados
dados<-read.table("Dados_Hipso.txt", header = TRUE)

plot(dados$DAP,dados$Ht, ylab="Altura (m)", xlab = "DAP (cm)" )

# Ajustando a equação da reta p/ comparação
m1<-lm(Ht~DAP, data = dados)

# Ajustando Modelos Não-Lineares
# Para os não lineares temos que "chutar" os parâmetros iniciais
# Esse chutes podem ser retirados de ajustes na literatura ou por experiência

m2<-nls(Ht~b0/(1+b1*exp(-b2*DAP)),data = dados, start = list(b0= 24,b1= 1, b2=0.1))
m3<-nls(Ht~b0*exp(-exp(b1-b2*DAP)), data= dados, start = list(b0=24,b1=0.1,b2=0.1))
m4<-nls(Ht~(b0*b1+b2*DAP^b3)/(b1+DAP^b3),data = dados, start = list(b0=14,b1=1.5e11,b2=22,b3=10))

# Vamos ver a significância dos parâmetros
summary(m1) # Reta
summary(m2) # Logistica
summary(m3) # Gompertz
summary(m4) # MMF

#Modelo para cada equação

reta <- function(x, b0,b1){ b0+b1*x }
logi <- function(x, b0,b1,b2){ b0/(1+b1*exp(-b2*x)) }
gomp <- function(x, b0,b1,b2){ b0*exp(-exp(b1-b2*x)) }
mmf  <- function(x, b0,b1,b2,b3){ (b0*b1+b2*x^b3)/(b1+x^b3) }

x<-sort(dados$DAP)

#Vamos ver como ficaram as curvas
plot(dados$DAP,dados$Ht, ylab="Altura (m)", xlab = "DAP (cm)" )
lines(x,reta(x, coefficients(m1)[1], coefficients(m1)[2] ),col="black")
lines(x,logi(x, coefficients(m2)[1], coefficients(m2)[2], coefficients(m2)[3] ),col="blue")
lines(x,gomp(x, coefficients(m3)[1], coefficients(m3)[2], coefficients(m3)[3] ),col="red")
lines(x, mmf(x, coefficients(m4)[1], coefficients(m4)[2], coefficients(m4)[3], coefficients(m4)[4] ),col="darkgreen")

# Vamos comparar algumas estatísticas de qualdidade de ajuste

# Coeficiente de correlação entre valores estimados e observados

Ryy_Reta<-cor(predict(m1),dados$Ht)
Ryy_Logi<-cor(predict(m2),dados$Ht)
Ryy_Gomp<-cor(predict(m3),dados$Ht)
Ryy_MMF <-cor(predict(m4),dados$Ht)

# Juntando tudo num mesmo vetor
Ryy<-c(Ryy_Reta,Ryy_Logi,Ryy_Gomp,Ryy_MMF)

# Erro padrão residual:

Syx_Reta<-summary(m1)$sigma
Syx_Logi<-summary(m2)$sigma
Syx_Gomp<-summary(m3)$sigma
Syx_MMF <-summary(m4)$sigma

# Juntando tudo num mesmo vetor
Syx<-c(Syx_Reta,Syx_Logi,Syx_Gomp,Syx_MMF)

# Erro padrão residual em percentagem:

Syx_Reta_perc<-Syx_Reta/mean(dados$Ht)*100
Syx_Logi_perc<-Syx_Logi/mean(dados$Ht)*100
Syx_Gomp_perc<-Syx_Gomp/mean(dados$Ht)*100
Syx_MMF_perc <-Syx_MMF /mean(dados$Ht)*100

# Jutando tudo num vetor
Syx_perc<-c(Syx_Reta_perc,Syx_Logi_perc,Syx_Gomp_perc,Syx_MMF_perc)

# Montando um quadro para comparar
compara<-data.frame(cbind(Ryy,Syx,Syx_perc))
row.names(compara)<-c("Reta",
                      "Logística",
                      "Gompertz",
                      "MMF")
compara