---
title: É possível aumentar as chances na loteria?
author: dadosaleatorios
date: '2015-12-09'
categories:
  - Sem categoria
slug: ./2015-12-09-e-possivel-aumentar-as-chances-na-loteria
featured_image: 'images/blog/post-loteria.png'
---

Sempre que o final do ano se aproxima boa parte dos brasileiros começa a pensar em uma coisa: a mega da virada. E não é a toa que isso acontece: o prêmio do ano passado chegou a R$ 264 milhões - e foi dividido entre 4 apostas. E sempre que se fala em megasena vem a pergunta: será que tem como aumentar as chances de ganhar? Existem [diversos sites](http://dicas mega sena) que dão dicas de como aumentar as chances de ganhar. Mas será que essas dicas realmente funcionam?

Boa parte das 'dicas' são baseadas nos sorteios que aconteceram anteriormente. Isto é, elas se baseio nos princípios (falhos, como vamos mostrar mais adiante) de que os sorteios não são independentes entre si ou que as bolas não possuem a mesma probabilidade de serem sorteadas (ou ambos). Os mais bizarro é que alguns locais sugerem apostar nos números que mais saíram - como se eles tivessem uma probabilidade maior de serem sorteados novamente - e outros nos números que menos saíram - como se eles tivessem que sair agora, já que todos deveriam ser sorteados em quantidades iguais. Mas será que isso funcionaria? Do sorteio 1 (11/3/96) ao 1761 (14/11/2015), as 6 dezenas mais e menos sorteadas (e a quantidade de vezes sorteadas) foram:

  * Menos sorteadas:  26 (141), 22 (142), 55 (150), 21 (152), 39 (154) e 09 (155)
  * Mais sorteadas: 33 (196), 42 (196), 04 (197), 53 (201), 51 (202) e 05 (206)

Se alguém tivesse apostado nesses números desde o início da loteria, nunca  teria ganho nada. Nada mesmo, nem a quadra - os menos sorteadores acertaram 3 números 10 vezes, enquanto os mais sorteados 31. Essa diferença é facilmente explicada: afinal de contas, estou comparando **no passado** os números mais e menos sorteados **no passado**. Como disse anteriormente, esses palpites se baseiam em:

  1. **As bolas não possuem a mesma probabilidade de serem sorteadas**: Essa hipótese pode facilmente ser testada pelo teste Qui-Quadrado (H0: As bolas possuem mesma probabilidade de serem sorteadas; H1: Pelo menos 1 bola possui probabilidade diferente de ser sorteada que as demais). O [valor-p](https://pt.wikipedia.org/wiki/Valor-p) encontra foi 0,1174 e, portanto, não é possível rejeitar H0.
  2. **Os sorteios não são independentes entre si**: Essa hipótese é mais difícil de ser testada por não ter um teste específico para tal. A opção que eu utilizei foi verificar se a quantidade de sorteios entre 2 aparições do mesmo número seguia [distribuição geométrica](https://pt.wikipedia.org/wiki/Distribui%C3%A7%C3%A3o_geom%C3%A9trica) (H0: Os dados seguem distribuição geométrica com probabilidade de sucesso igual a 0,1; H1: Os dados não seguem distribuição geométrica com probabilidade de sucesso igual a 0,1). Novamente, não foi possível rejeitar a H0 (valor-p igual a 0,2432)

Os dois testes anteriores são suficiente para 'derrubarmos' praticamente todas as dicas dadas. Por diversão, vamos analisar outra dica absurda: a de não apostar em números igualmente espaçados. Quem nunca ouviu (ou até mesmo falou) 'nunca a aposta premiada vai ser 1, 2, 3, 4, 5 e 6' (com exceção do André, do filme [O homem que copiava](http://www.imdb.com/title/tt0367859/?ref_=fn_al_tt_1))? Nunca vimos um resultado desse tipo pois das 50.063.860 possíveis combinações, somente 325 combinações apresentam todos os números espaçados de maneira igual (1 em 1, 2 em 2, ..., 10 em 10). Isso significa que, em média, um resultado desses ocorre a cada 154.042 sorteios. Por sinal, sair dois números seguidos não é algo raro: 734 dos 1761 sorteios analisados tiveram pelo menos 2 números seguidos - alguns sorteios chegaram a ter 4 números seguidos (sorteios 186 e 509)!

Uma outra 'dica' parecida com a anterior é a de dividir a cartela em 4 quadrantes e espalhar os números apostados nos 4 quadrantes. Entretanto, quando se fala em probabilidades, é mais provável que o resultado 'caia' em somente 3 dos 4 do que em todos quadrantes, como mostrado na tabela abaixo:

<table cellpadding="0" cellspacing="0" style="margin-left:auto;margin-right:auto;text-align:left;width:478px;" border="1" > <tbody ><tr style="height:12.75pt;" >
<td width="145" style="height:12.75pt;width:109pt;" class="xl25" height="17" >
</td>
<td width="78" style="width:59pt;" class="xl24" >1 Quadrante
</td>
<td width="85" style="width:64pt;" class="xl24" >2 Quadrantes
</td>
<td width="85" style="width:64pt;" class="xl24" >3 Quadrantes
</td>
<td width="85" style="width:64pt;" class="xl24" >4 Quadrantes
</td> </tr><tr style="height:12.75pt;" >
<td style="height:12.75pt;" class="xl26" height="17" >Possíveis combinações
</td>
<td align="right" >20.020
</td>
<td align="right" >350.2590
</td>
<td align="right" >25.515.000
</td>
<td align="right" >21.026.250
</td> </tr><tr style="height:12.75pt;" >
<td style="height:12.75pt;" class="xl26" height="17" >Probabilidade
</td>
<td align="right" class="xl22" >0,04%
</td>
<td align="right" class="xl22" >7,00%
</td>
<td align="right" class="xl22" >50,96%
</td>
<td align="right" class="xl22" >42,00%
</td> </tr><tr style="height:12.75pt;" >
<td style="height:12.75pt;" class="xl26" height="17" >% Observado
</td>
<td align="right" class="xl23" >0,00%
</td>
<td align="right" class="xl22" >7,27%
</td>
<td align="right" class="xl22" >49,12%
</td>
<td align="right" class="xl22" >43,61%
</td> </tr></tbody></table>

O observado é bastante próximo à proporção esperada (ufa!)

Por fim, outra 'dica' para quem quer fazer mais do que uma aposta é fazer apostas em mais de 6 dezenas, ao invés de várias apostas de 6 dezenas. A Caixa permite apostar em até 15 dezenas em cada aposta, a um custo de R$ 17.517,50, preço equivalente a 5.005 jogos de 6 dezenas. Da onde saiu esse número? Simples: 5.005 é a [quantidade de jogos diferentes de 6 dezenas que é possível realizar com as 15 dezenas selecionadas](http://www.wolframalpha.com/input/?i=C%2815%2C+6%29). Portanto, apostar em mais do que 6 dezenas é simplesmente fazer vários jogos de 6 dezenas, mas de uma maneira mais pratica.

Cabe lembrar também que todo processo de sorteio passa por auditorias periódicas para averiguar se as esferas com as dezenas possuem as mesmas características - tamanho e peso - e que todos sorteios são realizados em locais públicos no chamado 'Caminhão da Sorte' e transmitidos pela  televisão , dificultando assim a manipulação dos resultados.

Qual a sua estratégia para jogar na megasena? Joga sempre nos mesmos números, troca a cada sorteio ou aposta sempre na escurinha? Ainda tem alguma dúvida sobre a megasena? Deixe seu comentário!
