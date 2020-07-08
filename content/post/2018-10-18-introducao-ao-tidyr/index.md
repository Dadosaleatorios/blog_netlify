---
title: Introdução ao tidyr
authors:
  - Bruno
date: '2018-10-18'
slug: introducao-ao-tidyr
categories:
  - data science
  - linguagem R

---

```{r echo = F, message = F, warning = F}
knitr::opts_chunk$set(comment = NA)

require(tidyverse)

dados_wide <- tibble(uf = c("RJ", "SP"), `2017` = c(10, 11), `2018` = c(11, 10))
dados_long <- dados_wide %>% 
  gather(Ano, valor, -uf)
```


O pacote [`tidyr`](https://tidyr.tidyverse.org/) tem como principal objetivo transformar um data frame para o formato *tidy*, ou limpo. Segundo a filosofia do `tidyverse`, um dado limpo é o que apresenta as seguintes propriedades:

- Cada variável é uma coluna.
- Cada linha é uma observação.
- Cada valor é uma célula.

![Ilustração de dados no formato *tidy*](./tidy_data.png)

A seguir vamos apresentar dois tibbles. Dê uma olhada e pense qual dos dois está no formato `tidy`, de acordo com a filosofia `tidyverse`:

```{r echo = F}
dados_wide
```

```{r echo = F}
dados_long
```

De acordo com a filosofia do pacote, um dado limpo é aquele com formato *long*, ou seja, com mais linhas. O outro formato é chamado de *wide*, com mais colunas. No caso deste exemplo, ano é uma variável, logo é necessário existir uma coluna com os valores de ano. O valor relacionado a UF naqueles anos também é outra variável, então precisa de uma coluna pra representá-lo. Além disso, a própria UF precisa de uma coluna.

Todo o pacote `dplyr` (caso não conheça, veja [este tutorial](http://shiny.dtmsp.com.br:3838/Tutoriais/Intro_dplyr.html)) se baseia na suposição de que o `tibble` utilizado está no formato *tidy*.

O `tidyr` possui duas funções principais:

- `gather`: Transforma um `tibble` *wide* em *long*, ou seja, transforma os dados no formato *tidy*.

- `spread`: Transforma um `tibble` *long* em *wide*, ou seja, transforma dados que estão no formato *tidy* em formato não *tidy*.

Além disso, existem duas funções que podem ser importantes na nossa análise: `separate` e `unite`, que separa uma coluna em duas e vice versa.

## Instalação

Podemos instalar o `tidyr` isoladamente ou instalar todo o `tidyverse`.

```{r eval = F}
install.packages("tidyverse") # Ou install.packages("tidyr")

require(tidyverse) # ou require(tidyr)
```

Para este tutorial utilizaremos o `pipe` e outras funções que são carregadas ao ativar o `dplyr`. Então, caso tenhamos carregado apenas o `tidyr`, será necessário também ativar o `dplyr`.

## `gather`

Vamos criar um `tibble` no formato *wide* e transformá-lo em um dado *tidy*:

```{r}
dados_wide <- tibble(uf = c("RJ", "SP"), `2017` = c(10, 11), `2018` = c(11, 10))
dados_wide
```

Por padrão, a função `gather` irá retornar um `tibble` com duas colunas, isso se não inserirmos nenhum parâmetro além do `tibble`. O primeiro parâmetro será o `tibble`, assim como nas funções do `dplyr`. Em seguida iremos informar os nomes das duas coluna a serem criadas: `key` e `value` (chave e valor). Além disso, podemos selecionar colunas que devam (ou não) ser transformadas para *long*. Por padrão todas as colunas são consideradas para a transformação. No nosso caso, a coluna `uf` não deve ser transformada, ou seja, ela deve continuar com `"RJ"` e `"SP"`, as duas UFs que estão na base de dados. Então vamos informar que essa coluna não deve ser transformada.

```{r}
dados_wide %>% 
  gather(key = Ano, value = valor, -uf)
```

Também podemos usar as *help functions* na hora de selecionar as colunas. Caso não conheça essas funções, veja [este outro tutorial](http://shiny.dtmsp.com.br:3838/Tutoriais/Help_functions.html). Então o seguinte código retorna o mesmo resultado mostrado acima:

```{r eval = F}
dados_wide %>% 
  gather(key = Ano, value = valor, -contains("uf"))
```

## `spread`

Agora vamos criar um `tibble` com o formato *long* para transformá-lo em *wide*.

```{r}
dados_long <- tibble(uf = rep(c("RJ", "SP"), 2), Ano = rep(2017:2018, each = 2), valor = c(10, 11, 11, 10))

dados_long
```

Basicamente teremos de informar qual coluna tem os valores que se tornarão colunas e qual a coluna tem os valores que preencherão as novas colunas:

```{r}
dados_long %>% 
  spread(key = Ano, value = valor)
```

Perceba que se dermos um `gather` nesse `tibble` resultante, voltaremos a obter `dados_long`.

## `unite` e `separate`

Suponha que aquele primeiro `tibble`, no começo deste tutorial, ao invés de ter ``2017`` e ``2018`` como nomes de colunas, tivesse os nomes `valor_2017` e `valor_2018`. 

```{r echo = F}
dados_wide <- dados_wide %>% 
  rename(valor_2017 = `2017`, valor_2018 = `2018`)
```

```{r}
dados_wide
```

Dessa maneira, ao fazermos o `gather`, nossa coluna `ano` ficará da seguinte maneira:

```{r}
dados_wide %>% 
  gather(Ano, valor, -uf)
```

Temos, então, que remover esse prefixo "valor_", para que o `tibble` tenha apenas o ano, de fato. Existem várias maneiras de fazer isso, mas usaremos aqui a função `separate`, além do `select` para terminar de resolver nosso problema. Passaremos como argumentos para a função `separate` o `tibble` gerado acima (`data`), o nome da coluna que queremos separar (`col`), as colunas que serão criadas com a separação de `col` (`into`) e o padrão que deve separar o conteúdo de `col` (`sep`). O argumento `sep` é interpretado como uma expressão regular (*regex*). No nosso caso, o separador é um *underline*.

```{r}
dados_separate <- dados_wide %>% 
  gather(Ano, valor, -uf) %>% 
  separate(col = Ano, into = c("val", "Ano2"))

dados_separate
```

Nessa situação a coluna `val` não tem valor pra gente, então vamos descartá-la com o select. Também vamos chamar `Ano2` de `Ano`, apenas:

```{r}
dados_separate %>% 
  select(uf, Ano = Ano2, valor)
```

Suponha agora que tenhamos duas colunas que desejamos juntar em apenas uma. Para isso utilizamos a função `unite`. Vamos juntar novamente o prefixo "valor_" com o ano. O primeiro argumento da função é o `tibble`. Em seguida passamos o nome da nova coluna (`col`), que será a junção de outras colunas. Além disso precisamos informar os nomes das colunas que serão unidas (`...`) e o caractere que será utilizado para separar as informações das colunas (`sep`). Vamos, então, unir as colunas `val` e `Ano2` na coluna `Ano`.

```{r}
dados_separate %>% 
  unite(col = Ano, val, Ano2, sep = "_")
```


## Veja também

- [Introdução ao tidyr do RStudio](https://blog.rstudio.com/2014/07/22/introducing-tidyr/)
- [Site do tidyr](https://tidyr.tidyverse.org/)
