+++
author = "Larissa Lima"
categories = []
date = 2020-05-28T03:00:00Z
draft = true
post-image = ""
slug = ""
tags = []
title = "Projeto TidyTuesay"

+++
E aí galera!

Hoje iremos falar sobre um dos desafios do "Tidytuesday", onde iremos construir o primeiro gráfico do artigo base "The National Parks Have Never Been More Popular" do famoso site [fivethirtyeight](https://fivethirtyeight.com/features/the-national-parks-have-never-been-more-popular/).

#### Mas o que é o Tidytuesday?

É um projeto de dados semanal bem interessante voltado para o ambiente R. Toda terça-feira é lançado um projeto e para a realização dele, é disponibilizado o data set referente a esse desafio. Esse projeto nasceu do 'R4DS Online Learning Community' e do '[R for Data Science](https://r4ds.had.co.nz/)', com o objetivo de aprender como resumir e organizar dados para fazer gráficos significativos com os pacotes "ggplot2", "tidyr", "dplyr" e outras ferramentas no ambiente tidyverse. Ao realizar um desafio, eles pedem para compartilhar o código usado para gerar os resultados.

#### **Iniciando**

Para dar início, precisamos instalar o pacote "Tidyverse" e para isso usamos o comando abaixo:

***

\[ \]

    install.packages("tidyverse") #instalando o pacote Tidyverse

***

Após instalar o pacote, precisamos carregá-lo para que possamos usar. Então utilizamos o comando "require()" para realizar essa função. Neste projeto, além do pacote "tidyverse", precisaremos do pacote "scales".

    require(tidyverse) #carregando o pacote Tidyverse
    
    require(scales) #carregando o pacote 'scales' para definir a escala do gráfico

#### **Leitura dos dados**

Agora precisamos ler os bancos de dados que foram disponibilizados para a realização do projeto e que iremos utilizar.

    park_visits <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-09-17/national_parks.csv")
    state_pop <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-09-17/state_pop.csv")
    gas_price <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-09-17/gas_price.csv")

Como o data set é muito grande, podemos ter uma visualização rápida do início do data set usando a função "head()" ou do final do data set com a função "tail()".

    head(park_visits) #visualizando o início do dataset
    tail(park_visits) #visualizando o final do dataset
    
    head(state_pop) #visualizando o início do dataset
    head(gas_price) #visualizando o início do dataset

**OBS:** Ao chamar o pacote "tidyverse", já teremos disponíveis os dois pacotes que iremos utilizar: dplyr e ggplot2. O pacote "dplyr" é voltado para manipulação dos dados e o pacote "ggplot2" é voltado para criar gráficos.

#### Vamos criar um gráfico para visualizar o número de visitas nos parques, por ano.

Primeiro precisamos selecionar as variáveis de interesse. Para isso, vamos selecionar as variáveis "year" e "visitors"; depois iremos calcular o número total de visitantes por ano.

Aqui utilizaremos algumas das funções mais importantes do pacote dplyr, que foi explicado no post \[Introdução ao dplyr\]([https://www.dadosaleatorios.com.br/post/introdu%C3%A7%C3%A3o-ao-dplyr/](https://www.dadosaleatorios.com.br/post/introdu%C3%A7%C3%A3o-ao-dplyr/ "https://www.dadosaleatorios.com.br/post/introdu%C3%A7%C3%A3o-ao-dplyr/")) e iremos armazenar o resultado em um novo data set chamado 'visitors_year'.

    visitors_year <- park_visits %>%
                        select(year, visitors) %>%
                        group_by(year) %>%
                        summarise(total_visit = sum(visitors, na.rm = TRUE))

Para visualizar como ficou os filtros, podemos pedir pra ver o ínicio do novo banco de dados que ficou armazenado em 'visitors_year' e também visualizar o tipo das variáveis com o comando 'glimpse':

    head(visitors_year)
    glimpse(visitors_year)

Agora iremos plotar o gráfico, a partir do novo dataset "visitors_year":

    ggplot(visitors_year, aes(x = year, y = total_visit)) +
      geom_point()

Para armazenar as informações de maneira desagrupada usamos a função "ungroup()":

    visitors_year <- visitors_year %>% ungroup()

Ao observar o gráfico, podemos ver que tem uma informação que é muito discrepante da massa de dados. Para isso, precisamos investigar o porquê isso acontece.

Então, vamos utilizar a função "unique()" na variável "year", que irá mostrar cada observação sem repetição.

    unique(park_visits$year)

Aqui a função "unique()" mostra todos os anos presentes no data set, mas sem repetição. Então observamos existe uma observação "Total". Essa observação está presente no data set original e contabiliza o número total de visitas no período.

Agora iremos retirar do banco a observação "Total" e iremos aproveitar para filtar a variável "unit_type" que tem a nomenclatura "National Park":

    visitors_year <- park_visits %>%
      select(year, visitors, unit_type)%>%
      filter(year != "Total", 
             str_detect(unit_type, "National Park$"), visitors > 0
            ) %>%
      group_by(year) %>%
      summarise(total_visit = sum(visitors, na.rm = TRUE))
    

Fizemos um filtro para retirar os dados referentes ao "Total" dentro da variável "year". Depois disso, selecionamos todos os parques onde a variável "unit_type" é igual a "National Park". 

Para isso utilizamos a função **"str_detect()"** que tem como objetivo detectar a presença ou ausência de algum padrão dentro de uma string. A estrutura básica dessa função é a seguinte:

\**str_detect(string, pattern)**

Onde: 

\* string: é a variável que desejamos analisar; 

\* pattern: é o padrão a ser buscado na string. 

O parâmetro **pattern** é utilizado com expressões regulares, que são formas robustas de identificar padrões de caracteres. Para uma breve explicação, \[acesse aqui\]([https://rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf](https://rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf "https://rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf")).

No nosso caso, **string** é a variável "unit_type" e **patter** é "National Park". Note que utilizamos um '\\$' ao final da palavra Park. Ao observar a variável "unit_type" dentro do data set "park_visits" existem nomenclaturas com "Park" e também com"Parkway". Então para garantir que iremos pegar apenas os nomes iguais a "National Park", utilizamos o '\\$' para mostrar que queremos exatamente essa nomenclatura.

    unique(park_visits$unit_type)
    head(visitors_year)

Com o dataset que iremos usar pronto, vamos criar algumas var. necessárias para usar no comando do gráfico:

Aqui, iremos criar os intervalos dos eixos X e Y para ficarem iguais ao gráfico que desejamos construir. Se não criarmos esses intervalos, o R irá criar automaticamente.

* Então, para o eixo X vamos criar uma variável "breaks" que irá armazenar uma sequência que começa em 1910 e vai até 2010, com um intervalo de 10 unidades. Já a variável "labels" irá armazenar os valores (neste caso, não são números e sim caracteres) que irão aparecer na legenda do eixo X.

    breaks <- seq(1910, 2010, by = 10) 
    labels <- c("1910", "'20", "'30", "'40", "'50", "'60", "'70", "'80", "'90", "2000", "'10") #montando manualmente os ticks do eixo x

\* Para o eixo Y, também iremos criar uma sequência para montar manualmente os valores que irão aparecer. A variável Y indica o número de visitas por ano. Então, na variável "labels" precisaremos ajustar a escala para milhão, então usaremos a função unit_format() do pacote "scales" (que carregamos no início do projeto) que nos permitirá ajustar essa escala. Para mais informações sobre esse pacote, \[clique aqui\]([https://www.tidyverse.org/articles/2018/08/scales-1-0-0/](https://www.tidyverse.org/articles/2018/08/scales-1-0-0/ "https://www.tidyverse.org/articles/2018/08/scales-1-0-0/")).

    breaks_y <- seq(0, max(visitors_year$total_visit), by = 20e+6) #criando uma sequência para montar os ticks do eixo y
    labels_y <- unit_format(unit = "M",scale = 1e-6)(breaks_y) #montando os ticks do eixo y

#### Plotando o Gráfico

Para plotar o gráfico precisamos em cada função do [pacote ggplot2](https://ggplot2.tidyverse.org/) especificar o que queremos.

* ggplot(): aqui especificamos o data set que iremos usar e quem são as variáveis x e y;
* geom_area(): definimos o tipo de gráfico, que neste caso é um gráfico com preenchimento de área;
* scale_x_discrete(): aqui iremos especificar os intervalos que montamos acima e as legendas ("breaks" e "labels");
* scale_y_continuous(): idem a função acima;
* labs(): aqui definimos o título e o sub-título do gráfico;
* theme(): usaremos essa função para retirar os títulos de cada eixo com os parâmetros **"axis.title.x = element_blank()"** e **"axis.title.y = element_blank()"**.

Então, com o código abaixo o gráfico proposto no projeto será gerado:

     ggplot(visitors_year, aes(x = year, y = total_visit, group = 1)) + #definindo o dataset e as var. de cada eixo (x,y)
      geom_area(color = "green4", fill = "green4", alpha = 0.4) + #gráfico com preenchimento de áerea
      scale_x_discrete(breaks = breaks, labels = labels) + #definindo os ticks do eixo x
      scale_y_continuous(breaks = breaks_y, labels = labels_y) + #definindo os ticks do eixo y
      labs(title = "U.S. national parks have never been so popular", 
           subtitle = "Annual recreational visits to national parks since 1904") + #escrevendo o título e subt-título
      theme(axis.title.x = element_blank(), axis.title.y = element_blank()) #retirando o título de cada eixo
      

Pronto, agora já temos nosso gráfico!