+++
author = "Bruno Lucian"
categories = []
date = 2020-06-30T03:00:00Z
draft = true
post-image = "/images/blog/bruno_lucian_titulos_site_v1_conceito_cinza.png"
slug = ""
tags = []
title = "MCMC - Um pequeno overview"

+++
O título desta postagem se refere à sigla MCMC da expressão Markov chain Monte Carlo. MCMC é um conjunto de técnicas, cujo uso promoveu uma considerável revolução dentro da Estatística algumas décadas atrás. A própria história da descoberta dessa técnica é interessante e será contada em outra postagem. O mais relevante aqui é sua importância científica.

A metodologia Bayesiana já era conhecida na Ciência há alguns séculos, desde os tempos de Bayes. Entretanto, ela esbarrava em 2 sérias dificuldades. A primeira dificuldade é filosófica pois muitos cientistas se opõe ao uso de informação prévia na inferência. Esse ponto foi discutido na postagem sobre o ponto de vista Bayesiano (publicada no dia 15/03/2013) e já foi basicamente superado. Por isso, não será repetido.  
  
A segunda dificuldade era de ordem prática. A inferência Bayesiana consiste na combinação da informação prévia com a informação dos dados. Isso geralmente leva a formulas intratáveis de forma exata. Aproximações precisam ser buscadas e várias tentativas foram feitas. Em geral, elas funcionavam bem em situações controladas ou de baixa complexidade. No entanto, à medida que a Ciência foi avançando, também avançou a complexidade dos problemas tratados, dificultando ainda mais o uso dessas técnicas.  
  
É nesse cenário que se inserem as técnicas MCMC. Elas são técnicas absolutamente gerais. Por conta disso, são capazes de fornecer boas aproximações mesmo em situações de razoável ou alta complexidade. Na realidade, não são conhecidas limitações ao seu uso. O seu maior impeditivo é o _custo computacional,_ isto é, a quantidade de contas necessárias para fazer essa técnica funcionar bem pode ser bastante alto aumentando assim o tempo necessário para se obter a resposta. Felizmente, o avanço computacional experimentado nas últimas décadas tem fornecido meios para processamento em tempo real na maioria dos problemas.  
  
**Como funciona o MCMC?**  
Como o nome diz, MCMC é uma técnica de Monte Carlo usando cadeia de Markov. Técnicas de Monte Carlo são baseadas em simulações estocásticas, isto é, simulações de valores de uma distribuição de probabilidade, usando computador. O que o Monte Carlo faz é aproximar uma distribuição de interesse por uma amostra extraída dessa distribuição. Note que Monte Carlo não tem nada de Bayesiano, quando descrito dessa forma. O que faz MCMC ser tão útil para o ponto de vista Bayesiano é que ela se presta muito bem para ser usado na aproximação de distribuições a posteriori dos parâmetros.  
  
Existem muitas técnicas não-iterativas ou diretas para gerar amostras de distribuições conhecidas. Essas técnicas não funcionam em problemas maiores, oriundos de modelos complexos e/ou com muitas componentes, por 2 motivos. Primeiro, as distribuições resultantes desses contextos são mais complicadas matematicamente. Segundo, esses contextos usualmente tem um número muito grande de parâmetros ou quantidades desconhecidas.  
  
É nesses cenários que o uso de cadeias de Markov se mostra mais útil. O que as cadeias de Markov fazem é propor um esquema iterativo de simulação onde cada iteração do algoritmo depende apenas da iteração anterior. Sob condições bastante gerais, as cadeias tem um comportamento limite bem definido, isto é, se for gerado um número suficientemente grande de iterações, a cadeia se aproximará de sua distribuição de equilíbrio. Ou seja, a cadeia passará a flutuar em torno dos valores de equilíbrio. A figura do início da postagem mostra o resultado de um MCMC, onde esse comportamento de equilíbrio pode ser observado após umas 200 iterações. A cadeia parece já ter atingido seu equilíbrio pois os valores variam sempre dentro de um mesmo intervalo. O que os esquemas MCMC fazem, em aplicações Bayesianas, é colocar a distribuição a posteriori de um dado problema como a distribuição de equilíbrio de uma cadeia de Markov.  
  
Pode parecer estranho que problemas grandes e complicados precisem de estrutura adicional, complicando-os ainda mais. Paradoxalmente, é essa estrutura adicional das cadeias de Markov que resolve o problema. O mais impressionante é que existem inúmeras cadeias de Markov que resolvem, dando uma flexibilidade muito grande ao usuário. Normalmente busca-se aquelas cadeias onde o número de iterações necessárias seja o menor possível e tenha o menor número de contas, diminuindo assim o custo computacional. Os esquemas mais conhecidos de fazer simulações usando cadeias de Markov são os amostradores de Gibbs e o algoritmo de Metropolis-Hastings.  
  
Ainda existem alguns problemas de ordem prática associados ao uso do MCMC. O maior deles é garantir que se atingiu o equilíbrio. A questão de encontrar a cadeia que atinja o equilíbrio com menor custo também é um problema relevante. Todas as questões vem sendo tratadas pelos pesquisadores e já existem soluções bastante razoáveis para essas questões. Com isso, a técnica MCMC vem sendo implementada cada vez mais em software estatístico e MCMC é cada vez mais adotado por pesquisadores de diversas áreas da Ciência para realizar suas análises estatísticas.