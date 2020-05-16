---
title: Primeiros contatos com o RSelenium
author: dadosaleatorios
date: '2016-02-22'
categories:
  - Selenium
  - web scraper
slug: ./2016-02-22-primeiros-contatos-com-o-rselenium
---

Mostramos em nossa [última postagem](http://www.dadosaleatorios.com.br/2016/01/baixando-e-interpretando-sites-ou-como.html) que é possível baixar dados/arquivos de sites através do R - o site em questão era bastante antigo e simples, o que facilitou a extração das informações desejadas. Mas e quando o site é mais complexo e necessita que algumas ações sejam feitas no site antes de baixar os dados? Recentemente me foi dada a tarefa de baixar todas as tabelas do [Observatório do Trabalho de Porto Alegre](http://geo.dieese.org.br/poa/index.php) - um site um pouco mais complexo, que utiliza javascript. E agora, como fazer?

A solução encontrada foi utilizar o pacote [RSelenium](https://cran.r-project.org/web/packages/RSelenium/), um pacote que permite a interação do R com um servidor [Selenium](http://docs.seleniumhq.org/), que é quem faz toda interação com o site, baseado em comandos executados no R. Com ele, é possível localizar elementos (botões, links, textos, ...) em sites através de seu id, nome, texto (e outras características) e simular clicks - também é possível a execução direta de scripts da página. A instalação do Selenium é bastante simples e pode ser feita pelo pacote do R através do comando checkForServer() - caso o comando falhe (como aconteceu comigo) você precisará baixar manualmente a versão standalone no [site oficial](http://docs.seleniumhq.org/download/) e executar através do prompt - não tente fazer que nem eu e 'dezipar' o arquivo .jar.

Os comandos do RSelenium são bastante intuitivos, mas fazer um script nele requer noções em HTML e Javascript, pois você terá que explorar o código fonte da página - o que pode ser trabalhoso. O código comentado para esse script encontra-se no meu [GitHub](https://github.com/rcoster/blog/blob/master/Primeiros.contatos.com.o.RSelenium.-.Observatorio.do.Trabalho.r).

#### Um segundo contado com o RSelenium

Enquanto escrevia essa postagem, um pesquisador postou uma dúvida no grupo [R Brasil - Programadores](https://www.facebook.com/groups/1410023525939155): ele estava tentando fazer um web scraper para analisar o preço de vendas de apartamentos em Uberlândia [deste site](http://www.vivareal.com.br/venda/minas-gerais/uberlandia/apartamento_residencial/#1/), considerando as características do apartamento. Aproveitei a ideia e parte do código fornecido por ele para treinar um pouco mais de RSelenium. O código comentado também se encontra no meu [GitHub](https://github.com/rcoster/blog/blob/master/Primeiros.contatos.com.o.RSelenium.-.Precos.de.apartamento.em.Uberlandia.r), e você pode encontrar algumas análises destes dados no [blog do pesquisador](https://arnoldin.wordpress.com/2016/02/20/um-ensaio-de-web-scrapping-para-os-imoveis-de-uberlandia-12/).

#### Considerações finais

O RSelenium cumpre o prometido: permite [e facilita] a interação com servidores Selenium para automatizar a navegação em sites. Encontrei algumas dificuldades enquanto fazia esses 2 códigos, sendo a principal delas de que o Selenium não espera o site carregar completamente antes de executar o comando seguinte, fazendo com que o comando de erro e pare - e por isso os códigos possuem alguns Sys.sleep() no meio. Outra dificuldade que encontrei foi na mudança de navegador: o código que funciona para um navegador pode não funcionar em outro, como aconteceu no código para baixar os arquivos do Observatório do Trabalho: enquanto ele funciona no Firefox, não consegui rodar ele no Chrome.

Talvez (provavelmente) esses dois problemas sejam solucionáveis através de configuração do Selenium/RSelenium - até agora, não encontrei nada a respeito. E você, já usa o RSelenium? Tem alguma dúvida? Deixe seu comentário!
