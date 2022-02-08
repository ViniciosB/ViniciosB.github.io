result <- 14 
while(sum(result)<=30){
  result <- sample(1:10,5)
  print(c(result,sum(result)))
}

