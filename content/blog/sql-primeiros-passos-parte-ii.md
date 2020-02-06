+++
author = "Larissa Lima"
categories = []
date = ""
draft = true
image = 'images/blog/calltoaction_conceito.png'
slug = ""
tags = []
title = "SQL - Primeiros Passos - Parte II"

+++
E aí galera!

Dando continuidade ao primeiro post de SQL, hoje iremos falar sobre mecanismos para filtrar resultados. Se você não conferiu o primeiro post, clique aqui ([https://www.dadosaleatorios.com.br/post/sql_basico/](https://www.dadosaleatorios.com.br/post/sql_basico/ "https://www.dadosaleatorios.com.br/post/sql_basico/")). 

Os operadores comparativos nos auxiliam na especificação do filtro. São eles:

* **=** : igual
* **<>**: diferente
* **<**: menor que
* **>**: maior que
* **<=**: menor igual
* **>=**: maior igual

Para fazer tais filtros, podemos usar as cláusulas: _where, where and, where and or, between, where in, null e is null, like e not like_. Vamos falar separadamente de cada um.

**_WHERE_**

Esta função permite filtrar baseado em números ou textos de uma tabela, que deve ser seguida de uma expressão lógica. Mas o que é uma expressão lógica? Uma expressão lógica é o conjunto de uma ou mais condições a serem verificadas.

_Por exemplo:_

Usando a tabela do post anterior que contém informações sobre filmes, como o nome do filme (title), ano de lançamento (release_year), país de origem (country), idioma (language), entre outras variáveis.

![](/images/blog/Screenshot from 2019-10-02 09-30-39.png)

Desejamos obter dessa tabela as informações do filme “Metropolis”. Para isso, fazemos:

    SELECT title
    FROM films
    WHERE title = 'Metropolis';

Agora suponha que desejamos selecionar todos os filmes lançados em 2016:

    SELECT *
    FROM films
    WHERE release_year = 2016;

No exemplo abaixo, queremos verificar o nº de filmes lançados antes de 2000:

    SELECT COUNT(*)
    FROM films
    WHERE release_year < 2000;

**_WHERE AND_**

O comando _‘WHERE’_ pode ser combinado com alguns operadores, entre eles o operador _‘AND’_ e _‘OR’_. Este comando nos permite filtrar resultados quando temos mais de uma condição.

Suponha que desejamos obter os filmes em espanhol lançados antes do ano 2000. Neste caso precisamos especificar as duas variáveis que precisamos selecionar para fazer o filtro, que são o nome do filme (title) e o ano de lançamento (release_year):

    SELECT title, release_year
    FROM films
    WHERE language = 'Spanish'
    AND release_year < 2000;

Podemos usar dois _'AND'_, caso tenhamos mais de duas condições dentro do _'WHERE'_, como segue no exemplo abaixo:

Queremos obter todos os detalhes dos filmes em espanhol lançados entre 2000 e 2010:

    SELECT *
    FROM films
    WHERE language = 'Spanish'
    AND release_year > 2000
    AND release_year < 2010;

**_WHERE AND OR_**

Agora, queremos selecionar os títulos e o ano de lançamento dos filmes lançados nos anos 90 em francês ou espanhol e que arrecadaram mais de 2 milhões brutos. Para isso fazemos:

    SELECT title, release_year
    FROM films
    WHERE release_year < 2000
    AND release_year >= 1990
    AND (language = 'French' OR language = 'Spanish')
    AND gross > 2000000;

Note que nesse exemplo, temos três condições: filmes lançados nos anos 90, filmes em francês ou espanhol, e filmes que arrecadaram mais de 2 milhões brutos.

**_BETWEEN_**

Essa cláusula nos permite selecionar valores em um intervalo, podendo ser números, texto, ou datas. Vale ressaltar que esse operador é inclusivo, ou seja, os valores inicial e final serão incluídos.

Neste exemplo, desejamos selecionar os títulos dos filmes e o ano dos que foram lançados entre 1990 e 2000 em espanhol ou francês com orçamento acima de 100 milhôes. Para isso, temos o seguinte código:

    SELECT title, release_year
    FROM films
    WHERE release_year BETWEEN 1990 AND 2000
    AND budget > 100000000
    AND (language = 'French' OR language = 'Spanish');

**_WHERE IN_**

_'IN'_ permite especificar múltiplos valores no comando _‘WHERE’_, sejam eles valores numéricos ou caractere.

Ainda na tabela de filmes, pense que queremos selecionar o título e a certificação de todos os filmes com certificação NC-17 ou R.

    SELECT title, certification
    FROM films
    WHERE certification IN ('NC-17', 'R');

Para o próximo exemplo, vamos selecionar o título e o ano de lançamento dos filmes que foram lançados entre os anos 1990 e 2000 (incluindo). Para isso, fazemos:

    SELECT title, release_year
    FROM films
    WHERE release_year BETWEEN 1990 AND 2000;

**_NULL and IS NULL_**

Um campo com o valor _‘NULL’_ é um campo sem valor.

Então, agora iremos selecionar o título de todos os filmes que não tem nenhum orçamento associado (missing):

    SELECT title
    FROM films
    WHERE budget IS NULL;

**_LIKE e NOT LIKE_**

Este comando é usado para verificar um padrão especificado em uma coluna. Precisamos ter em mente que precisamos de dois operadores que irão auxiliar na busca de acordo com o que desejamos.

* **%**: relaciona um, dois ou mais caracteres no texto.
* **_** : relaciona um único caractere.

Para esse exemplo, usaremos a tabela pessoas (_people)_ que possui informações sobre nome (name), data de nascimento (birthdate) e data de morte (deathdate). 

![](/images/blog/Screenshot from 2019-10-02 10-34-26.png)Então, desejamos encontrar as pessoas que o nome começa com a letra B. Neste caso, o padrão ao ser pesquisado é **'B%'**. Para isso, faremos:

    SELECT name
    FROM people
    WHERE name LIKE 'B%';

Nesse próximo exemplo, queremos encontrar os nomes das pessoas em que a segunda letra é "R". Neste caso o padrão a ser pesquisado é **'_r%'**:

    SELECT name
    FROM people
    WHERE name LIKE '_r%';

E se desejamos selecionar os nomes das pessoas que **não** iniciam com '_A'_, usamos:

    SELECT name
    FROM people
    WHERE name NOT LIKE 'A%';