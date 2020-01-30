---
title: Interagindo com o usuário no R
author: dadosaleatorios
date: '2014-05-30'
categories:
  - Sem categoria
slug: ./2014-05-30-interagindo-com-o-usuario-no-r
---

A interação com o usuário é fundamental em diversos processos, e pode ocorrer de muitas maneiras: desde uma simples janela de Continuar/Parar até a seleção de diversos valores em uma lista. Nessa postagem vou mostrar algumas das principais possibilidades de interagir com os usuários.

### menu

A função menu é a mais simples das funções que irei apresentar por trabalhar no console do R e não por janelas (com os parâmetros padrões). Ela pode ser utilizada quando queremos que o usuário escolha uma entre diversas opções como, por exemplo, temos varias funções de análises e queremos centralizar tudo em um só comando (assim não precisamos memorizar mais de uma função). O valor retornado é a posição da opção desejada.

menu(c('Relatório de vendas - Loja', 'Relatório de vendas - Vendedor', 'Relatório de vendas - Produto'))

Há ainda mais dois parâmetros: title, para colocar um título antes de listar as opções e graphics, quando se deseja utilizar uma janela ao invés do console.

menu(c('Relatório de vendas - Loja', 'Relatório de vendas - Vendedor', 'Relatório de vendas - Produto'), title = 'Selecione o relatório desejado')

menu(c('Relatório de vendas - Loja', 'Relatório de vendas - Vendedor', 'Relatório de vendas - Produto'), title = 'Selecione o relatório desejado', graphics = TRUE)

### select.list

A função select.list tem utilidade bastante parecida com a menu, mas com alguns diferenciais como permitir a seleção de mais de uma opção e deixar uma seleção pré-selecionada. Ela pode, portanto, ser utilizada quando queremos selecionar critérios de seleção de variáveis.

```r
select.list(c('João', 'Pedro', 'Maria', 'Carlos'))
```

O parâmetro title funciona da mesma maneira que na função menu. Para permitir a seleção de múltiplos valores e deixar valores pré-selecionados, devemos informar o parâmetro multiple e preselect, respectivamente.

```r
select.list(c('João', 'Pedro', 'Maria', 'Carlos'), title = 'Selecione o vendedor')

select.list(c('João', 'Pedro', 'Maria', 'Carlos'), title = 'Selecione o(s) vendedor(s)', multiple = TRUE)

select.list(c('João', 'Pedro', 'Maria', 'Carlos'), title = 'Selecione o(s) vendedor(s)', preselect = c('João', 'Carlos'), multiple = TRUE)
```

Assim como podemos usar janelas com a função menu, podemos usar o console com a função select.list através do parâmetro graphics.

select.list(c('João', 'Pedro', 'Maria', 'Carlos'), title = 'Selecione o(s) vendedor(s)', multiple = TRUE, graphics = FALSE)

Embora bastante parecidas, as duas funções possuem output diferentes. Enquanto a menu retorna a posição do valor selecionado (e 0 para nenhuma); select.list retorna um vetor com os valores escolhidos (e um vetor de tamanho 0 quando nenhuma).

### file.choose, choose.files, choose.dir

Como o próprio nome diz, essas funções permitem, respectivamente: a seleção de 1 arquivo, a seleção de multiplos arquivos e a seleção de um diretório. O parâmetro default permite informar a pasta pré-selecionada na função choose.dir e o arquivo pré-selecionado na função choose.files (permite wildcard). Essas 2 funções também permitem escolher o título da janela através do parâmetro caption.

### Janela de Sim/Não, Sim/Não/Cancelar e Ok

Para fazer janelas com botões precisamos utilizar o pacote "tcltk". O comando utilizado sera tkmessageBox() e o parâmetro para definir o tipo de janela (quais botões) é o type.

tkmessageBox(title = 'Exemplo tcltk', message = 'Operação concluída!', type = 'ok')
tkmessageBox(title = 'Exemplo tcltk', message = 'Você deseja salvar o resultado?', type = 'yesno')
tkmessageBox(title = 'Exemplo tcltk', message = 'Você deseja acompanhar o processo através de uma progressbar?', type = 'yesnocancel')

Note que o resultado (o valor do botão selecionado) vem precedido por . Isso é devido à classe do objeto (tclObj). Para chamar o valor do botão, devemos utilizar a função tclvalue:

tclvalue(tkmessageBox(title = 'Exemplo tcltk', message = 'Operação concluída!', type = 'ok'))

O pacote tcltk, junto com o tcltk2, permitem fazer janelas 100% customizadas, e não se resumem a apenas janelas de avisos. Vale a pena dar uma conferida nesse [site](http://www.sciviews.org/_rgui/tcltk/Sliders.html) para ver as possibilidades permitidas pelos pacotes!
