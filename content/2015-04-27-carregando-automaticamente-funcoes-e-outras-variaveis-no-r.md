---
title: Carregando automaticamente funções e outras variáveis no R
author: dadosaleatorios
date: '2015-04-27'
categories:
  - linguagem R
slug: ./2015-04-27-carregando-automaticamente-funcoes-e-outras-variaveis-no-r
---

Quem trabalha com R sabe que é necessário, sempre que se abre o R, recarregar todos pacotes e funções que se deseja. E isso pode se tornar trabalhoso e repetitivo, especialmente quando se utiliza sempre os mesmos. Mas existe uma maneira de automatizar isso - e bem simples até!

Sempre que o R é iniciado ele irá executar o arquivo Rprofile.site (ele fica na pasta R\x.x.x\etc, e pode ser aberto com o bloco de notas). Se você for ver, você possui esse arquivo, já com algumas sugestões de comandos. Após executar o Rprofile.site, o R irá procurar o comando .Rprofile em duas pastas: a pasta de trabalho do R (**getwd()**) e a pasta do usuário (na falta de uma definição em português, sugiro a [Wikipedia](http://en.wikipedia.org/wiki/Home_directory)). Assim como o Rprofile.site, .Rprofile nada mais é do que um arquivo de texto com a extensão alterada.

Esses arquivos permitem que você crie funções que serão chamadas assim que o R for completamente carregado ou for encerrado. São elas: **.First()** e** .Last() **(com o . antes, que faz com que a função não seja listada pela função** ls()**), respectivamente. Portanto, basta criar essas funções com os comandos que vocês querem que sejam executados sempre. Segue uma lista de sugestões:

  * setwd(diretório) - Para mudar a pasta padrão de o R irá ler e salvar arquivos externos;
  * library(pacote) - Para carregar o pacote desejado;
  * source(arquivo) - Para executar** **um código externo (equivalente a copiar e colar o conteúdo no R);
  * load(arquivo) - Para carregar uma área de trabalho;
  * setInternet2() - Para quem precisa usar proxy para acessar a internet

Existem ainda outras maneiras, como criar as funções .First() e .Last() numa seção normal do R e fechar ele salvando a área de trabalho. Assim que o R for iniciado ele irá carregar a área de trabalho anterior e, por consequência, a função .First() (mas esse método gerará a mensagem [Área de trabalho anterior carregada] assim que o R for aberto, algo que o .Rprofile e Rprofile.site não gera). Dúvidas? Sugestões? Deixe o seu comentário!
