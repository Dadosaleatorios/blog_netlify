+++
author = "Larissa Lima"
categories = ["SQL"]
date = "2019-04-27T23:31:44+00:00"
draft = true
slug = ""
tags = ["datascience", "SQL"]
title = "SQL - Primeiros Passos"
undefined = "SQL - Parte I"

+++
# 

E aí galera! É a minha primeira vez escrevendo para o blog e hoje venho aqui compartilhar com vocês um pouco do meu aprendizado no curso básico de SQL. Fiz o curso pelo DataCamp e super recomendo. Pra quem não conhece, SQL é uma das linguagens mais utilizadas para consulta, armazenamento e manipulação de bancos de dados e significa **_S_**_tructured **Q**uery **L**anguage_. E pra quem deseja atuar nessa área, é fundamental o conhecimento dessa linguagem.

Nessa primeira etapa, aprendi os comandos básicos mais utilizados. São eles: **SELECT** e **FROM**, os quais são chamados de _palavras-chave_. Vale ressaltar que as _palavras-chave_ não são _case-sensitive._ Ou seja, você pode escrevê-las com letras maiúsculas ou minúsculas. Porém para uma melhor visualização e organização do código, é recomendado utilizar letras maiúsculas. Ao finalizar cada consulta utiliza-se **";"**.

Para começar, vamos a um exemplo.

Ex.: Suponha que temos uma tabela que contém informações de funcionários (employees) de uma empresa multinacional, conforme ilustrado na tabela/figura abaixo. Nesta tabela está disponível variáveis como: identificação (id), nome (name), idade (age) e nacionalidade (nationality). Desejamos selecionar desta tabela o nome dos funcionários listados.

![](/uploads/Tabela1.jpeg "Tabela 1: Funcionários")

O comando para esta tarefa é dado por:

    SELECT name
    FROM employees;

Onde, **SELECT** indica a variável a ser selecionada (neste caso, _name_) e **FROM** indica a tabela a ser selecionada (_employees_).

Agora pense no seguinte exemplo: temos uma nova tabela que contém informações sobre filmes (films), como o nome do filme (title), ano de lançamento (release_year), idioma (language), país de origem (country), duração (duration), entre outras variáveis como pode-se observar abaixo.

![](/uploads/Tabela2_Filmes.png)

É possível selecionar _múltiplas colunas_ de uma tabela. Basta separar com vírgulas os nomes das variáveis a serem selecionadas. No próximo exemplo desejamos selecionar as váriáveis _title, release_year e country. Para isso devemos fazer:_

    SELECT title, release_year, country 
    FROM films;

Esse comando irá retornar uma nova tabela, apenas com as varáveis especificadas no comando SELECT.

Agora supondo que a nossa tabela tenha 10 variáveis e desejamos selecionar todas elas, basta colocar um asterisco (__*__), ao invés de listar o nome de todas as dez variáveis no comando SELECT.

    SELECT * 
    FROM films;

Esse comando é bastante útil quando não sabemos os nomes das colunas da nossa tabela. Mas é bom ter cuidado, pois se a tabela for muito grande pode demorar um pouco para retornar o resultado.

Para este exemplo a seguir, pense que desejamos saber quais os idiomas que aparecem nessa tabela de filmes, **_sem repetição (duplicatas)_**. Iremos aproveitar e **_ordenar_**, em ordem alfabética, a tabela pelo título dos filmes. Para isso usamos os comandos DISTINCT e ORDER BY, respectivamente:

    SELECT DISTINCT language 
    FROM films 
    ORDER BY title;

Como dito anteriormente, os comandos principais são SELECT e FROM. Porém, outros comandos vão sendo usados conforme necessidade de cada problema.

Se precisamos contar o número de linhas de uma tabela, por exemplo, usamos o comando **COUNT**.

Então voltando para a tabela _filmes_ ilustrada acima, se desejamos contar o número de países que aparecem na tabela (**sem repetição/duplicata**), precisamos fazer:

    SELECT COUNT (DISTINCT country) 
    FROM films;

É comum combinar o uso desses dois comandos, COUNT e DISTINC, a fim de contar o número de elementos diferentes que estão presentes naquela coluna.

Pode ser que em algum momento você precise fazer comentários no seu código. Para isso existem duas possibilidades:

1. **Comentário em uma linha:** Utilizando 2 hífens.

   Ex.: _-- Comentário em uma linha._
2. **Comentários em múltiplas linhas:** Utilizando o delimitador "/_" o início e_ "/" _do comentário._

   Ex.: _*/ (Comentário em múltiplas linhas) */._

Pra você que está começando agora, é importante ler sempre sobre o assunto para que possa estar sempre em contato e assim irá fixar os conceitos de forma mais descontraída. Nos próximos post iremos avançar na prática do SQL. Valeu pessoal! Nos vemos no próximo post!