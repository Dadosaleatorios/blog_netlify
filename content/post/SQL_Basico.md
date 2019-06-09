+++
author = "Larissa Lima, Bruno Lucian"
categories = ["SQL"]
date = "2019-04-27T23:31:44+00:00"
slug = ""
tags = ["datascience", "SQL"]
title = "SQL - Primeiros Passos"
undefined = "SQL - Parte I"

+++
E aí galera, tudo bem? Eu sou [Larissa](https://www.linkedin.com/in/larissadossantoslima/ "linkedin") e é a minha primeira vez escrevendo para o blog. Hoje venho aqui compartilhar com vocês um pouco do meu aprendizado no curso básico de SQL.

Pra quem não conhece, SQL é uma das linguagens mais utilizadas para consulta, armazenamento e manipulação de bancos de dados e significa **_S_**_tructured **Q**uery **L**anguage_. E pra quem deseja atuar nessa área de dados, é fundamental o conhecimento dessa linguagem.

Nessa primeira etapa, aprendi os comandos mais utilizados. São eles: **SELECT** e **FROM**, os quais são chamados de _palavras-chave_. Vale ressaltar que as _palavras-chave_ não são _case-sensitive._ Ou seja, você pode escrevê-las com letras maiúsculas ou minúsculas. Porém para uma melhor visualização e organização do código, é recomendado utilizar letras maiúsculas. Ao finalizar cada consulta, utiliza-se **";"**.

Para começar, vamos a um exemplo.

Ex.: Suponha que temos uma tabela que contém informações de funcionários (employees) de uma empresa multinacional, conforme ilustrado na tabela abaixo. Nesta tabela está disponível variáveis como: identificação (id), nome (name), idade (age) e nacionalidade (nationality). Desejamos selecionar desta tabela o nome dos funcionários listados.

![](/uploads/Tabela1.jpeg "Tabela 1: Funcionários")

O comando para esta tarefa é dado por:

    SELECT name
    FROM employees;

Onde, **SELECT** indica a variável a ser selecionada (neste caso, _name_) e **FROM** indica a tabela a ser selecionada (_employees_).

Agora pense na seguinte tabela que contém informações sobre filmes (films), como o nome do filme (title), ano de lançamento (release_year), idioma (language), país de origem (country), duração (duration), entre outras variáveis como podemos observar abaixo.

![](/uploads/Tabela2_Filmes.png =400x200)

É possível selecionar _múltiplas colunas_ de uma tabela. Basta separar com vírgulas os nomes das variáveis a serem selecionadas. No próximo exemplo desejamos selecionar as variáveis _title, release year e country._ Para realizar esta tarefa podemos fazer da seguinte forma:

    SELECT title, release_year, country 
    FROM films;

Esse comando irá retornar uma nova tabela, apenas com as variáveis especificadas no comando SELECT.

Agora supondo que a nossa tabela tenha 10 variáveis e desejamos selecionar todas elas. Basta colocar um asterisco (__*__), ao invés de listar o nome de cada uma das dez variáveis no comando SELECT.

    SELECT * 
    FROM films;

Esse comando é bastante útil quando não sabemos os nomes das colunas da nossa tabela. Mas é bom ter cuidado, pois se a tabela for muito grande pode demorar um pouco para retornar o resultado.

### **Outros comandos importantes**

Para este exemplo a seguir, pense que desejamos saber quais os idiomas que aparecem nessa tabela de filmes, **_sem repetição (duplicatas)_**. Iremos aproveitar e **_ordenar_**, em ordem alfabética, a tabela pelo título dos filmes. Para isso usamos os comandos DISTINCT e ORDER BY, respectivamente:

    SELECT DISTINCT language 
    FROM films 
    ORDER BY title;

Como dito anteriormente, os comandos principais são SELECT e FROM. Porém, outros comandos vão sendo utilizados conforme necessidade de cada problema.

Se precisamos contar o número de linhas de uma tabela, por exemplo, usamos o comando **COUNT**.

Então, pensando na tabela _filmes_ ilustrada acima, se desejamos contar o número de países que aparecem na tabela (**sem repetição/duplicata**), precisamos fazer:

    SELECT COUNT (DISTINCT country) 
    FROM films;

É comum combinar o uso desses dois comandos, COUNT e DISTINCT, a fim de contar o número de elementos diferentes que estão presentes naquela coluna.

### **Acrescentando comentários**

Quando estamos manipulando grandes bancos de dados e com o crescimento do script gerado para essa manipulação, se faz necessária a utilização de comentários para facilitar o entendimento posterior do seu código. Para isso existem duas possibilidades:

1. **Comentário em uma linha:** Utilizando 2 hífens no início do comentário a ser feito.

       -- Comentário em uma linha
2. **Comentários em múltiplas linhas**:

       Utilizando o delimitador "/\*" no início e "\*/" no final do comentário.
       
       /* 
       
       Comentário em múltiplas linhas
       
       Outro comentário
       
       Mais outro comentário
       
       */.

Pra você que está começando agora, é importante ler sempre sobre o assunto para que possa estar sempre em contato e assim irá fixar os conceitos de forma mais descontraída. Nos próximos posts iremos avançar na prática do SQL. Valeu pessoal! Aguardo vocês!