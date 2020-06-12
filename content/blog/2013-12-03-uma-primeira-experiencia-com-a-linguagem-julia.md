---
title: Uma primeira experiência com a linguagem Julia
author: dadosaleatorios
date: '2013-12-03'
categories:
  - linguagem julia
  - simulacao
slug: ./2013-12-03-uma-primeira-experiencia-com-a-linguagem-julia
featured_image: 'images/blog/post-julia.png'
---

Imaginem a seguinte situação: Existe um grilo no jardim e o mesmo pula de forma aleatória. Basicamente ele escolhe um ângulo e pula. Escolhe outro ângulo e pula mais uma vez. E assim segue, até o momento que ele cansa. Desejamos responder a pergunta sobre qual a localização do grilo após os muitos pulos dados por ele.

Uma das muitas opções de resolver este problema (e acredito que a mais simples) é simular os respectivos pulos do grilo muitas vezes e ver onde foi a posição final. Simples assim.

Inicialmente foi implementada uma solução escrita em R, menos de 20 linhas, e como era de esperar, o desempenho não foi um dos pontos fortes (demorou cerca de 30 minutos). Então veio a assombrosa pergunta que paira a cabeça de todos: Tem como fazer melhor? E é claro, a resposta é sim !

<table cellpadding="0" style="float:right;margin-left:1em;text-align:center;" cellspacing="0" class="tr-caption-container" ><tbody ><tr >
<td style="text-align:center;" >

<img src='/img/2013-12-03-uma-primeira-experiencia-com-a-linguagem-julia/imagem-01.png', alt = 'dispersao', width="600", height="400"/>


</td></tr><tr >
<td style="text-align:center;" class="tr-caption" ><b>Um exemplo do grilo dando 5 pulos.</br>
</td></tr></tbody></table>


Sobre a implementação em si não teria muito o que mudar, afinal o código já não tinha nenhum _for_ ou _while, _todas as operações ou eram vetoriais ou estavam sendo feitas com a utilização de funções de alta ordem (os famosos _applys_). Então tive a ideia de executar o código em paralelo, utilizando os muitos núcleos de um HPC (_High Performance Computer_) que tenho acesso. A adaptação foi relativamente simples, dado que o código já estava utilizando os _applys. _Tudo que tinha que ser feito era trocar o _lapply_ por um _mclapply (_que faz parte do pacote _multicore). _Adaptações feitas. No meu modesto computador utilizando 4 cores, o código passou a demorar 17 minutos ! Bela melhora, pensei. O próximo passo foi executar o código diretamente no _HPC, _afinal lá_ _teria acesso a 12 _cores_. O novo tempo? 5 minutos ! Surpreendente, pensei. Estava simulando 100.000 vezes o grilo pulando 1.000 vezes. Isto dá um total de 100 milhões de operações pelo menos. Então novamente veio a pergunta a cabeça: Dá para fazer melhor? Inicialmente pensei em implementar o problema utilizando Python, mas foi neste momento que lembrei da linguagem [Julia](http://julialang.org/), que era tão comentada por sua incrível performance em computação científica.

Acessei o site e comecei a ler a documentação. Não tinha muito o que fazer, ou aprender. Tinha um problema e tinha que resolvê-lo. Li o básico sobre criação e tipos de objetos e lá fui eu com a mão na massa. Após cerca de 3 horas, tinha terminado a implementação. Algo próximo de 40 linhas. Então chegou a hora da verdade. Executei esperando pelo menos os 5 minutos alcançados pelo R sendo executado em 12 cores. Me decepcionei, afinal demorou apenas 30 segundos !

Novamente veio a pergunta a cabeça: Dá para fazer melhor? Então comecei a implementação utilizando _Python_, apenas curiosidade. Após feito, lá estava o resultado: 200 segundos. Porém não parou por aí, afinal _Julia_ utiliza um compilador JIT (_just-in-time_) . Resolvi reescrever o código em _Python_ utilizando um JIT para _Python_ que é o [pypy](http://pypy.org/). Então aí que veio a surpresa: 10 segundos. Sem dúvidas este é um belo tempo, comparado aos 30 minutos iniciais.

Apesar de ter conseguido tempos de execuções razoavelmente bons, a grande pergunta ainda martela a minha cabeça: **Dá para fazer melhor?** Provavelmente sim, em especial utilizando o R. Nas próximas semanas vou ver como posso melhorar o código, talvez utilizar um compilador JIT também ajude. Claro que não espero bater os 10 segundos do pypy, mas se fizer em menor de 1 minuto vai ser uma boa performance. Sobre a linguagem Julia, que bela impressão que tive, afinal sem fazer muitos esforços ou otimizar o código consegui 30 segundos executando em single core.

Bom, e para quem ficou curioso sobre a posição final do grilo, aqui vai um heatmap com a posição (x,y) e a freqûencia.

<img src='/img/2013-12-03-uma-primeira-experiencia-com-a-linguagem-julia/imagem-02.png', alt = 'plot_cor', width="600", height="400"/>

Os códigos fontes nas diversas linguagens podem ser achados [aqui](https://github.com/djongs/Grasshopper-Jumps).

:)
