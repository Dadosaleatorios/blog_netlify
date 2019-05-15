+++
author = "Larissa Lima"
categories = ["SQL"]
date = "2019-04-27T23:31:44+00:00"
draft = true
slug = ""
tags = ["datascience", "SQL"]
title = "SQL Básico – Parte I"
undefined = "SQL - Parte I"

+++
# 

E aí galera! É a minha primeira vez escrevendo para o blog e hoje venho aqui compartilhar com vocês um pouco do meu aprendizado no curso básico de SQL. Pra quem não conhece, SQL (_Structured Query Language_) é uma das linguagens mais utilizadas para manipulação de bancos de dados. E pra quem deseja atuar nessa área, é fundamental o conhecimento dessa linguagem.

Nessa primeira etapa, aprendi os comandos básicos e mais utilizados. São eles: **SELECT** e **FROM**, os quais são chamados de _palavras-chave_. Vale ressaltar que as _palavras-chave_ não são _case-sensitive._ Ou seja, você pode escrevê-las com letras maiúsculas ou minúsculas.

Para começar, vamos a um exemplo.

Ex.: Suponha que temos uma tabela que contém informações de funcionários () de uma empresa multinacional, conforme ilustrado na tabela/figura abaixo. Nesta tabela está disponível variáveis como: identificação (id), nome (name), idade (age) e nacionalidade (nationality). Desejamos selecionar desta tabela o nome dos funcionários listados.

![](/uploads/Tabela1.jpeg "Tabela 1: Funcionários")

O comando para esta tarefa é dado por:

    SELECT nome
    FROM funcionários;

Onde, **SELECT** indica a variável a ser selecionada (neste caso, nome) e **FROM** indica a tabela a ser selecionada (_funcionários_).

É possível selecionar também múltiplas colunas de uma tabela. Basta separar com vírgulas os nomes das variáveis a serem selecionadas, como segue no próximo exemplo:

    SELECT nome, idade, nacionalidade 
    FROM funcionários;

Supondo que a nossa tabela tenha 10 variáveis e desejo selecionar todas elas, basta colocar um asterisco (__*__), ao invés de listar o nome de todas as dez variáveis no comando SELECT.

    SELECT * 
    FROM funcionários;

Agora pense no seguinte exemplo: temos uma nova tabela que contém informações sobre filmes, como o nome, ano de lançamento, idioma, país de origem, duração, entre outras variáveis como pode-se observar abaixo.

![](/uploads/Tabela2_Filmes.png)

Desejamos saber quais os idiomas que aparecem nessa tabela de filmes, **_sem repetição_**. Iremos aproveitar e **_ordenar_**, em ordem alfabética, a tabela pelo nome dos filmes. Para isso usamos os comandos DISTINCT e ORDER BY, respectivamente:

    SELECT DISTINCT lingua 
    FROM filmes 
    ORDER BY nome;

Como dito anteriormente, os comandos principais são SELECT e FROM. Porém, outros comandos vão sendo usados conforme necessidade de cada problema.

Se precisamos contar o número de linhas de uma tabela, por exemplo, usamos o comando **COUNT**.

Então voltando para a tabela _filmes_ ilustrada acima_._ Se desejamos contar o número de países (**sem repetição/duplicata**), precisamos fazer:

    SELECT COUNT (DISTINCT país) 
    FROM filmes;

Na linguagem SQL, para fazer comentários em múltiplas linhas devemos usar ***/ (comentário) */**: