---
title: Esquecendo o PDD e aprendendo a debugar
author: dadosaleatorios
date: '2014-02-10'
categories:
  - linguagem R
  - tutorial
slug: ./2014-02-10-esquecendo-o-pdd-e-aprendendo-a-debugar
---

Já faz algum tempo em que eu via as pessoas programaram em C++ com a utilização do Visual Studio, famosa IDE da Microsoft. Nesta época eu tinha a tarefa de transcrever algumas metodologias estatística em pseudo-código para que as mesmas fossem implementadas por algum desenvolvedor em C++. Até aí nada demais, mas volta e meia o código quebrava e lá começava-se o ciclo vicioso na procura de onde estava o erro - e um detalhe importante: o código era complexo, grande parte das ferramentas tinham sido implementadas - e pensando assim, achar onde estava o erro seria um verdadeiro pesadelo.

Porém o Visual Studio contava com uma ferramenta bem conhecida já por desenvolvedores, e pouco aproveitada pelos usuários um pouco menos hardcores, que é o modo debug. Lá funcionava da seguinte forma: O desenvolvedor escolhia alguns pontos onde ele desejava explorar o valor de variáveis locais e mandava o programa executar, então com isso ele seria possível executar linha a linha em tempo real explorando cada uma daquelas variáveis que estavam sendo criada ou alteradas. E isto era simplesmente fantástico !

Geralmente a tática utilizada pelos usuários menos experientes é o famoso PDD(Print Driven Development) que significa mais ou menos o seguinte: Se deu algum erro, imprime um monte de coisa. É provável que neste processo você se perca no meio de tanta informação impressa. E neste post vamos ensinar uma alternativa ao PDD. Antes de tudo, nada contra o PDD. Eu mesmo fui um forte usuário desta famosa técnica por muito tempo, antes de descobrir como debugar códigos, porém temos que confirmar que o trabalho de inserir vários _prints_ e depois removê-los é bem árduo. Então só o trabalho economizado ao não inserir/apagar estes _prints_ já vale a pena, na minha opinião. Para quem utiliza o Revolution R ou o RStudio, estes já possuem um modo de debug incluso na IDE, então é mais fácil ainda.

Mas afinal, o que significa debugar um código? Podemos dizer de forma grosseira que debugar um código é executá-lo e explorá-lo em tempo real. Então vamos a um exemplo simples.
Uma função que recebe um inteiro e um múltiplo, então retorna todos os números até aquele inteiro multiplicado pelo múltiplo.

    calcula_multiplos = function(tamanho, multiplo)<br></br>{<br></br>    vetor_multiplo = c()<br></br>    for(iesimo in seq(tamanho))<br></br>    {<br></br>        iesimo_multiplo = iesimo * multiplo<br></br>        vetor_multiplo = c(vetor_multiplo, iesimo_multiplo)<br></br>    } <br></br>    vetor_multiplo<br></br>}<br></br>

É uma função simples, que aproveitando as propriedades vetoriais do R, sequer precisaria de um for para isso. Mas a intenção é aqui é mostrar como funciona o debug mode. Para acessar a ferramenta, precisamos em primeiro caso, ativar a função como debug mode.

     debug(calcula_multiplos)<br></br>

Feito isso, sempre que a função for executada, o modo debug será ativado. Com isso, o modo browser será aberto e a função será executada linha a linha. Em cada passo, os seguintes comandos podem ser dados:

####

  * n : Avança para a próxima linha.
  * c : Avança para o próximo bloco. Em termos práticos significa avançar o loop ou seguir para a próxima função, caso tenha funções aninhadas.
  * cont : Mesma coisa que o c.
  * where : Indica em que ponto do código você está.
  * Q : sai do modo browser e volta ao prompt de comando do R.

Um detalhe interessante é que se você executar a função ls() de dentro do prompt, serão exibidos apenas os objetos que pertencem aquele ambiente, diferentemente do ls() normal, onde é exibido o ambiente global do R. Então para a nossa função anterior, aqui vai um exemplo de como seria o debug mode.

     calcula_multiplos(3, 7)<br></br>calcula_multiplos(3, 7)<br></br>debugging in: calcula_multiplos(3, 7)<br></br>debug at #2: {<br></br>    vetor_multiplo = c()<br></br>    for (iesimo in seq(tamanho)) {<br></br>        iesimo_multiplo = iesimo * multiplo<br></br>        vetor_multiplo = c(vetor_multiplo, iesimo_multiplo)<br></br>    }<br></br>    vetor_multiplo<br></br>}<br></br>Browse[2]> n<br></br>debug at #3: vetor_multiplo = c()<br></br>Browse[2]> n<br></br>debug at #4: for (iesimo in seq(tamanho)) {<br></br>    iesimo_multiplo = iesimo * multiplo<br></br>    vetor_multiplo = c(vetor_multiplo, iesimo_multiplo)<br></br>}<br></br>Browse[2]> n<br></br>debug at #4: iesimo<br></br>Browse[2]> n<br></br>debug at #6: iesimo_multiplo = iesimo * multiplo<br></br>Browse[2]> n<br></br>debug at #7: vetor_multiplo = c(vetor_multiplo, iesimo_multiplo)<br></br>Browse[2]> iesimo_multiplo<br></br>[1] 7<br></br>Browse[2]> where<br></br>where 1: calcula_multiplos(3, 7)<br></br><br></br>Browse[2]> <br></br>debug at #4: iesimo<br></br>Browse[2]> c<br></br>debug at #9: vetor_multiplo<br></br>Browse[2]> n<br></br>exiting from: calcula_multiplos(3, 7)<br></br>[1]  7 14 21<br></br><br></br>

Como podem ver, pouca coisa foi executada e explorada. Na verdade apenas em 2 momentos foi realmente utilizado, quando vi quem era o primeiro iesimo_multiplo e quando vi em que ponto da execução estava com o _where_. Logo depois sai do for e a chamada da função terminou. Feito isso, temos que sair do debug mode, caso contrário sempre que chamarmos a função, o debug mode será executado, e não queremos isso. Se utilizarmos a função _debugonce(calcula_multiplos), _a mesma será debugada apenas uma vez. Caso contrário temos que utilizar a função undebug(calcula_multiplos).

     undebug(calcula_multiplos)<br></br>

Com isso, sabemos tudo que precisamos para utilizar o debug mode e não mais o PDD, ainda que este seja realmente útil e provavelmente mais simples e intuitivo, porém quando se trata de funções maiores e aninhadas, pode ser um verdeiro pesadelo ficar inserindo e apagando prints, e com debugging você pode, de fato explorar o código, linha a linha para saber o que está acontecendo, uma vez que este é um processo interativo.
