---
title: Programando com dplyr (tidy eval)
author: Bruno Lucian, Leonardo Filgueira
date: '2019-02-14'
categories:
  - data science
  - linguagem R
tags:
  - dplyr
slug: programando-com-dplyr

---

E aí, pessoal! Depois de conhecer o `dplyr` (se ainda não conhece, veja [aqui](https://www.dadosaleatorios.com.br/post/introdu%C3%A7%C3%A3o-ao-dplyr/) nosso post de introdução), começamos a escrever nossos códigos usando as funções desse pacote, e o costume de usar o `dplyr` acaba nos fazendo pensar em escrever nossas próprias funções usando alguns comandos do `dplyr`. Você já tentou escrever e teve algum problema? Nós também, e por isso estudamos um pouco sobre *tidy evaluation*. Com isso vamos conseguir escrever nossas primeiras funções usando `select`, `mutate`, ou outras funções do `dplyr`, aproveitando a facilidade e rapidez que o pacote nos oferece. 

Pra ilustrar esse primeiro exemplo, vamos usar o famoso *dataset* `iris`, mas vamos antes transformá-lo num `tibble`, apenas para facilitar na visualização:

```{r message=FALSE, warning=FALSE}
require(dplyr)

iris_tibble <- as_tibble(iris)
```


Começamos fazendo uma função muito simples, que apenas seleciona uma coluna passada como argumento. Vamos usar essa nossa função para selecionar a coluna `Species`, mas iremos passar o nome dessa coluna entre aspas.

```{r}
seleciona <- function(dados, coluna){
  dados %>% 
    select(coluna)
}

seleciona(iris_tibble, "Species")
```

Da mesma forma funciona com o `pull`, ao invés do select. Faça o teste!

Mas e se quisermos passar o nome da coluna `Species` sem aspas, como acontece em todos os verbos do `dplyr`? Vamos tentar passar a coluna sem aspas pra nossa função:

```{r error=TRUE}
seleciona(iris, Species)
```

Veja que o erro nos diz que o objeto `Species` não foi encontrado. Isso acontece porque não criamos nenhum objeto com esse nome, e o R retorna um erro quando executamos o nome de um objeto que ainda não existe. 

### Quosures

Iremos então capturar uma expressão ao invés de calculá-la. Para isso usaremos a função `quo()`. Essa função fará a captura da expressão e de seu *environment*. Dessa maneira, o R saberá de onde tirar o valor daquela expressão, por exemplo, do ambiente do nosso script principal e não do ambiente da nossa função. Vejamos um exemplo:

```{r}
# O R fará a conta
1 + 1

# O R retornará a expressão sem fazer a conta
quo(1 + 1)
```

Assim nós temos um objeto do tipo *quosure*. Então, aplicando no nosso problema, iremos precisar passar um *quosure* como argumento para a função, mas também teremos que dizer quando substituir a expressão da *quosure* por seu valor. Para isto, utilizaremos `!!`:

```{r}
seleciona <- function(dados, coluna){
  dados %>% 
    select(!!coluna)
}

seleciona(iris_tibble, quo(Species))
```

Dessa maneira podemos passar `Species` com ou sem aspas. Testa aí!

Mas ficar usando `quo` ao passar os argumentos pra função pode ser um pouco chato. Podemos pensar em usar esse comando dentro da nossa função:

```{r error = TRUE}
seleciona <- function(dados, coluna){
  
  coluna <- quo(coluna)
  
  print(coluna)
  
  dados %>% 
    select(!!coluna)
}

seleciona(iris_tibble, Species)
```

Esse `print` foi colocado de propósito pra entendermos o que está acontecendo. A função `quo()` é muito literal, ou seja, ela armazemou `coluna`, não esperando ela receber o valor `Species` na chamada da função. Precisamos então de uma função que espere o argumento ser dado para capturar seu nome.

### Enquo

Para fazer o que desejamos precisamos usar a função `enquo()`. Esta função irá primeiro tomar o valor de `coluna` e depois transformar esse valor num *quosure*. 

**Observação**: Esta função serve apenas para utilizarmos dentro de uma função. Se quisermos testar a função rodando linha a linha, devemos substituir `enquo()` por `quo()`.

```{r}
seleciona <- function(dados, coluna){
  
  coluna <- enquo(coluna)
  
  print(coluna)
  
  dados %>% 
    select(!!coluna)
}

seleciona(iris_tibble, Species)
```

Neste caso também podemos passar `Species` com aspas, sem problemas. A partir de agora vamos construir um outro `tibble`, que nos ajudará a continuar entendendo *tidy eval*.

```{r}
(df <- tibble(
  g1 = c(1, 1, 2, 2, 2),
  g2 = c(1, 2, 1, 2, 1),
  a = sample(5), 
  b = sample(5)
))
```

Iremos construir uma função que recebe o `tibble`, a coluna a ser usada para agrupamento e a coluna para calcular a média:

```{r}
my_summarise <- function(df, var_grupo, var_summarise){
  
  var_grupo <- enquo(var_grupo)
  var_summarise <- enquo(var_summarise)
  
  df %>%
    group_by(!!var_grupo) %>%
    summarise(media = mean(!!var_summarise))
}
```

Agora vamos usar a função utilizando como argumentos `df`, `g1` e `a`, ou seja, queremos calcular a média de `a`, agrupando pelos valores de `g1`.

```{r}
my_summarise(df, g1, a)
```

Assim como estávamos fazendo quando o `quosure` era passado para o `select`, vamos tentar passar os nomes de colunas com aspas:

```{r, error = TRUE}
my_summarise(df, "g1", "a")
```

Temos dois problemas aqui. O primeiro é que o `group_by` na verdade criou uma variável `"g1"`, com aspas, com um único valor: `"g1"`. Além disso, sabemos que não é possível calcular a média de `"a"`, então temos um `NA` na coluna `media`. Mais a frente vamos tentar solucionar essa questão.

## Mudar nomes de variáveis

Suponha que queiramos retornar a média das colunas `a` e `b` e, para diferenciar os nomes, as colunas terão os nomes `media_a` e `media_b`. Para isso iremos utilizar `quo_name()`, que converte o *quosure* num string, e o operador `:=`

```{r}
my_summarise2 <- function(df, var1, var2) {
  
  var1 <- enquo(var1)
  var2 <- enquo(var2)
  
  mean_name1 <- paste0("media_", quo_name(var1))
  mean_name2 <- paste0("media_", quo_name(var2))
  
  summarise(df, 
    !!mean_name1 := mean(!!var1), 
    !!mean_name2 := mean(!!var2)
  )
}

my_summarise2(df, a, b)
```

Da mesma maneira, podemos receber o nome da coluna que vai ser criada no `summarise()` como argumento da função.

```{r}
my_summarise3 <- function(df, coluna, nome){
  
  coluna <- enquo(coluna)
  nome <- enquo(nome)
  
  df %>%
  summarise(
    !!quo_name(nome) := mean(!!coluna)
  )
}

my_summarise3(df, a, media)
```

**Observação**: Estas duas formas também funcionam dentro do `mutate()`.

### Argumentos em `group_by, arrange, mutate` e `summarise`

Ao passarmos o nome de uma coluna com aspas para ser usado em `group_by`, o `enquo()` (como vimos acima) não irá retornar o resultado desejado. Uma maneira de resolver esta questão é utilizar a função `sym()`. Vamos observar que o funcionamento dela é bem similar a função já mencionada `enquo()`.

```{r}
my_summarise_string <- function(df, var_grupo, var_summarise) {
  
  var_grupo <- sym(var_grupo)
  var_summarise <- sym(var_summarise)
  
  df %>%
    group_by(!!var_grupo) %>%
    summarise(media = mean(!!var_summarise))
}

my_summarise_string(df, "g1", "a")
```

Da mesma maneira fazemos se os parâmetros forem usados em `arrange()`, `summarise()` e `mutate()`. O ponto é que desta maneira a função só irá conseguir fazer os cálculos se passarmos `var_grupo` e `var_summarise` com aspas. Se quisermos uma função que aceite os parâmetros com ou sem aspas, uma alternativa será utilizar `try()` e, com isso, utilizar `if()`. Veja na função a seguir:

```{r}
summarise_by <- function(df, var_grupo, var_soma){
  
  teste_1 <- try(is.character(var_grupo), silent = T)
  teste_2 <- try(is.character(var_soma), silent = T)

  if(teste_1 == T & teste_2 == T){
    summ_sym <- sym(var_soma)
    group_syms <- sym(var_grupo)

    return(df %>%
      group_by(!!group_syms) %>%
      summarise(soma = sum(!!summ_sym)) %>%
      arrange(!!group_syms))

  }else if(teste_1 != T & teste_2 != T){

    summ_sym <- enquo(var_soma)
    group_syms <- enquo(var_grupo)
    
    return(df %>%
      group_by(!!group_syms) %>%
      summarise(soma = sum(!!summ_sym)) %>% 
      arrange(!!group_syms))
   }
}

summarise_by(df, g1, a)
# Ou
summarise_by(df, "g1", "a")
```

### Capturando expressão para filtrar

Se quisermos capturar uma expressão a ser utilizada no filter, o procedimento é bem parecido:

```{r}
meu_filtro <- function(df, filtro){
  
  filtro <- enquo(filtro)
  
  df %>% 
    filter(!!filtro)
}

meu_filtro(df, g1 == 1)
```


### Joins

Ao fazer algum dos joins do `dplyr`, existe a necessidade de explicitar a(s) variável(is) que será(ão) utilizada(s) ao juntar as duas bases. Porém sabemos que o argumento `by` requer um vetor de caractere nomeado, ou seja, `c("c1" = "c2")`, mas também já sabemos que um `enquo` não é um caractere, e sim uma fórmula. Suponha as seguintes bases:

```{r}
base1 <- tibble(id = sample(1:5, 3), val = sample(1:10, 3))
base1

base2 <- tibble(id = sample(1:5, 3), val = sample(1:10, 3))
base2
```

Suponha uma função que vai simplesmente fazer um `full_join` entre as bases. Para fazer isso, precisaremos das funções `set_names` e `quo_name`. (vamos ativar o pacote `rlang` para utilizar `set_names`):

```{r message=FALSE, warning=FALSE}
require(rlang)

meu_full_join <- function(b1, b2, id1, id2){
  
  id1 <- enquo(id1)
  id2 <- enquo(id2)
  
  by <- set_names(quo_name(id2), quo_name(id1))
  
  b1 %>% 
    full_join(b2, by = by)
}

meu_full_join(base1, base2, id, id)
```


Note que a função `set_names` funciona da seguinte forma, ela cria um vetor nomeado utilizando o primeiro argumento como valor e o segundo argumento como nome deste nosso novo vetor. 

```{r}
set_names(1:4, letters[1:4])
```

que é o mesmo de criar vetores nomeados utilizando a função base `c`, como vamos ver abaixo:

```{r}
c("a" = 1, "b" = 2 , "c" = 3, "d" = 4 )
```

voltando ao nosso objetivo principal, por isso que é colocado o `quo_name` da segunda base primeiro e depois o `quo_name` da primeira base. 

## Função com múltiplas variáveis

Vamos criar uma função que conta o número de casos para todas as combinações de valores dos grupos que serão passados como argumentos, mas não vamos fixar o número de variáveis, vamos aceitar quantas variáveis forem passadas. Precisamos fazer três mudanças:

- Usar `...` na definição da função;
- Usar `quos()` ao invés de `enquo()`;
- Usar `!!!` ao invés de `!!`.

```{r}
conta_casos <- function(df, ...) {
  
  var_grupo <- quos(...)

  df %>%
    group_by(!!!var_grupo) %>%
    summarise(n = n())
}

conta_casos(df, g1, g2)
```

Se quisermos passar essas variáveis para `...` com aspas, basta utilizar a função `syms()` ao invés de `quos` na função. A diferença maior fica na chamada da função. Veja:

```{r}
conta_casos_string <- function(df, ...) {
  
  var_grupo <- syms(...)

  df %>%
    group_by(!!!var_grupo) %>%
    summarise(n = n())
}

conta_casos_string(df, list("g1", "g2"))
```

A diferença é que na hora de chamar a função precisamos passar os argumentos como uma **lista**.

### Checando as múltiplas variáveis

Podemos querer verificar se os múltiplos argumentos em `...` foram ou não passados pra função. Vamos fazer essa checagem com a função `conta_casos`, criada acima, utilizando apenas a função `length`.

```{r, error = TRUE}
conta_casos <- function(df, ...) {
  
  var_grupo <- quos(...)
  
  if(length(var_grupo) > 0){
    df %>%
      group_by(!!!var_grupo) %>%
      summarise(n = n())
  }else{
    warning("Colunas para agrupar não encontradas")
    df %>% 
      summarise(n = n())
  }
}  

conta_casos(df)
```

### Fonte

- [Programming with dplyr](http://dplyr.tidyverse.org/articles/programming.html)
- [Tidy evaluation com Hadley Wickham](https://www.youtube.com/watch?v=nERXS3ssntw)
