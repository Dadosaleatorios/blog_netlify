---
title: apply, lapply, sapply, tapply, mapply.. Como é que é mesmo?
author: dadosaleatorios
date: '2014-01-17'
categories:
  - linguagem R
  - tutorial
slug: ./2014-01-17-apply-lapply-sapply-tapply-mapply-como-e-que-e-mesmo
---

Acredito que a esta altura do campeonato todos já devem se questionar sobre a performance do R. Existe um Carma que é carregado de que não é eficiente em termos de gerenciamento de memória e velocidade. Tudo bem, temos que cofessar que estes itens não podem ser classificados como os pontos fortes da linguagem, porém nem tudo está perdido e dependendo da situação, contorná-la pode ser mais simples do que parece, em especial quando o assunto é velocidade.

Escrever loops da forma tradicional pode ser uma verdadeira tortura, tanto para o usuário quanto para o computador. Se você já tentou aninhar mais de 3_ for's_ sabe do que estou falando. Claro que não existe uma ferramenta mágica que vai fazer com que seu loop passe de 2 horas paras 5 segundos, porém com as metafunções da família_ apply_ muita coisa pode ser melhorada. As funções da família _apply_ são um conjunto muito poderoso de funções que sob certas condições permitem a aplicação de outras funções em objetos do R .

Algumas vezes as funções que são utilizadas junto das funções apply são conhecidas como funções anônimas. Isto significa que elas são definidas apenas no contexto do apply e uma vez feito isso, não farão parte do ambiente global. Um exemplo é exibido quando a função lapply é abordada.

#### apply

Aplica uma função nas margens de um array qualquer. Geralmente é aplicado em uma matriz/dataframe de forma a aplicar uma mesma função em todas as linhas ou colunas daquele objeto. Recebe como argumento um array, a marginal sobre a qual a função será aplicada e a função.

```r
 # apply.R<br></br>X = matrix(rnorm(200), ncol=20) # matriz com 20 colunas e 10 linhas<br></br>media_linha = apply(X, 1, mean) # média por linha<br></br> [1]  0.04379803  0.16120193  0.18021305 -0.24121940  0.25072885 -0.35231844<br></br> [7]  0.06052024  0.17069682 -0.11181799  0.04517407<br></br><br></br>
```

Casos Especiais: As funções rowSums, rowMeans, rowSums e colMeans podem ser facilmente substituídas por uma função apply (por exemplo, _rowSums(X) = apply(X,1, sum)_ ), porém no caso destas tarefas em particular, estas funções são super otimizadas.

Obs.: É importante lembrar que em termos de velocidade a função apply não supera tanto um loop normal, mas só o fato de poder escrever o loop em uma linha já é um bom motivo para usá-lo sempre que puder.

#### lapply

É uma função que é aplicada em cada elemento de um vetor ou cada nó de uma lista. O output é uma lista obrigatoriamente. Recebe como argumentos um vetor/lista e uma função.

```r
 # lapply.R<br></br>X = list(x1=c(1,2,NA,4,5), x2=rnorm(100), x3=rnorm(100) )<br></br>lapply(X, mean)<br></br><br></br>$x1<br></br>[1] NA<br></br><br></br>$x2<br></br>[1] -0.1908649<br></br><br></br>$x3<br></br>[1] -0.1315371<br></br><br></br>
```

Como podem ver, a saída é uma lista e o nó _x1_ ficou com _NA._ O resultado é claro, uma vez que a função _mean_ por padrão não trata os valores faltantes. Para resolver isto, existem 2 caminhos. O primeiro é declarar a função anônima que foi citada anteriormente, e isto significa definir uma nova função com os argumentos alterados dentro do próprio _lapply_, e neste caso ficaria  **lapply(X, function(x) mean(x, na.rm=T) ) .** A outra solução é passar os argumentos via "..." da função lapply e neste caso a solução seria **lapply(X, mean, na.rm=T)** .

#### sapply

Similar ao lapply, porém a saída geralmente é simplificada, sendo apenas um vetor. Caso sua saída seja mais de um elemento, a saída deixa de ser um vetor e passa a ser uma matriz. Recebe como argumentos um vetor/lista e uma função. A diferença para o _lapply_ é que o _sapply_ tenta simplificar o resultado, retornando assim um vetor ou algo parecido.

```r
 # sapply.R<br></br>sapply(X, function(x)mean(x, na.rm=T) ) # Cálculo da média de cada elemento da lista via função anônima.<br></br>
```

#### tapply

Função com o objetivo de aplicar funções em grupos diferentes. Suponha que você tenha um dataframe com 2 colunas, uma com altura e outra com gênero, e você queira calcula a média de idade para cada um dos gẽneros, então neste caso a função tapply se aplica perfeitamente. Recebe como argumentos um vetor, um vetor com os fatores que irão estratificar o resultado e a função a ser aplicada em cada estrato.

```r
 # tapply.R<br></br>X = rnorm(100) <br></br>fator = sample(factor(c('a', 'b')), 100, rep=T) <br></br>tapply(X, fator, mean) # A média dos valores por categoria<br></br>          a           b <br></br>-0.08495240 -0.06317896 <br></br>
```

#### mapply

É bem provável que seja a função da família apply menos utilizada, porém também tem sua importância na utilização do R. Esta é uma versão multivariada do _sapply _e recebe como argumentos uma função e um conjunto de argumentos. A função é aplicada em cada um dos argumentos sequencialmente.

```r
 # mapply.R<br></br>mapply(rep, 1:4, 4:1)<br></br>[[1]]<br></br>[1] 1 1 1 1<br></br><br></br>[[2]]<br></br>[1] 2 2 2<br></br><br></br>[[3]]<br></br>[1] 3 3<br></br><br></br>[[4]]<br></br>[1] 4<br></br><br></br>
```

No caso do exemplo acima, seria o mesmo que fazer** list(rep(1,4), rep(2,3), rep(3,2), rep(4,1)) **.
