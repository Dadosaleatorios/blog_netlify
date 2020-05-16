---
title: Lendo arquivos OFX no R
author: dadosaleatorios
date: '2016-09-14'
categories:
  - Sem categoria
slug: ./2016-09-14-lendo-arquivos-ofx-no-r
---

Há um tempo atrás, a Nubank (se você não sabe o que é Nubank, deveria) postou em sua página que era possível exportar as faturas fechadas, para serem levadas a programas de organização financeira. Apesar de não usar nenhum programa do tipo, resolvi dar uma olhada no arquivo disponibilizado. Admito que esperava encontrar um arquivo amigável e de fácil manipulação no R, ou até mesmo no Excel. Mas o que encontrei foi um arquivo no formato OFX.

O formato OFX ([Open Financial Exchange](http://www.ofx.org/)) foi criado em 1997, visando criar um padrão de arquivos para troca de informações financeira, seja entre instituições, seja entre instituição e cliente. Pesquisando um pouco sobre o formato, descobri que ele é baseado em XML - ótimo, o R lê arquivos XML através de diversos pacotes. Mas infelizmente eles não funcionaram - não pesquisei muito sobre as diferenças entre OFX e XML, mas acredito que seja devido ao OFX permitir que tags não sejam fechadas, enquanto todas tags XML devem ser fechadas, entre outras diferenças. Procurando na internet encontrei [esse ODBC Driver](http://www.cdata.com/kb/tech/ofx-odbc-r.rst), que possibilita a leitura de arquivos OFX com o pacote RODBC. Por não ser gratuito, nem tentei utilizar e fui para o plano B: fazer meu próprio código.

A função parse_OFX() está disponível no meu [GitHub](https://github.com/rcoster/R/blob/master/parse_OFX.r) (junto tem também um [arquivo OFX de exemplo](https://github.com/rcoster/R/blob/master/Exemplo.ofx)), e seu uso é bastante simples: parse_OFX(readLines('C:/Exemplo.ofx')). Ela é toda baseada em expressões regulares (regex), que nos permite procurar por padrões de caracteres em strings. Segue a explicação dos principais padrões utilizados:

/**^**[^<]*******|**[^ >]*******$**/ - Para remover todos caracteres antes da primeira tag e depois da última.

  * 1a alternativa: ^[^<]*

    * ^ -  Indica que deve ser no início da string

    * [^<]* - casa qualquer caractere diferente (^) de <, em qualquer quantidade (*)

  * 2a alternativa: [^ >]*$

    * [^ >]* - casa qualquer caractere diferente (^) de >, em qualquer quantidade (*)

    * $ - Indica que deve ser no final da string

]*>: - Para localizar todas as tags

  * < - casa com o caractere <

  * [^/>]*- casa qualquer caractere diferente (^) de > e /, em qualquer quantidade

  * > - casa com o caractere >

.*? - Para localizar início e fim de tags (o %s e %1$s é substituído por uma tag através do sprintf(), no exemplo: .*?)

  * - casa com a string

  * .*? - casa com qualquer caractere, em qualquer quantidade (*), mas a menor possível (?)

  * - casa com a string

A explicação desses 3 padrões é suficiente para entender os demais padrões utilizados no comando. Outra explicação importante sobre exressão regular é o comando utilizado, que possuem diferentes funções:

  * gsub(): Permite realizar substituições de strings que se encaixam no padrão informado
  * grepl(): Indica se o padrão informado está presente na string
  * gregexpr(): Informa a posição que o padrão foi encontrado dentro da string, além do comprimento dele.
Após ler o arquivo OFX, ainda é possível transformar a fatura em um data.frame, para facilitar as análises e gráficos, através do comando:

`do.call(rbind, mapply(as.data.table, tail(dados$OFX$CREDITCARDMSGSRSV1$CCSTMTTRNRS$CCSTMTRS$BANKTRANLIST, -2), SIMPLIFY = FALSE)) `

 Único detalhe é que tudo é lido como string e, ao transformar em data.frame, eles viram fatores - incluindo os valores das operações!

A ideia desta postagem era mostrar um pouco mais sobre o quão poderosas são as funções do R de expressões regulares, e incentivar quem não utiliza a dar uma olhada nelas. Dúvida? Sugestões? Deixe seu comentário!
