+++
date = "2019-04-27T23:31:44+00:00"
draft = true
undefined = ""

+++
**SQL Básico – Parte I**

Venho aqui hoje compartilhar com vocês um pouco do meu aprendizado do curso básico de SQL. Pra quem não conhece, SQL (Structured Query Language) é uma das linguagens mais utilizadas para manipulação de bancos de dados. E pra quem deseja atuar nessa área, é fundamental o conhecimento dessa linguagem.

Nessa primeira etapa, aprendi os comandos básicos e mais utilizados. São eles: SELECT e FROM.

Para começar, vamos a um exemplo.

Ex.: Suponha que temos uma tabela com o nome "people" que contenha os dados pessoais de cada pessoa, como: nome, idade, sexo, etc. Desejamos selecionar dessa tabela o nome das pessoas ali listadas. O comando para esta tarefa é dado por:

**SELECT name**

**FROM people;**

Onde, 'SELECT' indica a variável a ser selecionada (neste caso, nome) e 'FROM' indica a tabela a ser selecionada (people).

É possível selecionar também múltiplas colunas da tabela 'people'. Basta separar com vírgulas os nomes das var. a serem selecionadas, como segue no próximo exemplo:

**SELECT name, idade, sexo**

**FROM people;**

Supondo que a nossa tabela ‘people’ tenha 10 variáveis e desejo selecionar todas elas, basta indicar no código incluindo um asterisco (*), ao invés de listar o nome de todas as variáveis no comando SELECT. Ex.:

__SELECT *__

**FROM people;**

Agora pense no seguinte exemplo: temos uma nova tabela que contém informações sobre filmes, como o nome, ano de lançamento, idioma, país de origem, entre outras variáveis. E desejamos saber quais os idiomas que aparecem nessa tabela de filmes, sem repetição. Iremos aproveitar e ordenar, em ordem alfabética, a tabela pelo nome dos filmes. Para isso usamos o comando DISTINCT e ORDER BY, respectivamente:

**SELECT DISTINCT language**

**FROM films**

**ORDER BY name;**

Como dito anteriormente, os comandos principais são SELECT e FROM. Os outros comandos vão sendo usados conforme necessidade de cada problema.

Se precisamos contar o nº de linhas de uma tabela, usamos o comando ‘COUNT’.

Ex.: Desejamos contar o nº de países (sem repetição/duplicata) na tabela filmes.

**SELECT COUNT (DISTINCT country)**

**FROM films;**

Na linguagem SQL, para fazer comentários em múltiplas linhas devemos usar */ (comentário) */: