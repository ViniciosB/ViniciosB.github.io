setwd("C:/Users/vinic/Documents/GitHub/viniciosb.github.io/ModelagemEBiometriaFlorestal")
input <- c(F,F,F,T,F,F,F,T,T,T,F,F,F,F,T,T,F,F,F,F,F,T,T,F)                       #entrada do input
#output <- c(NA,NA,NA,1,NA,NA,NA,2,2,2,NA,NA,NA,NA,3,3,NA,NA,NA,NA,NA,4,4,NA)     #entrada do output
#output
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
print(output)
######################################################
