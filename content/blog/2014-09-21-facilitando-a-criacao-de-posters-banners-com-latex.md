---
title: Facilitando a criação de posters/banners com LaTeX.
author: dadosaleatorios
date: '2014-09-21'
categories:
  - latex
slug: ./2014-09-21-facilitando-a-criacao-de-posters-banners-com-latex
image: 'images/blog/post-latex.png'
---

Muitas vezes quando precisamos expor nossos estudos e análises, precisamos fazer em forma de poster ou banner para apresentações em congressos e eventos.
E nem sempre está é uma tarefa fácil, mas vamos tentar simplificar utilizando o LaTeX com o pacote [baposter](http://www.brian-amberg.de/uni/poster/baposter/baposter_guide.pdf), que é um pacote bem simples porém com opções visuais bem bacanas.
Nesse primeiro momento vamos colocar um exemplo prático de um banner utilizando o _baposter _como vamos ver abaixo

    \documentclass[landscape,a0paper,fontscale=0.3]{baposter} <br></br>% Podemos ajustar o tamanho da fonte por aqui<br></br>\usepackage{graphicx} % Pacote para colocar imagens<br></br>\graphicspath{{figures/}} % Diretório para as figuras<br></br>\usepackage[brazil]{babel} <br></br>\usepackage[utf8]{inputenc} <br></br>\usepackage{amsmath} % Modo de escrita matemático<br></br>\usepackage{amssymb} % Símbolos no modo matemático <br></br>\usepackage[font=small,labelfont=bf]{caption} % Legenda de tabelas e figuras<br></br>\usepackage{multicol} % Ambientes multi-colunas<br></br>\newcommand{\compresslist}{ % Comando para reduzir espaços para usar dentro <br></br>%dos ambientes itemize/enumerate <br></br>\setlength{\itemsep}{1pt}<br></br>\setlength{\parskip}{0pt}<br></br>\setlength{\parsep}{0pt}<br></br>}<br></br>\definecolor{lightblue}{rgb}{0.145,0.6666,1} % Definindo cor

Até essa parte foi montado nosso preâmbulo, que é onde adicionamos os pacotes e definimos nosso documento a ser trabalho. Como podemos ver já estamos definindo nosso documento como um _**baposter**_ e dentro das opções deste documento em especifico escolhemos as opções _landscape_, _a0paper_ e _fontscale_.

  * _landscape/portrait_ ou Paisagem/retrato é a opção que cuida da posição que será disposta nosso documento. Podemos já adiantar que na opção _landscape_ por padrão temos 4 colunas porém podemos mudar isso e veremos adiante. Na opção _portrait_ temos 3 colunas por padrão.
  * _a0paper_ é a opção que define o tamanho do documento além dessa opção temos mas os seguintes tamanhos definidos:  _a1paper, a2paper, a3paper, a4paper, archE _além do já citado_ a0paper_
Essas definições acima foram de ambientes para o LaTeX a seguir vamos começar a trabalhar com as definições do pacote  _**baposter**_.

    \begin{poster}<br></br>{<br></br>headerborder=closed, % Adiciona borda a caixa de titulo<br></br>colspacing=1em, % Espaçamento de coluna<br></br>bgColorOne=white, % Cor do fundo gradiente esquerdo<br></br>bgColorTwo=white, % Cor do fundo gradiente direito<br></br>borderColor=lightblue, % Cor da borda<br></br>headerColorOne=black, % Cor de fundo para os títulos dos quadros, gradiente lado esquerdo.<br></br>headerColorTwo=lightblue, % Cor de fundo para os títulos dos quadros, gradiente lado direito.<br></br>headerFontColor=white, % Cor do texto para os títulos dos quadros<br></br>boxColorOne=white, % Cor de fundo dos quadros<br></br>textborder=roundedleft, % Formato das bordas dos quadros<br></br>headerheight=0.1\textheight, % Tamanho do espaço para títulos<br></br>headershape=roundedright, % Definição do formato da borda<br></br>headerfont=\Large\bf\textsc, % Definimos características do texto dos títulos.<br></br>linewidth=2pt % Largura da linha da borda<br></br>}

Essas definições são apenas alguns exemplos, vocês podem e devem brincar a vontade com elas. Agora que já definimos nosso modelo de quadro passaremos para a estruturação propriamente dita do nosso poster.
Após essas definições o trabalho fica realmente muito simples e pratico

Esse pacote trabalha com blocos para a melhor organização e estruturação dos conteúdos, para criar um bloco basicamente precisamos apenas do comando

    \headerbox{Titulo do bloco}{Opções de características}{Conteúdo}. <br></br>

Agora vamos mostrar as opções características basicas para a construção do Poster.

    Name = Nome de referencia do bloco, importante para utilização das opções de alinhamento.<br></br>Column = Coluna de referencia que o bloco onde o bloco deve ser criado.<br></br>Row = Linha de referencia que o bloco deve ser criado.<br></br>Span = Deve ser utilizado para expandir o numero de colunas a qual o bloco preenche, ou seja, <br></br>se você criar um bloco na coluna 2 e utilizar a opção Span=2 o bloco vai preencher <br></br>a coluna 2 e 3 do seu poster.<br></br>bottomaligned = Para alinhamento inferior dos blocos. Seu uso deve ser feito indicando <br></br>o Name do bloco referencia.<br></br>bellow = Esta opção indica se deseja colocar o bloco abaixo de algum outro já referenciado. <br></br>Também deve ser usado o nome referencia<br></br>aligned = Usado para alinhar o bloco a outro, deve ser utilizado o nome referencia do bloco.

Estas são apenas algumas das opções existentes, as quais acredito que seja o mínimo necessário  para escrever nosso poster.
Qualquer duvida estou a disposição!
Abaixo um exemplo simples sobre como podemos moldar um poster utilizando esse pacote.

![](https://dadosaleatorios.files.wordpress.com/2014/09/23cd1-conference_poster_4.png)
