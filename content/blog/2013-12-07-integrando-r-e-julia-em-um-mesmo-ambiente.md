---
title: Integrando R e Julia em um mesmo ambiente
author: dadosaleatorios
date: '2013-12-07'
categories:
  - linguagem julia
slug: ./2013-12-07-integrando-r-e-julia-em-um-mesmo-ambiente
image: 'images/blog/post-julia.png'
---

Já faz algum tempo que muito se fala sobre a performance da linguagem Julia. Volta e meia são apresentados benchmarks de algoritmos implementados em Julia e, comparados a outras linguagens, apresenta uma performace bem superior, sendo até mesmo comparado as compilações feitas em C. Em contrapartida, pobre R, sempre sendo associado a baixa performance e alto consumo de memória, entretanto é uma das linguagens mais simples de se aprender com grande facilidade de manipulação das estruturas de dados presentes. Será que não seria possível unir as duas linguagens (alta performace de Julia e facilidade de manipulação do R) em um mesmo ambiente?

A resposta é sim. Na verdade a forma que será apresentada é bem razoável de ser pensada. Basta escrever um código .jl e chamá-lo no terminal passando os argumentos necessários para a chamada daquela função. E temos que fazer isso diretamente do R.

Antes de tudo, vamos dar um bom motivo para fazer isso. Queremos uma função que calcule o valor da série de Fibonacci de um número.

A seguir, os códigos escritos em R e em Julia.

```r
# fibonacci.R
fib = function(n){
  ifelse(n < 2, n, fib(n - 1) + fib(n - 2))
}

# fibonacci.jl
fib(n) = n < 2 ? n : fib(n - 1) + fib(n - 2) 
```

Logo após calcular o Fibonacci de 30 em cada um das linguagens começamos a entender o real propósito de tudo. A chamada da função em R leva cerca de 1 minuto e 40 segundos enquanto que em Julia apenas 10 segundos, logo seria algo próximo de 10 vezes mais rápido. Sabemos que existem formas mais eficientes de calcular o Fibonacci de um número, mas este não é o propósito aqui, queremos apenas testar o desempenho das duas linguagens com um mesmo código.

Então para rodar o código Julia em R como teríamos de fazer? Basicamente temos que rodar o código Julia no R e uma opção para isso é usar a função **system** que nada mais faz do que executar a uma string que é passada como parâmetro, então se por exemplo passamos como argumento a string "julia fibonacci.jl" o R iria executar o script fibonacci.jl. Porém queremos mais que isso, desejamos não apenas executar o script, mas também passar o parâmetro de qual o valor da série de Fibonacci desejamos calcular.

O primeiro passo é instalar o pacote ArgParse no ambiente Julia. Para isso basta executar no ambiente o seguinte comando: Pkg.add("ArgParse"). Com isso o pacote será baixado e instalado. O segundo passo é criar um arquivo "executa_fibonacci.jl" que será responsável por ler os argumentos no terminal e chamar o script "fibonacci.jl". A seguir apresentamos o código.

```r
# executa_fibonacci.jl
using ArgParse
require("fibonacci.jl")

s = ArgParseSettings()
@add_arg_table s begin
"--n"
help = "valor do serie de fibonacci que queremos calcular"
required = true
end

pargs = parse_args(ARGS, s) 

println(fib(float(pargs["n"])))
```

Na primeira linha estamos carregando o pacote ArgParse, aquele que acabamos de instalar. Aqui temos duas tarefas principais: Uma é criar o ArgParseSettings que nada mais é um objeto que contém todas as configurações a serem utilizadas e a outra é preenchê-la com argumentos permitidos. No nosso exemplo estou dizendo que existe apenas a variável _n _e que obrigatoriamente tem que ser preenchida. A seguir, utilizamos a função parse_args, que é o carro-chefe do pacote. O que ela faz é receber um vetor de argumentos e um objeto ArgParseSettings e parseia os argumentos passado via terminal de acordo com aquela configuração forncecida. A saída é um dicionário com as chaves iguais aos nomes dos argumentos e valores iguais ao que é passado no terminal. Após feito isso, podemos chamar nosso script passando o argumento de qual número queremos, como por exemplo: julia executa_fibonacci.jl --n 30 , que no caso irá calcular o Fibonacci de n=30.

Agora precisamos fazer uma função no R que vai chamar a função _executa_fibonacci.jl ._

```r
# executa_fibonacci.R

fib = function(n){
  comando = sprintf("julia executa_fibonacci.jl --n %s", n)
  saida = system(comando, intern=T)
  return(as.numeric(saida))
}
```

Para que funcione, basta que seja possível "gerar comandos para serem executados no terminal" de forma dinâmica. Basta concatenar _julia executa_fibonacci.jl --n_ com um número qualquer, e é isso que o sprintf faz. A seguir o system executa este comando e o argumento _intern=T _faz com que o output seja retornado como string.

Após testar esta função, podemos perceber que o tempo de execução cai bastante, passando para apenas 20 segundos, o que é uma grande vantagem, uma vez que o código em Julia não tem nada de esperto e caso fosse uma grande simulação esta diferença de tempo poderia ser facilmente contornada com uma simples implementação.

**Obs.:** Parece que Julia tem um problema de slowdown ao ser executado, e é isto que faz o código demorar mais que deveria.
