setwd("C:/Users/vinic/Documents/GitHub/viniciosb.github.io/ModelagemEBiometriaFlorestal")

#1 forma
#dados e busca
mes <- c("Janeiro", "Fevereiro", "Marco", "Abril","Maio","Junho","julho", "Agosto", "Setembro", "Outubro", "Novembro","Dezembro")
Temperatura <- c(33, 32 , 27, 26.50, 27, 19.50, 18,19,22,27,26.50,30)
busca<-c("Maio","Janeiro","Novembro")
df<-data.frame(mes,Temperatura);df  #merge dataframe
x<-df[df$mes=="Maio",]              #busca  
y<-df[df$mes=="Janeiro", ]          #busca
z<-df[df$mes=="Novembro", ]         #busca
dfr<-rbind(x,y,z)                   #merge dados encontrados
dfr                                 #print dataframe resultante
################################################################################
#2 forma
M<-c()    #vetor mes vazio
Temp<-c() #vetor Temperatura vazio

#Loop de busca
for(i in 1:length(mes)){
  for(j in 1:length(busca)){
    if(df$mes[i]==busca[j]){                  #compara array mes com o array de busca     
      M[length(M)+1]=df$mes[i]                #calcula pos e insere no array mes
      Temp[length(Temp)+1]=df$Temperatura[i]  #calcula pos e insere no array temperatura
    }
  }
}

dfr<-data.frame(Mes=M,Temperatura=Temp);dfr #renomear colunas e printar dataframe resultante


