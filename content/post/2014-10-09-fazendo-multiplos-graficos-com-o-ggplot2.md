---
title: Fazendo múltiplos gráficos com o ggplot2
author: dadosaleatorios
date: '2014-10-09'
categories:
  - linguagem R
slug: ./2014-10-09-fazendo-multiplos-graficos-com-o-ggplot2
image: 'images/blog/post-ggplot.png'
---

Fazer múltiplos gráficos de acordo com o nível de uma ou mais variáveis categóricas no ggplot2 é fácil: basta utilizar as funções [facet_grid](http://docs.ggplot2.org/current/facet_grid.html) ou [facet_wrap](http://docs.ggplot2.org/current/facet_wrap.html). Com essas funções, tudo que você fizer para um gráfico valerá para todos (tema, títulos, rótulos dos eixos). E nos casos que eu preciso gráficos independentes - não só com configurações diferentes, mas também gráficos de tipos diferentes - como faço?

Infelizmente, o ggplot2 não possui suporte para esse tipo de gráfico. Felizmente, os pacotes grid e o gridExtra acrescentam esse suporte. Através da função arrangeGrob do pacote gridExtra podemos fazer uma 'matriz' de gráficos - dividimos a área gráfica em X linhas e Y colunas - sendo que cada gráfico será um elemento da matriz. A função ainda apresenta alguns parâmetros possibilitando , entra outras coisas, acrescentar um título geral aos gráficos e notas de rodapé.

![](https://dadosaleatorios.files.wordpress.com/2014/10/57907-201010092b-2bgrafico2b1.png)

Entretanto, há alguns casos em que queremos dar destaque para algum gráfico, deixando-o maior que os demais. No pacote graphics do R, podemos fazer isso com a função [layout](http://stat.ethz.ch/R-manual/R-devel/library/graphics/html/layout.html), mas ele não funciona para gráficos do ggplot2. Procurando na internet, encontrei [essa função](http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_(ggplot2)/), que permite darmos esse destaque a alguns gráficos. Seu funcionamento é praticamente igual ao da função layout, mudando apenas que os gráficos e o layout são informados na mesma função, e não em momentos diferentes como ocorre na função original.

Para darmos o destaque devemos informar à função qual o formato que queremos dos gráficos através do parâmetro layout, que deve ser uma matriz com números de 1 a N, onde N é o número de gráficos. Por exemplo, para reproduzirmos os mesmos 4 gráficos anteriores, mas dando ênfase ao primeiro - colocando ele numa linha inteira só para ele, e os demais dividindo uma segunda linha - o parâmetro layout seria:

    > matrix(c(1, 1, 1, 2, 3, 4), nrow = 2, byrow = TRUE)<br></br>     [,1] [,2] [,3]<br></br>[1,]    1    1    1<br></br>[2,]    2    3    4<br></br>

Ou seja: o primeiro gráfico ocupará uma linha inteira (3 colunas), enquanto os 3 gráficos seguintes ocuparão a segunda linha, cada um com uma coluna. Note que o número informado na matriz representa a ordem que os gráficos são passados à função.

![](https://dadosaleatorios.files.wordpress.com/2014/10/5378c-201010092b-2bgrafico2b2.png)

Infelizmente a função não nos permite acrescentar textos após os gráficos (o título que aparece é o título do 1° gráfico, e não um título geral), mas já é de grande ajuda. Dúvidas, críticas ou sugestões? Deixe seu comentário!
