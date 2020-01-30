---
title: Quanto é 0.1 + 0.2 ?
author: dadosaleatorios
date: '2014-08-28'
categories:
  - iniciantes
  - tecnologia
slug: ./2014-08-28-quanto-e-0-1-0-2
---

Antes de mais nada, acho que qualquer um irá concordar que ` 0.1 + 0.2 = 0.3`. Respondemos a essa pergunta trivialmente, sem pensar duas vezes. Bom, o R também responde a essa pergunta sem a menor das dúvidas.

    > 0.1 + 0.2<br></br>[1] .3

Sendo assim, se fizermos o teste lógico para ver se 0.1 + 0.2 é igual a 0.3, também já sabemos que será verdadeiro.

    > (0.1 + 0.2) == .3<br></br>[1] FALSE

Surpreendentemente, o teste dá falso. Isso significa então que o R possui um erro de operação tosco ao ponto de invalidar todos os resultados que eu puder gerar algum dia? Certamente não.

O que acontece aqui é que ao converter o número 0.1 para a base binária a representação deste número passa a ser uma dízima periódica (para ser mais exato 0.0001100110011001100110011001100110011001100110011...) então em algum ponto tem que acontecer um arredondamento. Na verdade outras linguagens são mais sinceras com este resultado. Vejamos o caso de Python, Julia e o próprio R, alterando o número de casas decimais.

    In [1]: .1 + .2<br></br>Out[1]: 0.30000000000000004<br></br>

    julia> .1 + .2<br></br>0.30000000000000004<br></br>

    > print(.1 + .2, digits=20)<br></br>[1] 0.30000000000000004441<br></br>

Comparado a outras linguagens, a diferença aqui fica por conta de que no R o resultado não é explicitamente exibido. Mas é claro que, apesar de não ser igual, a precisão é suficientemente boa.
