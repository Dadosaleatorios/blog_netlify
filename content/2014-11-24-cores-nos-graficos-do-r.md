---
title: Cores nos gráficos do R
author: dadosaleatorios
date: '2014-11-24'
categories:
  - linguagem R
slug: ./2014-11-24-cores-nos-graficos-do-r
image: 'images/blog/post-cores.png'
---

Muitas vezes queremos demonstrar mais de um objeto em um gráfico e, para isso, recorremos à cores diferentes. Quando são poucos elementos fica fácil escolher as cores, geralmente ficamos com 'black', 'red', 'green' e 'blue'. Mas e quando queremos mais cores, ou até mesmo, sair da mesmice? O R, geralmente, permite dois tipos de entrada de cor: RGB em [hexadecimal](http://pt.wikipedia.org/wiki/Sistema_de_numera%C3%A7%C3%A3o_hexadecimal) e através do nome das cores.

![](https://dadosaleatorios.files.wordpress.com/2014/11/d1edf-cores.jpg)

Ao total, o R possui 657 cores pré-definidas (isso é, com algum nome) que podem ser vistas através do comando colours(). Para facilitar na decisão da cor, fiz a função abaixo que nos auxiliar na hora de escolher quais cores iremos usar. Após colar a função no R, basta chamar ela (cores()), clicar nas cores desejadas e, ao fim, fechar a janela (se não fechar ou apertar 'Esc', o console permanecerá bloqueado). Os nomes das cores clicadas apareceram no console.

`cores <- function() {
 par(mar = c(0, 0, 0, 0) ,mgp = c(0, 0, 0))
 plot(c(0:24), type = 'n')
 c <- 0
 mouse <- function(b, x, y) {
  x <- as.integer(x * 26)
  y <- as.integer(y * 26)
  print(colors()[(x + 26 *y) %% 657 + 1])
  return()
 }
 k <- colours()[(1:26 ^ 2 - 1) %% 657 + 1]
 for (i in 1:26) {
  for (j in 1:26) {
   c <- c + 1
   polygon(c(j, j, j-1, j-1), c(i, i-1, i-1, i) - 1, col=k[(c - 1) %% 657 + 1])
  }
 }
 getGraphicsEvent('Clique numa cor para saber o nome dela', onMouseDown = mouse)
}
`

Ainda há outras opções como a rainbow(n), que retorna um vetor com n códigos hexadecimais de cor, na ordem do arco-iris. Dúvidas? Sugestões? Deixe seu comentário!
