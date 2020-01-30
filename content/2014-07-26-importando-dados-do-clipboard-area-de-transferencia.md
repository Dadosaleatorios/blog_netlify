---
title: Importando dados do clipboard (área de transferência)
author: dadosaleatorios
date: '2014-07-26'
categories:
  - Sem categoria
slug: ./2014-07-26-importando-dados-do-clipboard-area-de-transferencia
---

Hoje vamos com uma dica rápida e que pode ser útil em algumas situações onde estamos com pressa. Vamos imaginar que temos a seguinte planilha em algum formato qualquer, como por exemplo "xls".

Gênero   Porte      Salário
"F"           "P"       "5732.45"
"M"          "P"       "3327.05"
"M"          "M"       "2488.7"
"M"          "G"       "3182.89"
"F"           "G"       "4203.08"
"F"           "P"       "13576.38"
"M"          "M"       "6842.34"
"M"          "P"       "5380.48"
"F"           "G"       "6870.55"
"F"           "M"       "1547.23"
"F"           "G"       "5732.45"

Bom agora pense nas maneiras que você conhece para importar estes dados.

Nesse momento vamos mostrar uma maneira bem esperta de se fazer isto, vamos usar o comando **read.delim**.

Vamos copiar (Control + C) os dados da planilha e com o comando:

**read.delim("clipboard",dec=",",header=T)**

E assim já temos os dados no R para utilizar como desejar.
Espero que seja útil e até a próxima.
