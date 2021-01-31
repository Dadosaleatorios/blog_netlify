---
title: Introdução ao dplyr
author: dadosaleatorios
date: '2018-08-31'
categories:
  - analise de dados
  - data science
  - estatistica
  - iniciantes
  - linguagem R
slug: introdução-ao-dplyr

---

## O que é o dplyr e por que usá-lo?

[`dplyr`](https://dplyr.tidyverse.org/) é um pacote do R para manipulação de dados, sendo um dos pacotes que forma o núcleo do [`tidyverse`](https://www.tidyverse.org/). Se você nunca ouviu falar no `tidyverse`, ele é basicamente um pacote de pacotes que tem uma filosofia em comum, sendo cada pacote especializado em um tipo de tarefa, com a intenção de integrar todos eles facilmente no nosso fluxo de análise. O `dplyr` tem como base poucos verbos que resolvem boa parte dos problemas envolvendo manipulação de dados.

Um outro ponto é que o `dplyr` permite que façamos um código facilmente legível e compreensível, justamente pelo fato de usar verbos e também de permitir o encadeamento, que faz com que a sequência do código seja mais próxima da maneira com que pensamos. Além disso, o pacote é bem rápido, ainda que não seja tão rápido quanto o `data.table` (que não tem uma sintaxe tão amigável).

As funções do `dplyr` podem ser utilizadas para manipular tabelas do SQL, sem importar a tabela para o R (utilizando lazy query), mas isso é assunto para um post futuro. Existe também uma comunidade grande de programadores do R que utilizam o pacote.

## Instalação

Temos duas opções: Podemos instalar apenas o dplyr ou todo o tidyverse (recomendado):

```{r eval = F}
install.packages("tidyverse")

require(tidyerse)
```

```{r echo = F, message=FALSE, warning=FALSE}
require(tidyverse)
```

## Dados

Neste post vamos apresentar as principais funções do pacote com exemplos, e para isso utilizaremos o dataset `starwars`, que pode ser utilizado ao ativar o `dplyr`. O dataset tem informações sobre personagens da saga, que foram coletados de uma [API de Star Wars](http://swapi.co/). 


![](./imagem-01.jpg)

Vamos dar uma olhada no dataset:

```{r}
starwars
```

Já podemos ver que não estamos lidando com um `data.frame` tradicional. Este é um `tibble`, que é, basicamente, um data.frame com uma série de modificações. A propósito, [`tibble`](https://tibble.tidyverse.org/) é outro pacote do `tidyverse`. Note que são mostradas as quantidades de linhas e colunas, apenas as 10 primeiras linhas são printadas, a classe das colunas é indicada, e, caso haja coluna(s) cujo conteúdo exceda o tamanho da janela, elas não são printadas, mas apenas listadas ao final.

Nesse `tibble` temos então, para 87 personagens de Star Wars, informações de nome, altura, massa, cor de cabelo, pele, dos olhos, idade na batalha de Yavin (quando os rebeldes destruíram a primeira estrela da morte), gênero, mundo natal, espécie, lista de filmes onde o personagem aparece, lista de veículos que o personagem pilotou e lista de naves que o personagem pilotou. Perceba que usei a palavra 'lista' nessas três ultimas informações, isso porque essas colunas são realmente listas. Podemos, então, ter um `tibble` onde colunas são listas.

Também podemos utilizar a função `glimpse`, do pacote `tibble`, para visualizar a tabela de outra maneira. A função é carregada ao ativar o `dplyr`. Observe que o `glimpse` também mostra o número de linhas e colunas, além de mostrar a classe das colunas e alguns valores dessas colunas.

```{r}
glimpse(starwars)
```

Apesar da concepção de `data.frame` do `tidyverse` ser o `tibble`, é perfeitamente possível utilizar suas funções com um `data.frame`. Porém para transformar um `data.frame` em um `tibble`, basta usar a função `as_tibble` (ou `as_data_frame`).

## Funções básicas (verbos)

O `dplyr` oferece 5 verbos (funções) básicos, que resolvem alguns problemas comuns:

- `select`: Seleciona colunas.
- `filter`: Filtra registros (linhas).
- `mutate`: Cria novas variáveis (colunas).
- `summarise` (ou `summarize`): Reduz uma série de valores de uma coluna em um valor apenas.
- `arrange`: Ordena o `data.frame` de acordo com os valores de uma(s) coluna(s).

Além disso, existe a função `group_by`, que pode ser usada em conjunto com os verbos, de maneira a fazer operações por grupos de valores de coluna(s).

Todas essas funções recebem pelo menos dois argumentos: o `data.frame` e o(s) argumento(s) pertinente(s) à função (nomes de colunas, funções, condições). A seguir vamos utilizar as funções para ficar mais clara sua sintaxe.

## Uso

- O `select` seleciona colunas, podendo ser indicadas pelos nomes (com ou sem aspas, embora seja preferível não usar aspas) ou pelo índice da coluna. Por exemplo, se quisermos selecionar as colunas `name`, `height` e `mass`, podemos selecioná-las das seguintes maneiras:

    ```{r eval = F}
    select(starwars, name, height, mass)
    # ou
    select(starwars, "name", "height", "mass")
    # Ou, como as colunas são seguidas
    select(starwars, name:mass)
    # Utilizando os índices
    select(starwars, 1:3)
    ```
    
    Gerando o seguinte output:
    
    ```{r echo = F}
    select(starwars, name:mass)
    ```
    
    Também podemos remover colunas. Por exemplo, queremos selecionar todas as colunas do nosso `tibble`, exceto a coluna `height`:
    
    ```{r}
    select(starwars, -height)
    ```

- A função `filter` recebe uma ou mais condições lógicas e retorna as linhas do `tibble` que atendam o solicitado. Vamos filtrar personagens que não têm cabelo, logo `hair_color` é `NA`:

    ```{r}
    filter(starwars, is.na(hair_color))
    ```

    Podemos também utilizar mais de uma condição (usando & ou |). Se quisermos registros que atendam a todas as condições, podemos utilizar & (E) ou separar as condições por vírgulas. E quando for necessário registros que atendam a pelo menos uma condição, devemos utilizar o operador | (OU). Vamos agora filtrar personagens sem cabelo e Droids:
    
    ```{r}
    filter(starwars, is.na(hair_color), species == "Droid")
    ```
    
![](./imagem-02.png)

Vamos agora filtrar por personagens com mais de 130 kg e selecionar `name`, `height`, `mass` e `homeworld`:

```{r}
select(filter(starwars, mass > 130), name:mass, homeworld)
```

Apesar de termos só duas funções envolvidas, veja que começa a não ser tão simples de ler o que o R irá fazer com esse comando. Quando o número de funções aumenta, isso fica bem pior de ler. Para resolver esse problema, o `tidyverse` propõe uma maneira de encadear o código:

- **pipe** (`%>%`): O **pipe** é o operador que faz o encadeamento das funções do `tidyverse`. Este operador é do pacote [`magrittr`](https://magrittr.tidyverse.org/), mas ao carregar o `dplyr` já poderemos usá-lo. Seu atalho, no RStudio, é *(Cmd)Ctrl + Shift + M*. O *pipe* irá pegar o resultado da expressão a sua esquerda e colocar como primeiro argumento (por padrão) da expressão da direita. Como as funções do `dplyr` recebem um `tibble` no primeiro argumento, então isso vai facilitar a escrita. Vejamos o exemplo anterior com o pipe:

    ```{r}
    starwars %>% 
      filter(mass > 130) %>% 
      select(name:mass, homeworld)
    ```

    Perceba que agora o código fica muito mais simples de entender: Pegamos o `tibble` starwars, filtramos personagens com mais de 130 kg e do `tibble` resultante do filtro selecionamos as colunas desejadas.

- Com o `mutate` podemos criar novas colunas e essas novas colunas podem ser criadas em função das já existentes. Vamos calcular o IMC dos personagens, mas para isso precisamos da altura em metros. Vamos então criar uma coluna com a altura em metros e usar esse coluna recém criada para o cálculo do IMC:

    ```{r}
    starwars %>% 
      mutate(altura_metros = height/100,
             IMC = mass/(altura_metros^2)) %>% 
      select(name, IMC) 
    ```

- O `summarise` (ou `summarize`) permite que usemos funções de sumarização, ou seja, funções que recebem $n$ elementos e retornam apenas $1$ valor. Vamos calcular a maior altura e a massa média:

    ```{r}
    starwars %>% 
      summarise(max_altura = max(height, na.rm = T),
                massa_media = mean(mass, na.rm = T))
    ```

- Usamos o `arrange` para ordenar o `tibble`, de maneira crescente ou decrescente. Vamos refazer o cálculo do IMC e usar essa coluna para ordenar, em ordem crescente, o `tibble` resultante:

    ```{r}
    starwars %>%
      mutate(altura_metros = height/100,
             IMC = mass/(altura_metros^2)) %>% 
      select(name, height, mass, IMC) %>% 
      arrange(IMC)
    ```
    
    Para que a ordenação seja feita de maneira decrescente basta utilizar o símbolo `-`, ou então a função `desc`
    
    ```{r}
    starwars %>%
      mutate(altura_metros = height/100,
             IMC = mass/(altura_metros^2)) %>% 
      select(name, height, mass, IMC) %>% 
      arrange(-IMC) # Ou arrange(desc(IMC))
    ```
    
    Também podemos reordenar o `tibble` de acordo com mais de uma coluna.
    
    ```{r}
    starwars %>% 
      arrange(hair_color, name, -mass, -birth_year)
    ```
    
- Por fim, podemos realizar todas as operações por grupos. Para isso existe a função `group_by`. Faremos então o cálculo da maior altura e a massa média por espécie:

    ```{r}
    starwars %>% 
      group_by(species) %>% 
      summarise(max_altura = max(height, na.rm = T),
                massa_media = mean(mass, na.rm = T))
    ```
    
    Todos os outros verbos têm (ou podem ter) seu comportamento alterado ao usar `group_by`. Nessa [página](https://dplyr.tidyverse.org/articles/dplyr.html#grouped-operations) os comportamentos são descritos.
    
## Fonte

[Vignette de Introdução ao `dplyr`](https://dplyr.tidyverse.org/articles/dplyr.html)