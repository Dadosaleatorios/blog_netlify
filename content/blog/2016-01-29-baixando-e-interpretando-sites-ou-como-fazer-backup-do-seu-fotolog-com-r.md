---
title: 'Baixando e interpretando sites (ou: como fazer backup do seu fotolog) com
  R.'
author: dadosaleatorios
date: '2016-01-29'
categories:
  - linguagem R
slug: ./2016-01-29-baixando-e-interpretando-sites-ou-como-fazer-backup-do-seu-fotolog-com-r
featured_image: 'images/blog/post-fotolog.png'
---

Se você usava a internet no início dos anos 2000, muito provavelmente teve - ou quis ter - um [Fotolog](https://en.wikipedia.org/wiki/Fotolog). Como o próprio nome diz, era um blog voltado a fotografia, onde as pessoas podiam postar 1 foto por dia (ou 6, caso pagasse). Em 01/01/2016, o Fotolog encerrou suas atividades sem aviso prévio, gerando uma comoção nos mais saudosistas, voltando ao em final de janeiro com um aviso de que o site ficaria mais um mês online, permitindo que as pessoas fizessem backup. E agora que entra a parte de R da postagem.

Como já mostramos em [outras postagens](http://www.dadosaleatorios.com.br/2015/10/r-tambem-pode-ser-diversao.html), o R é uma linguagem de programação bastante poderosa e versátil, podendo ser utilizada para coisas além da estatística. Por ser a única linguagem que eu domino (e por ter mais de 500 fotos no Fotolog), resolvi fazer uma função em R para fazer um backup dele, salvando foto, descrição e comentários. Pelo site ser bastante antigo, ele não possui uma [API](https://pt.wikipedia.org/wiki/Interface_de_programa%C3%A7%C3%A3o_de_aplica%C3%A7%C3%B5es) que facilitasse a minha vida, e com isso tive que interpretar a página do Fotolog com as ferramentas que o R disponibiliza, mais especificamente, com expressão regular.

[Expressão regular](https://pt.wikipedia.org/wiki/Express%C3%A3o_regular) (ou regex, para os mais íntimos) é - resumidamente - uma maneira de localizar sequencias de caracteres em strings, de forma bastante flexível. A grande 'mágica' nas ER é que você pode procurar por padrões de caracteres, informando desde possíveis caracteres, o que deve (ou não deve) anteceder/suceder esses caracteres, quantidades, entre outras características do texto procurado. Caso você trabalha com bancos de dados que tenham string e se interessa por somente uma parte delas, aconselho fortemente a aprender ER. O help do R (?gsub) é um bom começo pois possui vários exemplos e o site [regex101](https://regex101.com/) permite que você teste elas em tempo real, além de listar todas as opções de tokens.

As funções que criei para fazer o backup estão no meu [Git](https://github.com/rcoster/blog/blob/master/2016_01_29%20-%20Backup%20fotolog.R), e são bastante simples (as instruções estão nas primeiras linhas). Acredito que elas serão de pouco uso para a maioria dos leitores do blog - até porque em 1 mês elas não funcionarão mais - mas ficam como sugestão de leitura para entender um pouco mais sobre ER - temos em mente fazermos uma postagem detalhada sobre elas, além de exemplificar algumas APIs de redes sociais atuais. Ficou com alguma dúvida? Tem alguma sugestão de postagem? Deixe seu comentário!
