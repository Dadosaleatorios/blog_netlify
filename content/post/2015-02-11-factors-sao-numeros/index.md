---
title: Factors são... Números?
author: dadosaleatorios
date: '2015-02-11'
categories:
  - Sem categoria
slug: ./2015-02-11-factors-sao-numeros
---

A utilização de objetos da classe _factor_ no R pode surpreender usuários novos, uma vez que a representação e manipulação destes sugere que são similares a manipulação de _strings_, porém muitas das vezes o usuário acaba tendo uma surpresa desagradável, assim como um comportamento não esperado de objetos deste tipo. Mas antes de tudo, vamos esclarecer uma coisa: _Factors_ **não são e nem devem ser vistos** como _strings_ e sim como objetos numéricos (para ser mais preciso, inteiros).

Antes de dissertarmos sobre a polêmica afirmação, vamos fazer uma revisão sobre os objetos da classe _factor_. _Factors_ são vetores que podem conter apenas valores pré-definidos e são utilizados para a representação de dados categóricos.

    f = factor(c('a', 'b', 'a', 'a', 'b'))<br></br>> f<br></br>[1] a b a a b<br></br>Levels: a b

Se tentarmos inserir um elemento que não seja 'a' ou 'b', uma mensagem de _warning_ será exibida, e o valor atribuído será _NA_.

    > f[6] <- 'c'<br></br>Mensagens de aviso perdidas:<br></br>In `[<-.factor`(`*tmp*`, 6, value = "c") :<br></br>  invalid factor level, NA generated<br></br>> f<br></br>[1] a    b    a    a    b    <br></br>Levels: a b<br></br>

Então podemos dizer que _factors_ podem ser muito úteis quando sabemos todos os valores que uma variável pode assumir, mesmo que nem todos estes valores sejam observados no conjunto de dados. Se agruparmos um vetor de _strings_ e um de _factors_, o resultado é diferente.

    > genero <- c('f', 'f', 'f')<br></br>> genero_fator <- factor(genero, levels=c('m', 'f'))<br></br>> table(genero)<br></br>genero<br></br>f <br></br>3 <br></br>> table(genero_fator)<br></br>genero_fator<br></br>m f <br></br>0 3

Mesmo que o gênero masculino não apareça, a classe _factor_ sabe que ele existe e na hora da construção da tabela ele é levado em consideração, diferente da classe _character_, que considera apenas o que é observado. _Factors_ são construídos em cima dos inteiros considerando dois atributos: _class_ como _factor_ e _levels_ como os valores que podem ser assumidos. Podemos inspecionar melhor o objeto genero_fator.

    > attributes(genero_fator)<br></br>$levels<br></br>[1] "m" "f"<br></br><br></br>$class<br></br>[1] "factor"<br></br><br></br>> str(genero_fator)<br></br> Factor w/ 2 levels "m","f": 2 2 2<br></br><br></br>> typeof(genero_fator)<br></br>[1] "integer"<br></br>

E com isso, se adicionarmos mais uma observação e vermos a estrutura do objeto, podemos ver sua real representação. Na verdade o que está por trás do genero_fator não é o vetor ['f', 'f', 'f'] e sim [2, 2, 2]. Se adicionarmos um elemento, poderemos ver este comportamento de forma mais clara.

    > genero_fator[4] <- 'm'<br></br>> str(genero_fator)<br></br> Factor w/ 2 levels "m","f": 2 2 2 1<br></br>

Outro problema recorrente com a utilização dos fatores é na leitura de arquivos de texto. A opção default do R é carregar cada variável codificada como texto na forma de _factors_, a ao manipular este conjunto de dados os desavisados podem encontrar algum tipo de problema. Para ler um dataset transformando as variáveis de texto em _characters_, basta adicionar _stringsAsFactors=FALSE_ como argumento da sua função de leitura. Sobre a importação destas variáveis como _factor_, pode acontecer também de valores faltantes (vulgo _NA_) estarem codificados de alguma forma especial, como por exemplo "-" ou ".". Então mesmo que a coluna tenha apenas números, será importada como factor. Inclusive se fizer as.numeric() você não terá problemas, só que esta transformação irá obedecer a ordem hierarquica dos fatos, não o número real.

Portanto, tenham muito cuidado ao manipular _factors_, pois embora pareçam com _characters_, na verdade eles são inteiros. Muitas das funções que podem ser utilizadas em _strings_ não funcionam para _factors_, e caso funcione, existe a chance de o objeto retornar um valor inesperado.
