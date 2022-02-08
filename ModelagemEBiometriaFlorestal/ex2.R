setwd("C:/Users/vinic/Documents/GitHub/viniciosb.github.io/ModelagemEBiometriaFlorestal")
rm(list=ls(all=TRUE))
#input <- c(F,F,F,T,F,F,F,T,T,T,F,F,F,F,T,T,F,F,F,F,F,T,T,F)                        #entrada do input
#output <- c(NA,NA,NA,1,NA,NA,NA,2,2,2,NA,NA,NA,NA,3,3,NA,NA,NA,NA,NA,4,4,NA)       #entrada do output

entrada<-function(n){
  inpt<-c()
  for(i in 1: n){
    x=sample(0:1,1,replace = TRUE)
    if(x==0){
      inpt[length(inpt)+1]=F
    }
    else{
      inpt[length(inpt)+1]=T
    }
    
  }
  return(inpt)
}

saida<-function(input){
  output<-c() #vetor output nulo
  #df<-data.frame(input, output)
  flag=1 #flag de iteracao de ocorrencias de troca
  for(i in 1:length(input)){
    if(input[i]=="FALSE"){ 
      output[i]=NA ## se input na pos I  for igual a FALSE o vetor NA recebe NA
    }
    if(input[i]=="TRUE"){
      output[i]=flag #se o vetor na pos for igual a TRUE o vetor output recebe flag
      if(input[i+1]=="FALSE"){
        flag=flag+1 # se a proxima pos for igual a False flag e incrementada 
      }
    }
  }
  return(output)
}


val=15

input<-entrada(val)
output<-saida(input)
df<-data.frame(input,output)
df


