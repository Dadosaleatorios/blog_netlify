---
title: Identificando emoções em fotos
author: dadosaleatorios
date: '2017-01-22'
categories:
  - API
  - machine learning
slug: ./2017-01-22-identificando-emocoes-em-fotos
featured_image: 'images/blog/post-cognitivo.png'
---

Não é novidade para nós que trabalhamos com análise de dados que a área de Machine Learning (ou no bom português, [aprendizado de máquina](https://pt.wikipedia.org/wiki/Aprendizado_de_m%C3%A1quina)) está evoluindo rapidamente, mas o que muitos podem desconhecer é que este conhecimento está ao alcance de todos, e muitos de forma gratuita (mesmo que limitada). Nesta postagem vamos falar um pouco sobre o [Microsoft Cognitive Services](https://www.microsoft.com/cognitive-services/en-us/), mais especificamente sobre a [Emotion API](https://www.microsoft.com/cognitive-services/en-us/emotion-api), uma API que permite a análise de emoções em fotos e vídeos - mas vamos focar, por ora, só em fotos.

A Emotion API é bastante simples de ser utilizada, a apresenta apenas 3 opções de comandos:

  1. **Emotion Recognition**, para identificação de faces em fotos e análise da emoção delas (que usaremos nesta postagem);
  2. **Emotion Recognition in Video**, para identificação de faces em vídeos e análises das emoção delas;
  3. **Emotion Recognition with Face Rectangles**, para análise da emoção de faces informadas previamente.

Os comandos para análise em foto retornam o resultado no momento da solicitação (claro, com um pequeno delay) e o de vídeo retorna um link que deve ser consultado após, e que expira em 24 horas. No final da página de cada um dos comandos há exemplos de como utilizar a API em diversas linguagens de programação. Nesta postagem usaremos somente o R para interagir com a API, através do pacote [httr](https://cran.r-project.org/web/packages/httr/index.html). Para usar as API do MCS, você deve fazer uma conta gratuita e solicitar acesso as APIs desejadas - a quantidade de uso gratuito é limitada, mas para usuários comuns a quota gratuita é mais que suficiente (para a Emotion API, 30.000 solicitações/mês, sendo 20 por minuto). O segundo passo necessário é... escolher uma foto! Essa foto precisa estar hospedada em algum servidor da internet. No nosso exemplo, usaremos a foto do funeral do ministro do STF Teori Zavascki [desta matéria](http://g1.globo.com/politica/noticia/so-depois-que-houver-a-indicacao-do-relator-diz-temer-sobre-nomear-substituto-de-teori.ghtml) do G1.

<img src='/img/2017-01-22-identificando-emocoes-em-fotos/imagem-01.jpg', alt = 'foto_original', width="800", height="600"/>

Foto: REUTERS/Diego Vara TPX IMAGES OF THE DAY

Após requisitarmos acesso à API e hospedarmos a foto, a análise é bastante simples, como pode ser vista no comando abaixo.

`urlFoto <- 'https://goo.gl/dW5x1r'
apiUrl <- "https://westus.api.cognitive.microsoft.com/emotion/v1.0/recognize"
key <- '4605b13b949f4bc7ad5f3f43476408ab'
mybody <- list(url = urlFoto)
# Request data from Microsoft AI
faceEMO <- httr::POST(
  url = apiUrl,
  httr::content_type('application/json'),
  httr::add_headers(.headers = c('Ocp-Apim-Subscription-Key' = key)),
  body = mybody,
  encode = 'json'
)`

O objeto faceEMO é de classe 'response' - não vamos entrar em muitos detalhes sobre essa classe. Para obter o resultado da análise da API, podemos usar o comando content(faceEMO), que nos retornará uma lista com 12 elementos não nominados, sendo cada elemento uma lista de 2 elementos nominados faceRectangle e score - onde ele se localiza na foto e a pontuação de cada emoção. Isso significa que na foto em questão foram identificados 12 faces (o limite da API são 64 faces), sendo que para cada face é informado o retângulo onde ela se encontra e o score de cada emoção analisada (raiva, desprezo, desgosto, medo, felicidade, neutro, tristeza e surpresa). No caso, as faces identificadas foram:

<img src='/img/2017-01-22-identificando-emocoes-em-fotos/imagem-02.jpg', alt = 'faces_identificadas', width="800", height="600"/>

Foto: REUTERS/Diego Vara TPX IMAGES OF THE DAY - A ordem dos rotos é definida pela área do retângulo

Identificados os rostos, agora só falta identificar a emoção expressa por ele. Os scores informados estão padronizados no intervalo de 0 a 1, de maneira que a soma de todos é igual a 1. Na figura abaixo está a pontuação de cada uma das 8 emoções analisadas.

<img src='/img/2017-01-22-identificando-emocoes-em-fotos/imagem-03.jpg', alt = 'tabela_emocoes', width="800", height="600"/>

Nos 12 rostos identificados, a emoção que mais pontuou foi a de neutralidade, sendo que a segunda que mais pontuou variava entre raiva e tristeza na maioria dos casos. A seguir mais algumas fotos e a tabela da pontuação de cada emoção.

Foto 2: Refugiados

<img src='/img/2017-01-22-identificando-emocoes-em-fotos/imagem-04.jpg', alt = 'refugiados', width="800", height="600"/>

Retirado de: http://www.esquerda.net/artigo/refugiados-urgencia-da-solidariedade/44444

<img src='/img/2017-01-22-identificando-emocoes-em-fotos/imagem-05.jpg', alt = 'tabela_refugiados', width="800", height="600"/>

Foto 3: Premiação Copa do Mundo

<img src='/img/2017-01-22-identificando-emocoes-em-fotos/imagem-06.jpg', alt = 'alemanha_copa', width="800", height="600"/>

Retirado de: http://www.bbc.co.uk/sport/football/world-cup/2014

<img src='/img/2017-01-22-identificando-emocoes-em-fotos/imagem-07.jpg', alt = 'tabela_alemanha', width="800", height="600"/>

E aí, o que achou dessa API? Como podemos ver na última foto, ela ainda tem bastante a evoluir (pelo menos eu acredito que não tenha ninguém com raiva nessa foto, mas vai saber...). Os códigos utilizados na postagem estão no [GitHub](https://github.com/rcoster/blog/blob/master/Identificando%20emo%C3%A7%C3%B5es%20em%20fotos). Em breve estaremos postando como identificar emoções em vídeos com a mesma API. Dúvidas? Sugestões? Deixe seu comentário!
