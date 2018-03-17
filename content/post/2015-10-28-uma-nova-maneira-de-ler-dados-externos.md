---
title: Uma nova maneira de ler dados externos
author: dadosaleatorios
date: '2015-10-28'
categories:
  - linguagem R
slug: ./2015-10-28-uma-nova-maneira-de-ler-dados-externos
---

Há cerca de 2 anos atrás [postei uma pergunta no StackOverflow](http://stackoverflow.com/questions/18720036/reading-big-data-with-fixed-width) (caso não conheça, leia [esta postagem nossa](http://www.dadosaleatorios.com.br/2014/12/stackexchange.html)) perguntando como podia fazer para ler grandes bancos de dados, de cerca de 600mb - esse era meu primeiro contato com bancos grandes, provenientes do Censo Escolar. Das duas respostas dadas na época, a que mais me agradou usava o pacote [sqldf](https://cran.r-project.org/web/packages/sqldf/index.html), que utiliza SQL para fazer a leitura e manipulação de fontes externas de dados.

Há pouco mais de 1 mês um usuário postou uma [nova resposta](http://stackoverflow.com/a/32821920/2016092) à pergunta, utilizando o pacote [readr](https://cran.r-project.org/web/packages/readr/index.html). O pacote é um dos muitos pacotes criados/mantidos por Hadley Wickham - que criou, além desse e do [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html), mais de [50 pacotes para o R](https://barryrowlingson.github.io/hadleyverse/#1) - o que significa que vale a pena dedicarmos um tempo para estudarmos o pacote.

O pacote possui sua própria versão dos comandos read.delim() (e, de quebra, read.table(), read.csv() e read.csv2()) e read.fwf() - para arquivos de largura fixa (**f**ixed **w**idth **f**ormated), com sintaxes e nomes praticamente idênticas aos do pacote base - basta trocar o . por _ na função. Além do ganho de velocidade frente à outros pacotes disponíveis ([link](http://stackoverflow.com/questions/24715894/faster-way-to-read-fixed-width-files-in-r) - note que há referência a mais um pacote do Hadley, o [stringi](https://cran.r-project.org/web/packages/stringi/index.html)), vale a pena destacar  dois pontos : 1) ele possui uma progressbar (não funciona muito bem no Windows, mas está la!); 2) nos arquivos de largura fixa é possível ler somente as variáveis de interesse, e não todo o banco.

E você, utiliza outro pacote do Hadley, ou conhece algum pacote que valha a pena 'perder tempo' estudando? Tem sugestão de outros pacotes que merecem uma postagem? Deixe seu comentário!
