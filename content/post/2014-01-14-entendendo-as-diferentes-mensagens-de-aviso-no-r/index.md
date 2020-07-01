---
title: Entendendo as diferentes mensagens de aviso no R
author: dadosaleatorios
date: '2014-01-14'
categories:
  - linguagem R
slug: ./2014-01-14-entendendo-as-diferentes-mensagens-de-aviso-no-r
---

Comumente ao utilizar funções escritas por terceiros no ambiente R, algumas mensagens de aviso podem ser exibidas com o objetivo de alertar sobre algum acontecimento interno daquela função. Suponha que você tenha criado uma função que calcula o logaritmo de um número em uma determinada base. Caso o usuário passe algum número que seja menor que 0, algo de estranho tem de acontecer, afinal não existe o logaritmo de números negativos e estar atento a estas mensagens pode ser uma importante tarefa de alerta na utilização do R no dia a dia. Aqui vamos explorar essas mensagens tentando mostrar algumas dicas para tentar solucionar o problema de quando alguma mensagem for exibida. Os diferentes tipos de mensagem exibidos pelo R são: _message_. _warning_, _error_ e _condition_.

_message_: Este tipo de mensagem é uma notificação produzida pela função _message _e não é considerado nem um _warning _nem um _error._ Tem o objetivo de servir apenas como mensagens de diagnóstico e sendo assim, a execução da função continua normalmente.

_warning:_ Uma mensagem de notificação onde algo aconteceu de forma inesperada, porém não afetou a execução da função. Geralmente acontece pelo fato da função esperar uma coisa e receber outra coisa. Não é exatamente um problema, porém resultados inesperados podem acontecer. São gerados pela função _warning_.

_error: _O erro é uma mensagem que é exibida na ocorrência de um problema crítico. A execução da função é parada automaticamente e uma mensagem de erro é exibida. São gerados pela função _stop_.

_condition: _São mecanismos que permitem tratar condições não usuais. A criação de condições é feita pelo próprio usuário e tem o objetivo de lidar com as situações não esperadas que podem acontecer. São gerados pela função _TryCatch_.

Caso esteja tentando utilizar uma função - ou criando a sua própria - e ela estiver dando erros, algumas dicas podem ajudar a solucionar o problema. Um dos problemas mais comuns é chamar a função com argumentos que não são compatíveis com a função. Se você está utilizando uma função que recebe como argumentos uma lista e um número, então não adianta passar nada que não seja uma lista e um número que a função não será executada com sucesso, caso não tenha definido isto anteriormente. Outra dica é observar o resultado real e o esperado e refletir por quais razões eles foram diferentes. E por último é ver se você realmente é capaz de reproduzir o problema, pois algumas vezes a falha está justamente no real entendimento do problema.
