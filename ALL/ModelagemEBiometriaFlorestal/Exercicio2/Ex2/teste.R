n=4
j=1
for(i in 1:n){
  j=j*i
}
print(j)


j=j*1
j=j*2
j=j*3
j=j*4
print(j)
vet<-round(runif(round(runif(1,1,60)),1,5))
print(vet[1])
print(vet[2])
print(vet[3])
print(vet[4])
      .
      .
      .
print(vet[60])

vet<-round(runif(round(runif(1,1,60)),1,5))
for(i in 1:length(vet)){
  print(vet[i])
}
x=1
while(x<=10){
  print(x)
  x=x+1
}

