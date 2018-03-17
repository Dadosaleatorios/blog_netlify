---
title: Inserindo tabelas no LaTex de forma dinâmica
author: dadosaleatorios
date: '2013-12-17'
categories:
  - latex
  - linguagem R
slug: ./2013-12-17-inserindo-tabelas-no-latex-de-forma-dinamica
---

Para aqueles que já trabalharam com geração de números aleatórios, a situação a seguir pode ser rotineira: Você escreve um script e sempre que o executa gera outputs diferentes. Caso esteja usando uma semente para a geração destes número aleatórios talvez o problema não seja tão grave, mas se por algum motivo a aleatoriedade for importante então escrever resultados sobre isso pode ser um problema.

Imagine a seguinte situação: Você gera um bocado de números aleatórios, calcula uma série de estatísticas e escreve um belo texto sobre todas elas. Mas depois você percebe que podia ter feito algo a mais. Desta forma, lá se inicia o ciclo vicioso sem prazo para término. Caso exista algo a mais a ser feito então isso irá significar uma longa e torturante sessão, executando os mesmos códigos para inserir tabelas, gerar gráficos e etc. Mas aqui estamos nós para mostrar-lhe que existe uma opção de deixar o torturante trabalho mais agradável (e fácil).

A motivação deste post é deixar claro uma filosofia de vida a ser seguida. Perder tempo com coisas banais (como por exemplo ficar atualizando uma tabela de valores aleatórios) é perda de tempo e tem como ser evitada, afinal é muito mais interessante e produtivo perder tempo pensando em análises/conclusões sobre os resultados.  E para fazer isso, vamos utilizar o próprio tex e o R. O R será fundamental, pois ele será responsável por gerar as tabelas no formato tex. Obs.: O arquivo .tex e o .R devem estar na mesma pasta.

Então vamos lá. O primeiro passo é criar um arquivo .tex.

     % artigo.tex<br></br>\documentclass[paper=a4, fontsize=11pt]{article} % A4 paper and 11pt font size<br></br>\usepackage{amsfonts}<br></br>\usepackage{amssymb}<br></br>\usepackage{latexsym}        <br></br>\usepackage[utf8]{inputenc}<br></br>\usepackage[brazil]{babel}<br></br>\usepackage{amsmath,amsthm} % Math packages<br></br><br></br>\begin{document}<br></br>Um exemplo de documento.<br></br><br></br>\end{document}<br></br>

Após feito isso e compilar o artigo.tex, teremos um documento não tão bonito, mas funcional. Caso você, caro leitor, tenha um layout mais agradável, pode utilizá-lo sem peso na consciência. Feito isso, vamos ao R criar uma função que recebe um dataframe e gera um arquivo .tex com informações de uma tabela. O primeiro passo é instalar o pacote _xtable_. Para quem não conhece, o _xtable_ é capaz de transformar um dataframe do R em uma tabela tex. E tudo isso em um passe de mágica.

Então tudo que deve ser feito é pegar o dataframe com as estatísticas que você precisa calcular, imprimi-lo em um arquivo de texto, e anexá-lo ao tex. A função abaixo recebe um dataframe, o transforma em uma tabela e salva com um devido nome.

```r
# gera_tabela.R<br></br>imprime_tabela = function(dados, nome_arquivo)<br></br>{<br></br>    dataframe_tex = xtable::xtable(dados)<br></br>    sink(nome_arquivo)<br></br>    print(dataframe_tex)<br></br>    sink()<br></br>}<br></br><br></br>imprime_tabela(head(cars), 'teste.tex')<br></br><br></br>
```

Se chamarmos "_imprime_tabela(head(cars), 'teste.tex')_", será gerado, no seu diretório de trabalho um arquivo com o nome de _teste.tex_ e com as primeiras seis linhas do dataset cars. A geração deste arquivo, é feita utilizando a função _sink()_ que cria um arquivo e tudo que é impresso pelo R também é inserido naquele arquivo (no nosso caso, o arquivo teste.tex). Agora precisamos voltar ao arquivo principal do tex e inserir essa tabela lá de forma que não seja necessário ficar copiando e colando e sim fazer referência a um arquivo que contém a tabela desejada. Basta inserir no arquivo .tex principal o comando \input{nome_da_tabela}, que vai "anexar" as informações do arquivo no seu conteúdo principal. O novo código seria assim:

    % artigo.tex<br></br>\documentclass[paper=a4, fontsize=11pt]{article} % A4 paper and 11pt font size<br></br><br></br>\usepackage{amsfonts}<br></br>\usepackage{amssymb}<br></br>\usepackage{latexsym}        <br></br>\usepackage[utf8]{inputenc}<br></br>\usepackage[brazil]{babel}<br></br><br></br>\usepackage{amsmath,amsthm} % Math packages<br></br><br></br>\begin{document}<br></br>Um exemplo de documento.<br></br>\input{teste.tex}<br></br><br></br>\end{document}<br></br>

Agora não é mais necessário nos preocuparmos em copiar e colar a tabela toda vez no tex, basta modificar o arquivo teste.tex. Se rodarmos no R, por exemplo  "_imprime_tabela(tail(cars), 'teste.tex')_" e compilarmos o tex novamente, a tabela será atualizada automáticamente.

Isso é tudo que é preciso fazer para gerar conteúdo sem a preocupação de atualizar toda vez que fizer uma modificação. Basta pensar que é necessário apenas alterar o conjunto de dados no script R e executar novamente. Com isso, todas as tabelas serão atualizadas. No exemplo dado talvez isto não tenha sido perceptível, mas em projetos maiores pode ser um verdadeiro quebra galho. Em um futuro próximo, iremos ensinar como inserir dinâmicamente outputs do R, é claro seguindo a mesma lógica. É interessante explorar trambém as opções do _xtable_, como por exemplo a inserção de _\captions_, _\labels_ e etc.
