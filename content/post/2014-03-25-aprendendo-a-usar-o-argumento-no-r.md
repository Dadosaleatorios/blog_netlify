---
title: Aprendendo a usar o argumento '...' no R
author: dadosaleatorios
date: '2014-03-25'
categories:
  - avancado
  - linguagem R
slug: ./2014-03-25-aprendendo-a-usar-o-argumento-no-r
---

A utilização do parâmetro **'...'** é algo que sempre me gera dúvidas, pois sempre me questiono por qual motivo ninguém nunca me falou sobre antes. Esta foi uma das minhas recentes descobertas no [R](http://cran.r-project.org/) e ajudou a entender muitas coisas que até então passavam despercebidas. Caso você seja um usuário recorrente da linguagem, bem provavelmente vai entender do que estou falando, afinal quem nunca topou com o argumento **'...'** ao ler o help de uma função qualquer?

Acontece que ao criar uma função você pode definir um argumento que será passado como argumento para outra função a ser chamada. Por exemplo, vamos supor que você tenha uma função que pode fazer duas coisas: Se o número de observações for maior que 30, faz um histograma, caso contrário faz um boxplot. Então o código para esta função poderia ser o seguinte:

    grafico<-function(x)<br></br>{<br></br>    if(length(x)<30)<br></br>    {<br></br>        boxplot(x)<br></br>    }<br></br>    else<br></br>    {<br></br>        hist(x)<br></br>    }<br></br><br></br>}<br></br>

O problema é relativamente simples, e a função para resolvê-lo idem. Porém podem acontecer algumas complicações se fizermos uma nova proposta. Como sabemos, a função boxplot e hist possuem muitas opções de personalização (número de classes do histograma, se desejamos ou não plotar os outliers e por aí vai...). Então com base nesta nova proposta desejamos não apenas fazer o gráfico, mas também passar todas estas opções de personalização. Neste caso, uma opção seria inserir os novos parâmetros.

    grafico<-function(x, bp.outliers=FALSE, hist.prob=TRUE )<br></br>{<br></br>    if(length(x)<30)<br></br>    {<br></br>        boxplot(x, outline=bp.outliers)<br></br>    }<br></br>    else<br></br>    {<br></br>        hist(x, probability=hist.prob)<br></br>    }<br></br><br></br>}<br></br>

Feito isso, agora podemos não apenas fazer o gráfico, mas também definir alguns parâmetros. Vamos supor que não quiséssemos definir apenas um parâmetro das funções que fazem o gráfico, mas sim muitos. A coisa ficaria verdadeiramente confusa e trabalhosa, uma vez que deveríamos passar todos os parâmetros para a função gráfico, e posteriormente escrevê-los novamente nas funções que efetivamente o fazem. É exatamente nesta situação que o parâmetro **'...'** aparece.

    grafico<-function(x, ... )<br></br>{<br></br>    if(length(x)<30)<br></br>    {<br></br>        boxplot(x, ...)<br></br>    }<br></br>    else<br></br>    {<br></br>        hist(x, ...)<br></br>    }<br></br><br></br>}<br></br>

Com isso, não é mais necessário definir os parâmetros quando se escreve a função. A única necessidade é escrevê-los quando for chamar a função e isto melhora muito a compreensão do código. No caso anterior, a chamada da função gráfico seria a seguinte:

```r
grafico(rnorm(100), outline=F, probability=F)
```

Bom, esta é uma técnica super simples que possui um custo quase nulo para ser implementada, e acreditem que isto é tudo que você precisa saber sobre o parâmetro **'...'** para utilizá-lo. Escrever a função principal torna-se mais simples e funcional, uma vez que economiza-se tempo escrevendo o código e você passa a se preocupar apenas com os reais parâmetros da função que está criando. O resto - que será utilizado por funções auxiliares - não importa muito, afinal tudo não passa de **'...'** .
