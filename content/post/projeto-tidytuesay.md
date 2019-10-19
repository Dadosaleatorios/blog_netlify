+++
author = "Larissa Lima"
categories = []
date = ""
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

Vamos criar um gráfico para visualizar o número de visitas nos parques, por ano.

***

###### Primeiro precisamos selecionar as variáveis de interesse. Para isso, vamos selecionar as var. "year" e "visitors"; depois iremos calcular o número total de visitantes por ano.

Aqui utilizaremos algumas das funções mais importantes do pacote dplyr, que foi explicado no post... e iremos armazenar o resultado em um novo data set chamado 'visitors_year'.