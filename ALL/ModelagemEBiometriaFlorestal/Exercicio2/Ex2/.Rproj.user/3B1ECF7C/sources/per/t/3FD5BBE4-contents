#Exemplo1

x <- c(2005, 2010, 2015, 2020)
y <- c(320,335,340,368)

plot(x,y,cex=2); abline(lm(y~x))
lm(y~x)

X <- as.matrix( cbind(1,x) )
y <- as.matrix(y)

## Equação de Mínimos Quadrados (EQM): b = (X' * X)^{-1} * X' * y
# multiplicação de matrizes é " %*% "
# transposta é " t() "
# inversão de matrizes é ' solve() '

t(X) 						#step1
t(X)%*%X 					#step2
solve(t(X)%*%X) 				#step3
solve(t(X)%*%X)%*%t(X)		#step4
solve(t(X)%*%X)%*%t(X)%*%y		#step5

#Exemplo2

x1 <- c(2005, 201
        #Exemplo2
        
        x1 <- c(2005, 2010, 2015, 2020) #anos
        x2 <- c(24.2, 23.5, 26.8,25.0) #temperatura média anual
        y <- c(320,335,340,368)
        
        plot(x1,x2,cex=2); abline(lm(x2~x1))
        plot(x1,y,cex=2); abline(lm(y~x1))
        plot(x2,y,cex=2); abline(lm(y~x2))
        
        cor(x1,x2)
        cor(x1,y)
        cor(x2,y)
        
        ##de forma direta:
        lm(y~x1+x2)
        
        summary( lm(y~x1) )
        summary( lm(y~x1+x2) )
        