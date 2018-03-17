---
title: Alterando a escala dos eixos no ggplot2
author: dadosaleatorios
date: '2014-10-08'
categories:
  - linguagem R
slug: ./2014-10-08-alterando-a-escala-dos-eixos-no-ggplot2
---

Muitas vezes precisamos mexer na escala de um gráfico - seja para mais ou para menos. No pacote base é bastante fácil fazer isso, as principais funções gráficas possuem os parâmetros **xlim** e **ylim** para informarmos os limites dos eixos. O pacote [ggplot2](http://ggplot2.org/) até apresenta as funções [xlim e ylim](http://docs.ggplot2.org/current/xylim.html), mas elas não funcionam exatamente igual aos parâmetros do pacote base. A diferença está que, além de alterar os limites do gráfico, ele descarta todos os dados que estão fora desse intervalo.

Em gráficos simples (como um gráfico de dispersão), isso não é nenhum problema, mas nos mais complexos eles já começam a aparecer. Por exemplo, ao mudar a escala de um boxplot para retirar os outliers da área do gráfico utilizando o ylim, todas as estatísticas (1°, 2° e 3° quartis) serão recalculadas somente com os valores dentro do intervalo, podendo assim alterar (mesmo que pouco) o gráfico. Outro exemplo é nos modelos de regressão, que será estimado utilizando somente os dados no intervalo informado.

Para solucionar esse problema devemos utilizar a função [coord_cartesian](http://docs.ggplot2.org/current/coord_cartesian.html) e os parâmetros xlim e ylim, que funcionam da mesma maneira que os do pacote base, como podemos ver nos gráficos abaixo.

![](https://dadosaleatorios.files.wordpress.com/2014/10/6ab4c-201410082b-2bgraficos.png)
