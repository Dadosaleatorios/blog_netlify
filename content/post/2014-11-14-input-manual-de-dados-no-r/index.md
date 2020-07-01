---
title: Input manual de dados no R
author: dadosaleatorios
date: '2014-11-14'
categories:
  - iniciantes
  - linguagem R
slug: ./2014-11-14-input-manual-de-dados-no-r
---

Vamos utilizar um editor, como a vizualização de folha de dados do excel para inputar nossos dados ao R.

dados <- data.frame(Idade=numeric(0), Sexo=character(0), Peso=numeric(0))
dados <- edit(dados)

![](./imagem-01.png)

Após entrar com todos os dados que necessitar, podemos simplesmente fechar o editor e teremos um data.frame salvo na variável dados =)

Depois de fechar o editor podemos chamar a variável dados e vamos obter o seguinte resultado.

![](./imagem-02.png)

Bom essa é a dica, bem simples e rápida.
