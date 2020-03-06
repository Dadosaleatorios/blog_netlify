---
title: R também pode ser diversão!
author: dadosaleatorios
date: '2015-10-05'
categories:
  - Sem categoria
slug: ./2015-10-05-r-tambem-pode-ser-diversao
---

O R, assim como toda linguagem de programação, permite que seja feita uma grande gama de coisas, mesmo quando elas não possuem nada a ver com estatística. Dois exemplos disso podem ser encontrados no próprio site do R: os pacotes [fun](https://cran.r-project.org/web/packages/fun/index.html) e [sudoku](https://cran.r-project.org/web/packages/sudoku/index.html), que possuem algumas funções para passar o tempo, inclusive jogos. Sim, você leu certo: jogos no R.

Para passar o tempo livre que eu tinha na época de graduação (que meus professores não vejam isso...) e inspirado nos pacotes citados anteriormente, me desafiava a fazer alguns jogos no R também. Na época eu enviei eles para a lista de e-mails [R-br](http://r-br.2285057.n4.nabble.com/), e recentemente ressuscitaram o assunto, o que me motivou a divulga-los novamente. Ao total foram 6 jogos (ou 5, dependendo da definição de jogo), e todos estão disponibilizados no meu [Github](https://github.com/rcoster/Rfun) (falamos um pouco sobre o Github [nessa postagem](http://www.dadosaleatorios.com.br/2014/05/usando-o-github-para-hospedar-codigos-r.html)).

### Jogo da Velha

<table cellpadding="0" align="center" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" ><tbody ><tr >
<td style="text-align:center;" >

![](https://dadosaleatorios.files.wordpress.com/2015/10/fb719-jv.png)

</td></tr><tr >
<td style="text-align:center;" class="tr-caption" >Perdi :(
</td></tr></tbody></table>
Acredito que esse jogo não precisa de explicação, mas la vai: Após carregar o [código](https://goo.gl/CXEs3E), basta digitar jv() e clicae na casa em que você quer colocar a sua peça (X) que em seguida o computador irá fazer a sua jogada. O destaque desse jogo está para a IA, que eu considero uma boa jogadora.

### Campo Minado

<table cellpadding="0" align="center" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" ><tbody ><tr >
<td style="text-align:center;" >

![](https://dadosaleatorios.files.wordpress.com/2015/10/fc810-cm.png)

</td></tr><tr >
<td style="text-align:center;" class="tr-caption" >Clássico do Windows, agora no R!
</td></tr></tbody></table>Outro jogo que também não precisa de apresentação, ainda mais se você tinha acesso a um computador na década de 90, e sua funcionalidade é exatamente igual ao do Windows: após carregar o [código](https://goo.gl/eJRcEg), basta digitar cm() para abrir no default (mapa 15x15, com 20 minas). É possível alterar o tamanho do mapa e a quantidade de minas, conforme mostra nas primeiras linhas do código!

### Reversi

<table cellpadding="0" align="center" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" ><tbody ><tr >
<td style="text-align:center;" >

![](https://dadosaleatorios.files.wordpress.com/2015/10/24976-rev.png)

</td></tr><tr >
<td style="text-align:center;" class="tr-caption" >Levando uma surra da IA :(
</td></tr></tbody></table>Outro clássico do Windows, aqui  objetivo é terminar com mais quadrados da cor vermelha. Para jogar, você deve clicar em uma casa vazia ao lado de uma casa preenchida que coloque 1 ou mais peças da IA (azul) entre 2 vermelhas, e essas peças mudarão de cor. O [jogo](https://goo.gl/qnVh1K) tem 2 níveis de dificuldades (jogo(1) ou jogo(2), onde 2 é mais difícil)

### Jogo da Vida

Antes de tudo, calma: não é o jogo de tabuleiro. O jogo da Vida de Conway ([Wiki](https://pt.wikipedia.org/wiki/Jogo_da_vida)) é um jogo proposto por Conway (Não brinca!) em 1970 para a revista Scientific American. Seu objetivo é criar um cenário simples, mas que evolua o máximo de ciclos possível - ou seja: infinitamente. A ideia é bem simples: as células pretas são células vidas e as brancas são células mortas. Se uma célula vida possui menos de 2 ou mais de 3 vizinhos vivos, ela morre e se uma célula morta tiver 3 vizinhos, ela 'nasce' (nos demais casos, a célula não muda de status). Para jogar é bem fácil: após carregar o [jogo](https://goo.gl/iaS4Fd), basta digitar jv(x, y), onde x e y são o número de linhas e colunas do mapa. Caso queira iniciar numa posição aleatória, basta informar o terceiro parâmetro como FALSE.
**
****Bônus**: Procure por [Conways game of life no Google](https://goo.gl/TPzyK3)!

### 2014

<table cellpadding="0" align="center" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" ><tbody ><tr >
<td style="text-align:center;" >

![](https://dadosaleatorios.files.wordpress.com/2015/10/bd98e-2048.png)

</td></tr><tr >
<td style="text-align:center;" class="tr-caption" >Não conhece o 2048? Então veja o [original](https://gabrielecirulli.github.io/2048/)
</td></tr></tbody></table>

No auge da fama da versão original do 2048, resolvi fazer uma versão para R também (na época, eu ainda postava no meu [antigo blog](http://rcoster.blogspot.com.br/2014/03/2048-para-r.html)). O objetivo do jogo é bem simples: juntar peças de valores iguais até conseguir chegar em uma peça com 2048. O desafio? Você movimenta todas as peças ao mesmo tempo, e as peças de mesmo valor se juntam automaticamente. Por ter sido o último jogo que fiz, ele é bastante customizável, permitindo alterar o tamanho do mapa (parâmetro mapa, padrão c(4,4)), a base da potência utilizada (parâmetro base, padrão 2), o valor objetivo (parâmetro máximo, padrão 11 (2 ^ 11 = 2048)), as os blocos que surgiram aleatoriamente a cada movimento (parâmetro sorteio, padrão c(1, 2)) e as cores. Após carregar o [código](https://goo.gl/CGMfp9), basta digitar joga().

### Tanks

![](https://dadosaleatorios.files.wordpress.com/2015/10/ec6c1-tanks.png)

Por fim, o que me deu mais trabalho de todos (e que nunca ficou 100% :(): Tanks. Acredito que esse jogo também dispensa apresentação. Direcionais para o lado mudam a inclinação do canhão; direcional para cima/baixo alteram a força do tiro e espaço atira. Após carregar o [código](https://goo.gl/ge6ilt), basta digitar tank() para jogar.

### Considerações finais

Embora seja uma maneira bastante fora do usual, programar esses jogos me ajudou tanto a evoluir meus conhecimentos em algoritmos quanto - e principalmente - a dominar mais os comandos básicos de gráficos do R. E você, o que faz para treinar programação? Conhece mais algum jogo feito em R? Tem alguma sugestão de postagem? Deixe seu comentário!
