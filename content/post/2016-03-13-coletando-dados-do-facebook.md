---
title: Coletando dados do Facebook
author: dadosaleatorios
date: '2016-03-13'
categories:
  - API
  - facebook
  - web scraper
slug: ./2016-03-13-coletando-dados-do-facebook
image: 'images/blog/post-facebook.png'
---

Em nossas últimas postagens mostramos duas maneiras de extrair informações de sites: [através do código fonte do site, manipulando diretamente no R](http://www.dadosaleatorios.com.br/2016/01/baixando-e-interpretando-sites-ou-como.html) e [através do pacote RSelenium](http://www.dadosaleatorios.com.br/2016/02/primeiros-contatos-com-o-rselenium.html). Nesta postagem falaremos uma terceira maneira: o uso de [API](https://pt.wikipedia.org/wiki/Interface_de_programa%C3%A7%C3%A3o_de_aplica%C3%A7%C3%B5es), exemplificando com a API do Facebook.

O Facebook permite que certos dados sejam coletados através da [Graph API](https://developers.facebook.com/docs/graph-api), permitindo com que a análise seja feita em qualquer linguagem de programação. O uso dela é bastante simples, bem documentado e possui um [ambiente de teste](https://developers.facebook.com/tools/explorer/), que permite formular e testar as querys a serem utilizadas. Agora, vamos aos exemplos!

#### Autenticação

Antes de solicitar qualquer dado, obviamente você precisa se identificar, e a Graph API utiliza um token como autenticação. Para gerar ele, basta entrar na [Graph API Explorer](https://developers.facebook.com/tools/explorer/) e clicar no botão 'Get Token' => 'Get User Access Token' e marcar as opções que você quer ter a API tenha acesso. Para os exemplos daqui, será necessário autorizar o acesso a 'user_posts'

#### Exemplo 1: Pegando as últimas postagens

Após a criação do token é bastante fácil obter informações. Por exemplo, para pegar as últimas 25 postagens o comando é (no final da postagem tem um link com o código comentado):

`token <- '' # Colar aqui o token!
readLines(sprintf("https://graph.facebook.com/v2.5/me/posts?access_token=%s", token)) # Ignorem a mensagem de warning`

O resultado é uma única string formatada como [](https://pt.wikipedia.org/wiki/JSON)[](https://www.blogger.com/)[JSON](https://pt.wikipedia.org/wiki/JSON), que pode ser interpretada com ajuda do comando fromJSON do pacote [jsonlite](https://cran.r-project.org/web/packages/jsonlite/index.html). É possível ver a estrutura do resultado através do comando str() - uma lista de tamanho 2, sendo a primeira (data) um data.frame com 4 variáveis (message, created_time, id e story) e a segunda (paging) uma lista com 2 elementos - os links para as páginas anteriores e seguintes.

`fromJSON(readLines(sprintf("https://graph.facebook.com/v2.5/me/posts?access_token=%s", token)))
str(fromJSON(readLines(sprintf("https://graph.facebook.com/v2.5/me/posts?access_token=%s", token))))`

No código disponibilizado no final da postagem há um exemplo de como pegar todas as suas postagens e estrutura-las em um data.table(), junto com alguns exemplos de estatísticas [básicas].

#### Exemplo 2: Pegando as informações (comentários, curtidas e compartilhamentos) de uma postagem

Assim como simples obter as postagens é simples, obter informações sobre uma postagem também é bastante fácil, basta saber qual o ID da postagem - um código numérico composto por duas partes: o id do autor e o id da postagem. Caso você tenha rodado o código anterior, o ID da postagem estará na coluna 'id' do data.table

`
id <- 'xxx_yyy' # Colar aqui o id
fromJSON(readLines(sprintf("https://graph.facebook.com/v2.5/%s/?access_token=%s", id, token)))`

Assim obtemos a data e conteúdo da postagem. Para pegar os comentários, curtidas e compartilhamentos, basta acrescentar comments, likes ou sharedposts antes do ?

`fromJSON(readLines(sprintf("https://graph.facebook.com/v2.5/%s/?access_token=%s", id, token)))
fromJSON(readLines(sprintf("https://graph.facebook.com/v2.5/%s/comments?access_token=%s", id, token)))
fromJSON(readLines(sprintf("https://graph.facebook.com/v2.5/%s/likes?access_token=%s", id, token)))
fromJSON(readLines(sprintf("https://graph.facebook.com/v2.5/%s/sharedposts?access_token=%s", id, token)))`

Novamente, o objeto retornado é uma lista de tamanho 2, com a mesma estrutura vista anteriormente - um elemento dos dados e outro elemento da paginação. Como geralmente as pessoas/desenvolvedores estão interessados apenas no número de curtidas/comentários/compartilhamentos, é possível pedir o número através do parâmetro summary:

`fromJSON(readLines(sprintf("https://graph.facebook.com/v2.5/%s/likes?access_token=%s&summary=true", id, token))) `

#### Considerações finais

Embora nossos exemplos tenham ficado apenas nas postagens do usuário, a API do Facebook permite coletar praticamente todas informações contidas no site, além de postar conteúdo. Outras redes sociais também possuem APIs ([Instagram](https://www.instagram.com/developer/), [Twitter](https://dev.twitter.com/)), que serão temas de postagens aqui no blog. O código completo dos exemplos está no meu [GitHub](https://goo.gl/E2nHTI), junto com alguns exemplos que não foram utilizados na postagem - como uma wordcloud das postagens. Dúvidas? Sugestões? Deixe seu comentário!
