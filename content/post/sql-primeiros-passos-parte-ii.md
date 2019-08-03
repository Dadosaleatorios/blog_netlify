+++
author = "Larissa Lima"
categories = []
date = ""
draft = true
post-image = ""
slug = ""
tags = []
title = "SQL - Primeiros Passos - Parte II"

+++
Hoje iremos falar sobre mecanismos para filtrar resultados. Os operadores comparativos nos auxiliam na especificação do filtro. São eles:

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

Pegando o exemplo do post anterior que tínhamos uma tabela que contém informações sobre filmes, como o nome do filme, ano de lançamento, idioma, país de origem, entre outras variáveis. Desejamos obter dessa tabela as informações do filme “Metropolis”. Para isso, fazemos:

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

Podemos usar dois _'AND'_, caso tenhamos mais de duas condições dentro do where. Como segue no exemplo abaixo:

Queremos obter todos os detalhes dos filmes em espanhol lançados entre 2000 e 2010:

    SELECT *

    FROM films

    WHERE language = 'Spanish'

    AND release_year > 2000

    AND release_year < 2010;

**_WHERE AND OR_**

Quermos selecionar os títulos e o ano de lançamento dos filmes lançados nos anos 90 em francês ou espanhol e que arrecadaram mais de 2 milhões brutos. Para isso fazemos:

    SELECT title, release_year

    FROM films

    WHERE release_year < 2000

    AND release_year >= 1990

    AND (language = 'French' OR language = 'Spanish')

    AND gross > 2000000;

Note que nesse exemplo, temos três condições: filmes lançados nos anos 90, filmes em francês ou espanhol, e filmes que arrecadaram mais de 2 milhões brutos.

**_BETWEEN_**

Nos permite selecionar valores em um intervalo, podendo ser números, texto, ou datas. Vale ressaltar que esse operador é inclusivo, ou seja, os valores inicial e final estão incluídos.

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

Para o próximo exemplo, vamos utilizar a tabela ‘kids’, que tem informações sobre crianças como: nome, idade, altura, peso, local de moradia, entre outras. Queremos selecionar os nomes das crianças com idade de 2, 4, 6 ou 10 anos. Para isso, fazemos:

    SELECT name

    FROM kids

    WHERE age IN (2, 4, 6, 8, 10);

**_NULL and IS NULL_**

Um campo com o valor _‘NULL’_ é um campo sem valor.

Então, voltando a tabela de filmes, vamos selecionar o título de todos os filmes que não tem nenhum orçamento associado (missing):

    SELECT title

    FROM films

    WHERE budget IS NULL;

**_LIKE e NOT LIKE_**

Este comando é usado para verificar um padrão especificado em uma coluna. Precisamos ter em mente que precisamos de dois operadores que irão auxiliar na busca de acordo com o que desejamos.

* **%**: relaciona um, dois ou mais caracteres no texto.
* **_** : relaciona um único caractere.

Para esse exemplo, teremos a tabela _‘companies’_ que possui informações sobre o nome da empresa, ano de fundação, número de funcionários, etc. Então, desejamos encontrar empresas em que a primeira palavra é _'Data'_. Como por exemplo: _'Data', 'DataC', 'DataCamp', 'DataMind'_. Para isso, faremos:

    SELECT name

    FROM companies

    WHERE name LIKE 'Data%';

Nesse próximo exemplo, queremos encontrar nomes de empresas que diferem na sexta letra, como 'DataC**a**mp' e 'DataC**o**mp':

    SELECT name

    FROM companies

    WHERE name LIKE 'DataC_mp';

Caso desejamos selecionar os nomes das empresas que não iniciam com '_A'_, usamos:

    SELECT name

    FROM companies

    WHERE name NOT LIKE 'A%';