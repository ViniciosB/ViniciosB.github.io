1+1; 1-3; 4*5;
Vazio <- NULL; Vazio
Ausente <- NA; Ausente
Constante <- 1; Constante
vetor1 <- c(4,3,5,1) #Dando um nome aos dados: vetor1
vetor2 <- c("Boa","Noite","!") #Dando um nome aos dados: vetor2
vetor1; vetor2 #Mostrando os dados
mode(vetor1); mode(vetor2)
mat1 <- matrix(c(1,2,3,4),2,2)
mat1
mat2 <- matrix(c(1,2,3,4),1,4)
mat2
id <- diag(3) #3 ´e a dimens~ao da matriz identidade
id
diagonal <- diag(5,3) #3 ´e a dimens~ao da matriz, 5 sua composi¸c~ao
diagonal
mat1
mat1+mat1; mat1-mat1
mat1*mat1
mat1%*%mat1
t(mat1)
solve(mat1)
nome <- c("Ricardo", "Haroldo", "Gabi", "Cosme", "Isabela", "La´is")
idade <- c(14, 7 , 41, 18, 32, 27)
Planilha <- data.frame(nome,idade); Planilha
rownames(Planilha) <- c("nome1","nome2","nome3","nome4","nome5","nome6")
colnames(Planilha) <- c("Nome","Idade")
Planilha
Lista <- list(mat1,Planilha); Lista
Planilha$Idade
Planilha[4,] 
Planilha[Planilha$Nome=="Cosme",]
subset(Planilha, Nome=="Cosme")
subset(Planilha, Idade>18)
Planilha[c("nome3","nome2"),"Nome"]

