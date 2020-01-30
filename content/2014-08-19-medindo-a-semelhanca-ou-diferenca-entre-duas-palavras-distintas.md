---
title: Medindo a semelhança (ou diferença) entre duas palavras distintas
author: dadosaleatorios
date: '2014-08-19'
categories:
  - python
slug: ./2014-08-19-medindo-a-semelhanca-ou-diferenca-entre-duas-palavras-distintas
---

Há quem diga que, caso existam opções de não se trabalhar com strings, deve-se optar por estas escolhas. Como problemas podemos citar falta de estruturas/padrões a serem seguidos, difícil manipulação, erros de tabulação e por aí vai. Sim, é uma lista grande. Porém existem alguns algoritmos que prometem acabar com algumas destas dificuldades (ou ao menos tornar o problema um pouco mais simples, pelo menos ao ponto de ser trabalhável) e hoje falaremos de um deles, que é o cálculo da [distância de edição ou distância de _Levenshtein_](http://en.wikipedia.org/wiki/Levenshtein_distance).

Uma aplicação imediata da solução proposta é aplicável ao problema de correção ortográfica. Imagine que você conheça todo o vocabulário de palavras possíveis a serem reportadas na sua aplicação - não é um pressuposto absurdo, uma vez que você pode estar trabalhando em um nicho específico, como por exemplo os nomes de todas as ruas de um determinado bairro ou o nome de todas as empresas cadastradas em algum tipo de sistema - então sua aplicação receberá uma palavra qualquer(_w)_ e irá procurar no vocabulário se esta palavra existe. Se não existir, basta calcular a distância de edição para cada uma das outras palavras e pronto, você terá a recomendação de uma possível palavra para aquela que inicialmente foi escrita errada. Para as aplicações que suportam respostas livres mas que não é possível contar com um vocabulário para consulta, pode-se pegar as palavras que aparecem com baixa frequência e tentar uma aproximação da mesma forma, pois espera-se que uma palavra escrita errada não aparecerá muitas vezes, ao menos não com a mesma grafia. Agora precisamos saber o que é exatamente a distância de edição e como podemos calculá-la.

Dado duas palavras (ou sentenças) _s1_ e _s2_, chamaremos de distância de edição o número mínimo de operações de edição que são necessárias fazer em uma destas palavras para que esta fique igual a outra palavra. As operações de edição permitidas são as seguintes:

1. Inserir um caractere;
2. Deletar um caractere;
3. Substituir um caractere por outro caractere;

Deve-se lembrar também que o custo de cada uma destas operações é 1. Na verdade esses custos relacionados costumam ser flexíveis, mas aqui vamos abordar apenas a situação onde as operações possuem o mesmo peso. Por exemplo, qual seria a distância de edição entre as palavras _s1=_LAGARTO e _s2=_LARGATO?

`L A R G A - T O
L A - G A R T O
`

Seria 2, pois para transformar s2 em s1, devemos tirar o primeiro _R_ (LAGATO) e em seguida adicionar um _R_ entre os caractere _A_ e _T_ (LAGARTO) e a solução para este problema é feito via [programação dinâmica](http://en.wikipedia.org/wiki/Dynamic_programming).

Para solucionar o problema, a ideia é quebrar o problema principal em subproblemas menores, e usar um [backtracking](http://en.wikipedia.org/wiki/Backtracking) para calcular a solução ótima. O algoritmo irá preencher uma matriz _m_ com dimensão igual ao tamanho de cada uma das duas strings e para cada célula de _m_, calcular o valor da célular _m[i,j]_, sendo _i_ os primeiros i-ésimos caracteres da primeira palavra e _j_ os j-ésimos caracteres da segunda palavra. Logo a distância da substring _s1_i_ e _s2_j_ é `_m[i,j]=_min(1+m[i-1, j], 1+m[i, j-1], m[i-1, j-1] + dij) `, onde dij é uma variável que assume valor 1 se _s1_i[i]_ é igual a _s2_j[j]_ e zero caso contrário. Apresentamos o algoritmo abaixo. É importante notar que o valor de _m[i,j]_ significa fazer uma daquelas três operações descritas acima. Logo abaixo, apresentamos o algoritmos - em python - que faz o cálculo da distância de edição entre duas strings.

    import numpy<br></br><br></br>def edit_distance(s1, s2):<br></br>    s1_len = len(s1)<br></br>    s2_len = len(s2)<br></br>    E = numpy.zeros(shape=(s1_len+1,s2_len+1))<br></br>    for i in range(s1_len):<br></br>        E[i, 0] = i<br></br>    for j in range(s2_len):<br></br>        E[0, j] = j<br></br>    for i in range(s1_len):<br></br>        i += 1<br></br>        for j in range(s2_len):<br></br>            j += 1<br></br>            diff_i_j = 0 if s1[i-1] == s2[j-1] else 1<br></br>            E[i, j] = numpy.min([1+E[i-1, j], 1+E[i, j-1], E[i-1, j-1] + diff_i_j])<br></br>    return E[s1_len, s2_len]<br></br>

Porém certamente nem tudo são flores, pois ainda que a distância de edição possa se mostrar útil para identificar e corrigir possíveis erros de digitação, dificilmente poderá ser implementada em um sistema de alta performance, uma vez que o custo computacional para o cálculo é razoavelmente alto. Nestes casos existem algumas alternativas, como por exemplo as _[wildcards queries](http://nlp.stanford.edu/IR-book/html/htmledition/wildcard-queries-1.html)_.
