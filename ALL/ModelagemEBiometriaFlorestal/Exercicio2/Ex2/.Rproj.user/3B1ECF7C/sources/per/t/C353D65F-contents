rm(list=ls(all=TRUE))
setwd("C:/Users/vinic/Documents/GitHub/viniciosb.github.io/ALL/ModelagemEBiometriaFlorestal/Exercicio2/Ex2")
require('wakefield')


limpa<-function(){
  cat("\014")  
}

entrada<-function(n){
  # inpt<-c()
  # for(i in 1: n){
  #   x=sample(0:1,1,replace = TRUE)
  # 
  #   if(x==0){
  #     inpt[length(inpt)+1]=F
  #   }
  #   else{
  #     inpt[length(inpt)+1]=T
  #   }
  # 
  # }
  # return(inpt)
  return(r_sample_logical(n, prob = NULL, name = "Logical"))
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
      if(i!=length(input) && input[i+1]=="FALSE"){
        flag=flag+1 # se a proxima pos for igual a False flag e incrementada 
      }
    }
  }
  return(output)
}

men<-c("Input aleatorio","Input por vetor no Fonte","Input por arquivo CSV")
input <- c(F,F,F,T,F,F,F,T,T,T,F,F,F,F,T,T,F,F,F,F,F,T,T,F)                         #entrada do input
#output <- c(NA,NA,NA,1,NA,NA,NA,2,2,2,NA,NA,NA,NA,3,3,NA,NA,NA,NA,NA,4,4,NA)     
limpa()
estado<-menu(men, graphics = TRUE, title = NULL)
limpa()

if(estado==1){
  limpa()
  cat('informe o numero de valores aleatorios: ')
  texto <- readLines(n = 1)
  val=strtoi(texto)
  input<-entrada(val)
  output<-saida(input)
  df<-data.frame(input,output)
  limpa()
  df
  
  
}else if(estado==2){
  if(length(input)!=0 && typeof(input)=="logical"){
    output<-saida(input)
    df<-data.frame(input,output)
    limpa()
    df
  }else{
    limpa()
    cat("VETOR VAZIO")
  }

}else{
  input<-c(read.csv("inp.csv",header = T)$input)
  if(length(input)!=0){
    output<-saida(input)
    df<-data.frame(input,output)
    limpa()
    df
  }else{
    limpa()
    cat("VETOR VAZIO")
  }
}











