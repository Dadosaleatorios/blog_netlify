---
title: Cartão de Natal com o R
author: ''
date: '2018-12-26'
slug: cartao-de-natal-com-o-r
categories:
  - visualização da informação
tags: []
description: ''
topics: []

---


Já pensou em fazer um cartão de Natal utilizando a plataforma que os nerds dos dados mais gostam? 
Claro que estou falando do R, então aqui vamos montar uma "Árvore de Natal" utilizando o R com a possibilidade de escrever texto e adicionar quantas bolinhas de Natal desejar.

Essa ideia surgiu para representar os participantes do grupo de ciencia de dados que temos no whatsApp e que foi de grande colaboração durante todo o ano. Então cada bolinha representa um participante desse grupo. 

Agora explicando brevemente o que estamos fazendo:
A programação consiste basicamente em produtos Matriciais, vetor de probabilidades e tamanho amostral para definir o número de pontos, utilizando apenas o pacote básico do R (*base*). 

Abaixo teremos o passo a passo explicando como criar a sua própria árvore de natal.

Cada linha é uma transformação linear de uma matrix 2x2

Matrizes de entrada, são a **L**, **B** e a partir delas vamos criar a **x**.

```{r}
L <-  matrix(
  c(0.03,  0,     0  ,  0.1,
    0.85,  0.00,  0.00, 0.85,
    0.8,   0.00,  0.00, 0.8,
    0.2,  -0.08,  0.15, 0.22,
    -0.2,   0.08,  0.15, 0.22,
    0.25, -0.1,   0.12, 0.25,
    -0.2,   0.1,   0.12, 0.2),
  nrow=4)

L

```

e cada linha é uma uma translação do vetor

```{r}
B <- matrix(
  c(0, 0,
    0, 1.5,
    0, 1.5,
    0, 0.85,
    0, 0.85,
    0, 0.3,
    0, 0.4),
  nrow=2)

B

prob = c(0.02, 0.6,.08, 0.07, 0.07, 0.07, 0.07)

```

Vamos agora iterar o processo criando uma matrix *2x100k*, ou seja 2 linhas e 100.000 colunas, que são o resultado da multiplicação matricial das submatrizes de **L** e o passo anterior de **x**, o ponto inicial é o `x = c(0,2) `, um subvetor de **B**

```{r}
N = 1e5 #número de iterações 
x = matrix(NA, nrow = 2, ncol = N)
x[, 1] = c(0, 2)   # ponto inicial

k <- sample(1:7, N, prob, replace = TRUE) #Amostra com indices

for (i in 2:N)
x[, i] = crossprod(matrix(L[, k[i]], nrow = 2), x[, i - 1]) + B[, k[i]] # iteração para construção dos pontos da nossa Árvore 

```
escolhemos 100000 pontos que já é suficiente para a visão de árvore que queremos.

Podemos fazer as seguintes modificações no código a cima para melhor e deixar a sua árvore como vc deseja. 

```{r, eval=F}
par(bg='darkblue',mar=rep(0,4))
plot(x=x[1,],y=x[2,],
     col=grep('green',colors(),value=TRUE),
     axes=FALSE,
     cex=.1,
     xlab='',
     ylab='' )
```

- Dentro da função `par` podemos modificar a cor de fundo com o parametro `bg`
- O parâmetro `col` dentro da função `plot` é usado para escolher as cores das folhas.
- O parâmetro `cex` dentro da função `plot` é usado para escolher o tamanho que serão representados os pontos.

```{r, eval=FALSE}
bals <- sample(N,257)

points(x=x[1,bals],y=x[2,bals]-.1,
       col= c('red','blue','yellow','orange'),
       cex=1.5,
       pch=19
)

```

- Nossa árvore foi criada com 257 bolas de enfeite representando cada um dos usuários do grupo Estatística & Data Science. 

```{r, eval=FALSE}
text(x=-.7,y=8,
     labels='Feliz',
     adj=c(.5,.5),
     srt=45,
     vfont=c('script','plain'),
     cex=3,
     col='gold'
)

text(x=0,y=9.5,
     labels='Estatistica & Data Science 2',
     adj=c(.5,.5),
     vfont=c('script','plain'),
     cex=2,
     col='gold'
)

text(x=0.7,y=8,
     labels='Natal',
     adj=c(.5,.5),
     srt=-45,
     vfont=c('script','plain'),
     cex=3,
     col='gold'
)

```

- O parâmetro `adj` na função `text` é a posição que seu texto estará alinhado.
- O parâmetro `srt` na função `text` é o angulo que seu texto vai estar alinhado.


```{r, echo=F, fig.align='center'}
par(bg='darkblue',mar=rep(0,4))
plot(x=x[1,],y=x[2,],
     col=grep('green',colors(),value=TRUE),
     axes=TRUE,
     cex=.1,
     xlab='teste',
     ylab='razao' )#,pch='.')

bals <- sample(N,257)
points(x=x[1,bals],y=x[2,bals]-.1,
       col= c('red','blue','yellow','orange'),
       cex=1.5,
       pch=19
)
text(x=-.7,y=8,
     labels='Feliz',
     adj=c(.5,.5),
     srt=45,
     vfont=c('script','plain'),
     cex=3,
     col='gold'
)

text(x=0,y=9.5,
     labels='Estatistica & Data Science',
     adj=c(.5,.5),
     #srt=45,
     vfont=c('script','plain'),
     cex=2,
     col='gold'
)

text(x=0.7,y=8,
     labels='Natal',
     adj=c(.5,.5),
     srt=-45,
     vfont=c('script','plain'),
     cex=3,
     col='gold'
)

```



#### Fonte: 
- https://www.r-bloggers.com/merry-christmas-5/
- http://blogs.sas.com/content/iml/2012/12/14/a-fractal-christmas-tree/











