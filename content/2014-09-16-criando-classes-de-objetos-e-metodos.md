---
title: Criando classes de objetos e métodos
author: dadosaleatorios
date: '2014-09-16'
categories:
  - Sem categoria
slug: ./2014-09-16-criando-classes-de-objetos-e-metodos
---

Muitos dos objetos que manuseamos no R possuem mais informações do que costumamos ver. Por exemplo, em uma regressão linear tudo que o R mostra são os coeficientes do modelo e o comando utilizado, mas ao utilizarmos o comando str() vemos que na verdade o resultado é uma lista com pelo menos 12 elementos (sendo que alguns elementos também são listas). Então, o que diferencia essa lista das listas criadas pelo list()? A resposta é simples: a sua classe.

Algumas vezes criamos funções que não retornam apenas o resultado desejado, mas também informações adicionais, que podem ou não vierem a serem úteis mais para frente. Essas informações nem sempre são interessantes de serem exibidas ao darmos print no resultado. Voltamos ao exemplo da regressão linear: um dos elementos da lista resultante são os resíduos do modelo, informação extremamente importante para analisar a adequabilidade do modelo, mas que não acrescenta nada se for exibido junto com o modelo (a menos que você seja capaz de realizar a análise residual de olho...) e por isso eles são omitidos na hora da exibição do modelo. Mas como fazer isso para a minha função? A resposta também é simples: crie uma classe e métodos próprio.

Criar uma classe própria é bastante direto: basta atribuir um valor à função class(objeto). Por exemplo, podemos ter uma função que retorne os valores simulados de uma normal e os parâmetros da simulação:

    simular <- function(n, mean = 0, sd = 1) {<br></br> out <- list()<br></br> out$param <- c(n, mean, sd)<br></br> out$valores <- rnorm(n = n, mean = mean, sd = sd)<br></br> class(out) <- 'simul' # Aqui está o truque!<br></br> out<br></br>}

Ao executarmos simular(100), é exibido na tela a lista no formato padrão, com exceção do final, que aparece:

    attr(,"class")<br></br>[1] "simul"<br></br><br></br>

Isso mostra que nosso objeto possui uma classe diferente da esperada (simul). Agora basta criarmos a função print.simul para alterar o formato de exibição. Essa função será chamada sempre que um objeto da classe simul for impresso. Por exemplo:

    print.simul <- function(x) {<br></br> cat(sprintf('Parâmetros da simulação:\n Tamanho: %d\n Média: %f\n Desvio padrão: %f\nResultados obtidos:\n Média: %f\n Desvio padrão: %f\n', x$param[1], x$param[2], x$param[3], mean(x$valores), sd(x$valores)))<br></br>}

Agora, ao executarmos simular(100) temos um resultado completamente diferente:

    > simular(100)<br></br>Parâmetros da simulação:<br></br> Tamanho: 100<br></br> Média: 0.000000<br></br> Desvio padrão: 1.000000<br></br>Resultados obtidos:<br></br> Média: 0.103326<br></br> Desvio padrão: 0.902471

Várias outras funções também permitem a criação de métodos específicos como plot, summary, predict, ... O comando  methods() permite visualizar tanto quais as classe que possuem métodos específicos para uma função (methods(generic.function = plot)) tanto quais são os métodos específicos disponíveis para uma determinada classe (methods(class = 'data.frame')). Qualquer dúvida, crítica e sugestão, é só comentar!
