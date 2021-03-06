---
title: Help functions do dplyr
author: dadosaleatorios
date: '2018-09-12'
slug: help-functions-do-dplyr

---

Este post supõe que estamos minimamente familiarizados com o pacote `dplyr` (se você não está, veja [este](https://www.dadosaleatorios.com.br/post/introdu%C3%A7%C3%A3o-ao-dplyr/) post), especialmente com a função `select` e com o *pipe*.

O `dplyr` traz algumas funções que podem ser muito úteis em algum momento de nossa manipulação de dados com o `select`, que são as *help functions*. Essas funções são, na verdade, do pacote [`tidyselect`](https://github.com/tidyverse/tidyselect), mas são disponibilizadas ao ativar o `dplyr` (melhor ainda seria ativar o `tidyverse`). São elas:

- `starts_with`, `ends_with`, `contains`: selecionam colunas que *começam com*, *terminam com* ou *contenham* um string

- `matches`: faz a correspondência com uma expressão regular (regex).

- `num_range`: seleciona colunas que contenham números em sequência.

- `one_of`: seleciona variáveis num vetor.

- `everything`: seleciona todas as colunas.

## Exemplos

Novamente vamos usar o dataset `starwars`. Vejamos o `tibble`:

```{r message = FALSE, warning = FALSE}
require(tidyverse)

starwars
```

Podemos selecionar colunas que comecem com a letra "h":

```{r}
starwars %>% 
  select(starts_with("h"))
```

Selecionaremos agora colunas que terminem com a palavra "color":

```{r}
starwars %>% 
  select(ends_with("color"))
```

Vamos selecionar colunas que contenham algum caracter + "t" + algum caracter, através da regex `".t."`:

```{r}
starwars %>% 
  select(matches(".t."))
```

Se tivermos um vetor com os nomes das colunas a serem selecionadas, utilizamos `one_of`:

```{r}
nomes <- names(starwars)[1:5]

starwars %>% 
  select(one_of(nomes))
```

A função `everything` pode ser útil se quisermos colocar alguma coluna como a primeira de nosso `tibble`:

```{r}
starwars %>% 
  select(homeworld, everything())
```

Iremos criar um `tibble` para poder mostrar o uso de `num_range`:

```{r}
dados <- tibble(x1 = 1:10, x2 = letters[1:10], valor = 11:20)

dados %>% 
  select(num_range("x", 1:2))
```

Também podemos juntar várias funções auxiliares dentro de um mesmo `select`. Vamos selecionar colunas que terminam com "color", contenham a string "es", e depois todas as outras colunas:

```{r}
starwars %>% 
  select(name, ends_with("color"), contains("es"), everything())
```

De se tornar um novo jedi`R`, um passo mais próximo você está!

![](./imagem-01.png)

## Fontes:

- https://dplyr.tidyverse.org/
- [Help da função `select`](https://www.rdocumentation.org/packages/dplyr/versions/0.7.6/topics/select)
- [Help de `select_helpers`](https://www.rdocumentation.org/packages/tidyselect/versions/0.2.4/topics/select_helpers)