---
title: 'Trabalhando com amostras complexas no R: usando o pacote survey'
author: dadosaleatorios
date: '2014-06-13'
categories:
  - amostra complexa
  - dados públicos
  - microdados
  - sample
slug: ./2014-06-13-trabalhando-com-amostras-complexas-no-r-usando-o-pacote-survey
---

Ao contrário da amostra aleatória simples, nos planos amostrais complexos as unidades amostrais (geralmente, pessoas) possuem probabilidades diferentes de serem amostradas quando comparadas com outras unidades amostrais e, devido a isso, todas as análises realizadas sobre amostras complexas devem levar em consideração a probabilidade de cada um dos indivíduos amostrados. Nessa postagem, mostrarei como utilizar o pacote survey, que permite a realização de inferências e análises em amostras complexas. Para tal, utilizarei os dados da amostra do Censo de 2010.

### Como assim, amostra do censo?!

Como já precisei explicar mais de uma vez, acho que vale a pena explicar aqui também: paralelo ao censo demográfico - onde todas as pessoas respondem o mesmo questionário, o IBGE desenvolve também uma pesquisa amostral, onde um determinado percentual de domicílios são sorteados e todos os moradores desse domicílio respondem, além do questionário do universo, um questionário mais longo e detalhado (coloquei os questionários no meu [Drive](http://goo.gl/gK3l2k)). Esse percentual varia de cidade para cidade, sendo que em 2010 um total de 6.192.332 (10,67%) domicílios foram amostrados. Os 2 questionários possuem perguntas em comum, o que permite, após juntar os setores censitários em Áreas de Expansão dos Dados da amostra (AEDs), calcular pesos para cada uma das unidades amostrais (tanto domicílio quanto pessoas). Maiores detalhes sobre a metodologia usada podem ser encontrados na documentação disponibilizada pelo IBGE [aqui](ftp://ftp.ibge.gov.br/Censos/Censo_Demografico_2010/Resultados_Gerais_da_Amostra/Microdados/Documentacao.zip).

### Ta, mas qual é o delineamento? E como incorporar ele às análises?

Infelizmente não existe (ou eu não encontrei) um documento do IBGE que deixe claro qual é o delineamento amostral utilizado. Depois de um tempo pesquisando, conclui que, para domicílios é uma amostra estratificada (onde os estratos são as AEDs) e, para pessoas é uma amostra em cluster estratificada em 1 etapa (onde os estratos são as AEDs e os clusters as residências). Há ainda outros dois bancos disponibilizados nos microdados: o de emigrantes e o de pessoas falecidas. Os dados podem ser baixados [aqui](ftp://ftp.ibge.gov.br/Censos/Censo_Demografico_2010/Resultados_Gerais_da_Amostra/Microdados/). Alguns municípios tiveram as suas AEDs alteradas após a primeira publicação, e seus novos microdados encontram-se [aqui](ftp://ftp.ibge.gov.br/Censos/Censo_Demografico_2010/Resultados_Gerais_da_Amostra_areas_de_ponderacao/Municipios_com_areas_de_ponderacao_redefinidas/microdados_%2014_municipios_com_areas_redefinidas.zip). Para os exemplos, utilizarei os de Porto Alegre, que está entre os 14 municípios que tiveram suas AEDs alteradas.

Após carregar os dados (e aplicar os labels das variáveis de interesse) e o pacote survey, devemos informar o delineamento amostral. Tanto para domicílio quanto para pessoas, o comando para definir o delineamento utilizado é:

amostra <- svydesign(ids = ~ V0300,  strata = ~ V0011, weights = ~ V0010, fpc = ~ FPC, data = dados)

No parâmetro ids informamos os clusters, identificados através da variável V0300 (no layout dos dados, disponível junto com a documentação, ela é identificada como variável controle), que é um valor único para cada residência amostrada. No parâmetro strata informamos os estratos, identificados pela variável V0011, que é o código das áreas de ponderação. O IBGE fornece o peso amostral de cada unidade amostral (com precisão de 13 decimais!) na variável V0010, que é informado pelo parâmetro weights. Por fim, informo a população de cada estrato através do parâmetro fpc (Finite Population Correction), sendo o único parâmetro não dado no banco disponibilizado pelo IBGE, se fazendo necessário a sua obtenção através da soma dos pesos de todas unidades amostrais do estrato.

### E as análises?

O pacote apresenta uma série de análises já corrigidas para diversos delineamentos amostrais. Por exemplo, podemos fazer uma tabela de frequência através do svytable(~ V0633, design = amostra). Para calcular uma média, podemos utilizar svymean(~ V6525, amostra, na.rm = TRUE). Caso queiramos calcular a média de acordo com os fatores de uma variável categória, podemos utilizar o [svyby()](http://r-survey.r-forge.r-project.org/survey/html/svyby.html), que é uma versão do by() para objetos do pacote survey, ficando assim  svyby(~ V6525, ~ V0633, amostra, svymean, na.rm = TRUE). Note que esses 2 comandos retornam também o erro padrão da estimativa (SE). É possível realizar alguns testes estatísticos também, como o Teste-t ([svyttest()](http://r-survey.r-forge.r-project.org/survey/html/svyttest.html)), Qui-quadrado ([svychisq()](http://r-survey.r-forge.r-project.org/survey/html/svychisq.html)) e até mesmo ANOVA ([svyglm()](http://r-survey.r-forge.r-project.org/survey/html/svyglm.html)), entre outros. Disponibilizei também no meu [Drive](http://goo.gl/gK3l2k) alguns exemplos de análises utilizando os dados de Porto Alegre, junto com o comando de leitura do banco disponibilizado.

Dúvidas? Críticas? Sugestões? Deixe seu comentário!
