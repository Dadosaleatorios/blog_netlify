---
title: Introdução ao dplyr
author: dadosaleatorios
date: '2018-08-31'
slug: introdução-ao-dplyr
categories:
  - analise de dados
  - data science
  - estatistica
  - iniciantes
  - linguagem R
---

`dplyr` é um pacote do R para manipulação de dados, sendo um dos pacotes que forma o núcleo do (`tidyverse`)[https://www.tidyverse.org/], que tem como base poucos verbos que resolvem boa parte dos problemas envolvendo manipulação de dados. O fato de o dplyr ser parte do tidyverse permite que nós facilmente o usemos integrado com outras funções de outros pacotes do tidyverse.

Um outro ponto é que o dplyr permite que nós façamos um código facilmente legível e compreensível, justamente pelo fato de usar verbos, e o encadeamento, que faz com que a sequência do código seja mais próxima da maneira com que pensamos. Além disso, o pacote é bem rápido, ainda que não seja tão rápido quanto o data.table (que não tem uma sintaxe simples de utilização).

As funções do dplyr podem ser utilizadas para manipular tabelas do SQL, sem importar a tabela para o R (utilizando lazy query). Para isso veja este artigo sobre Databases com dplyr. Existe também uma comunidade grande de programadores do R que utilizam o pacote.