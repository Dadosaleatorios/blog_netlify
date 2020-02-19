---
title: Ferramentas para criação de tabelas LaTex a partir do R
author: dadosaleatorios
date: '2014-01-07'
categories:
  - latex
  - linguagem R
slug: ./2014-01-07-ferramentas-para-criacao-de-tabelas-latex-a-partir-do-r
image: 'images/blog/post-latex.png'
---

Sair do ambiente R para exportar resultados e tabelas nem sempre é uma tarefa fácil, em especial quando deseja-se exportar estes resultados para o ambiente LaTex. O motivo é simples de ser entendido, afinal nem nem sempre os resultados possuem uma estrutura simples e como acontece, as vezes este é demasiadamente grande. Neste post, vamos discutir algumas soluções para tornar esta tarefa mais simples e é claro, mais divertida. Além disso, vamos ilustrar exemplos da utilização de tais pacotes.

  * [**Pacote xtable**](http://cran.r-project.org/web/packages/xtable/index.html)

Provavelmente é o pacote mais utilizado para transformar objetos R em objetos LaTex ou HTML. Sua utilização é extremamente simples e o pacote possui basicamente uma única função, que é a função xtable e claramente, esta possui muitos argumentos. Consegue transformar dataframes, matrizes e suporta pelo menos as saídas das seguintes funções: lm, aov, anova, glm, prcomp e ts.

```r
# xtable.R<br></br>xtable(mtcars) # imprimindo um dataframe no formato LaTex<br></br>ajuste = lm(hp~wt, data=mtcars)<br></br>ajuste_latex = xtable(ajuste)<br></br>print(ajuste_latex, type='latex')<br></br>
```

Uma descrição melhor do pacote pode ser achada [aqui](http://cran.r-project.org/web/packages/xtable/vignettes/xtableGallery.pdf). A tabela a seguir exibe o output quando _type='html'_.

<table border="1" ><tbody ><tr > Estimate  Std. Error  t value  Pr(&gt |t|)   </tr><tr >
<td align="right" >(Intercept)
</td>
<td align="right" >-1.8209
</td>
<td align="right" >32.3246
</td>
<td align="right" >-0.06
</td>
<td align="right" >0.9555
</td> </tr><tr >
<td align="right" >wt
</td>
<td align="right" >46.1601
</td>
<td align="right" >9.6253
</td>
<td align="right" >4.80
</td>
<td align="right" >0.0000
</td> </tr></tbody></table>

  * [**Pacote texreg**](http://cran.r-project.org/web/packages/texreg/index.html)

Este é um pacote que basicamente transforma saídas de modelos em objetos LaTex, HTML, markdown e doc. E mais do que isso, ele é capaz de gerar outputs com comparações entre modelos. Suporta cerca de 52 tipos diferentes de objetos, dentre eles lm, glm, lme, survreg, logit, weibreg e multinom.

Exemplo de utilização

```r
# texreg.R<br></br>m1 = lm(hp~wt, data=mtcars)<br></br>m2 = lm(hp~wt-1, data=mtcars) # Sem intercepto<br></br>texreg(list(m1, m2))<br></br>
```

Uma quantidade arbitrária de modelos pode ser passado para a função texreg, desde que estejam dentro de uma lista. Caso selecione que o output seja um código HTML, o seguinte resultado será gerado. Uma descrição melhor do pacote pode ser encontrada [aqui](http://cran.r-project.org/web/packages/texreg/vignettes/v55i08.pdf).

<table align="center" cellspacing="0" style="border:none;" >  Statistical models  <tbody ><tr >        **Model 1**    **Model 2**  </tr><tr >
<td style="border:none;padding-right:12px;" >(Intercept)
</td>
<td style="border:none;padding-right:12px;" >-1.82
</td>
<td style="border:none;padding-right:12px;" >
</td>  </tr><tr >
<td style="border:none;padding-right:12px;" >
</td>
<td style="border:none;padding-right:12px;" >(32.32)
</td>
<td style="border:none;padding-right:12px;" >
</td>  </tr><tr >
<td style="border:none;padding-right:12px;" >wt
</td>
<td style="border:none;padding-right:12px;" >46.16***
</td>
<td style="border:none;padding-right:12px;" >45.64***
</td>  </tr><tr >
<td style="border:none;padding-right:12px;" >
</td>
<td style="border:none;padding-right:12px;" >(9.63)
</td>
<td style="border:none;padding-right:12px;" >(2.72)
</td>  </tr><tr >
<td style="border-top:1px solid black;" >R2
</td>
<td style="border-top:1px solid black;" >0.43
</td>
<td style="border-top:1px solid black;" >0.90
</td>  </tr><tr >
<td style="border:none;padding-right:12px;" >Adj. R2
</td>
<td style="border:none;padding-right:12px;" >0.42
</td>
<td style="border:none;padding-right:12px;" >0.90
</td>  </tr><tr >
<td style="border-bottom:2px solid black;" >Num. obs.
</td>
<td style="border-bottom:2px solid black;" >32
</td>
<td style="border-bottom:2px solid black;" >32
</td>  </tr><tr >
<td colspan="3" style="border:none;padding-right:12px;" >***p < 0.001, **p < 0.01, *p < 0.05
</td>  </tr></tbody></table>

  * [**Pacote Hmisc**](http://cran.r-project.org/web/packages/Hmisc/index.html)

Diferentemente dos pacotes citados anteriormente, este não foi feito com o único propósito de gerar tabelas em formato LaTex e html. Na verdade este pacote é um conjunto de funções úteis, desde cálculo de tamanho de amostra até manipulação de strings, e é claro que nesse meio não poderia faltar uma função para gerar tabelas LaTex. Outra funcionalidade interessante é o suporte ao longtable e a grande flexibilidade fornecida pelo pacote. Para maiores detalhes, _?latex_.

```r
# Hmisc.R<br></br>latex(mtcars) # Vai gerar um arquivo no seu diretório de trabalho.<br></br>latexTabular(mtcars) # Imprime a tabela.<br></br>
```

  * **[Pacote tables](http://cran.r-project.org/web/packages/tables/)**

Pacote criado com o objetivo de criar e exibir tabelas complexas com informações estatísticas. Na verdade o pacote em si não gera nenhum tipo de código LaTex, mas sim ajuda a criar tabelas com um design agradável. Para a criação do código LaTex, é necessário utilizar um dos outros pacotes descritos aqui.

```r
# tables.R<br></br>formula = (as.factor(gear) + 1) ~ (n = 1) + (hp + wt) * (mean + sd)<br></br>tabular(formula, data = mtcars)<br></br>
```

Apesar de inicialmente a sintaxe parecer estranha, com o tempo dá para encará-la com mais naturalidade e parece que em parte foi influenciada pelo SAS PROC TABULATE. A criação das tabelas é dada por meio de fórmulas, por exemplo, aquelas mesmas fórmulas que são utilizadas em um modelo de regressão e então a função tabular parseia esta fórmula e cria a tabela desejada.

Agora é hora de vermos como a sintaxe funciona. A primeira coisa que devemos saber é: O que está antes do **~** serão as linhas e o que estiver depois  serão as colunas.

Para as linhas, estamos transformando a variável gears em um fator(deseja-se calcular média e desvio-padrão para cada quantidade de marchas do carro) e 1 nada mais significa que calcular as estatísticas para todas classes de _gear _, e nestes casos, o sinal de + tem o significado de concatenação.

Com as colunas a coisa não muda muito, e assim como acontecia com as linhas,  o sinal de + continua significando concatenação. A primeira coluna é correspondente a _n=1_ e uma vez que nenhuma outra estatística foi atribuída, simplesmente irá retornar o número de casos de cada uma das  classes de _gear_. Para a segunda coluna, estamos falando que para as variáveis _hp_ e _wt_, terão de ser aplicadas as funções _mean_ e _sd_. Para cada classe de _gear_, calcule o número de observações, média e variância para as variáveis hp e _wt_. Aplicando a função que latex do pacote _Hmisc_ o resultado será como segue abaixo. Uma descrição melhor do pacote pode ser encontrada [aqui](http://cran.r-project.org/web/packages/tables/vignettes/tables.pdf).

<table rules="groups" style="margin:0 auto;width:500px;" ><tr class="center" >      hp  wt</tr><tr class="center" >  as.factor(gear)  n  mean  sd  mean  sd</tr><tbody ><tr class="center" >  3
<td >

15

</td>
<td >

176.1

</td>
<td >

47.69

</td>
<td >

3.893

</td>
<td >

0.8330

</td></tr><tr class="center" >  4
<td >

12

</td>
<td >

89.5

</td>
<td >

25.89

</td>
<td >

2.617

</td>
<td >

0.6327

</td></tr><tr class="center" >  5
<td >

5

</td>
<td >

195.6

</td>
<td >

102.83

</td>
<td >

2.633

</td>
<td >

0.8189

</td></tr><tr class="center" >  All
<td >

32

</td>
<td >

146.7

</td>
<td >

68.56

</td>
<td >

3.217

</td>
<td >

0.9785

</td></tr></tbody></table>

  * [**Pacote reporttools**](http://cran.r-project.org/web/packages/reports/index.html)

Assim como o tables, este é um pacote que fornece facilidades na criação de tabelas com resultados de estatística descritiva.

```r
# reporttools.R<br></br>variaveis = mtcars[, c('hp', 'wt')]<br></br>grupos = factor(mtcars$gear)<br></br>tableContinuous(vars=variaveis, group=grupos, pval=none )<br></br>
```

Por padrão, ele calcula uma série de estatísticas descritivas dependendo da função que você usa(tableContinuous, tableNominal ou tableDate) e caso queira calcular apenas uma ou outra estatística basta passar na chamada da função uma lista em que cada nó possui o nome da função a ser aplicada ao subconjunto de dados. E a saída é como algo mostrado na imagem abaixo.

![](https://dadosaleatorios.files.wordpress.com/2014/01/cb497-reporttools.jpeg)

Como podemos ver, a saída é algo bem parecido com a saída do tables, exceto o fato de a sintaxe aqui ser algo muito mais simples de ser entendida e reproduzida. Simplesmente são passadas as variáveis que se deseja obter as estatísticas, os grupos pelos quais serão estratificadas aquelas variáveis e a função a ser aplicada em cada um destes extratos. Uma descrição melhor do pacote pode ser encontrada [aqui](http://cran.r-project.org/web/packages/reporttools/vignettes/reporttools.pdf).
**
**
Introduzimos aqui uma série de pacotes certamente irão auxiliar na exportação dos resultados R para seus documentos LaTex e dependendo da situação, utilizar um ou outro pode ser uma experiência mais satisfatória. Se você tem um modelo de regressão, por exemplo, e quer inserí-lo em seu documento LaTex, o pacote pode ser uma ótima opção, ainda que o xtable seja muito prático. E é claro, as opções não se limitam as descritas aqui.
