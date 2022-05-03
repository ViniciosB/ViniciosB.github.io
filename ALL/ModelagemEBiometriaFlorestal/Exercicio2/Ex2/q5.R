library(ggplot2)
x<-c(1,2,1,1,2,2,3,2,3,4,3,4,5,4,5,5,6,6,6,7,8,7,8,8,9,10,10,11,12,12)
y<-c(2,2,2,2,2,2,2,2,2,4,2,2,4,4,2,4,4,4,6,6,6,4,6,6,6,6,6,6,6,6)
grupo<-c(1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3)
dados<-data.frame(grupo,x,y)
mod1<-lm(y~x,dados) #regreçao linear simples
dados$x2=dados$x^2
plot(dados$x,dados$y);abline(mod1)
#regreçao linear quadratica
mod2<-lm(y~x+I(x^2),data=dados)
ggplot(dados,aes(x=x,y=y))+
  geom_point()+
  geom_smooth(method = "lm",formula = y~x+I(x^2),se=FALSE)

ynv=dados$y/max(dados$y)
modelo3<-glm(data=dados,formula = ynv~x,family = binomial)
summary(modelo3)          
ggplot(dados,aes(x=x,y=ynv))+
  geom_point(alpha=1.5)+
  geom_smooth(method = "glm",method.args=list(family="binomial"))
 
summary(mod1)
summary(mod2)
summary(modelo3)

date<-dados[dados$grupo%in%c(1,2),]
mod1<-lm(date$y~date$x)
plot(dados$x,dados$y);abline(lm(date$y~date$x))



mod2<-lm(y~x+I(x^2),data=date)
ggplot(date,aes(x=x,y=y))+
  geom_point()+
  geom_smooth(method = "lm",formula = y~x+I(x^2),se=FALSE)


ynv=date$y/max(date$y)
modelo3<-glm(data=date,formula = ynv~x,family = binomial)
summary(modelo3)          
ggplot(date,aes(x=x,y=ynv))+
  geom_point(alpha=1.5)+
  geom_smooth(method = "glm",method.args=list(family="binomial"))

summary(mod1)
summary(mod2)
summary(modelo3)