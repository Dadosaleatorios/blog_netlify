---
title: Google Vision API
author: dadosaleatorios
date: '2017-02-05'
categories:
  - API
  - machine learning
slug: ./2017-02-05-google-vision-api
---

Continuando as postagens relacionadas a _machine learning_, agora vamos falar sobre a identificação de objetos em fotos. Para tal, vamos utilizar uma API do [Google Cloud Plataform](https://cloud.google.com/): a [Cloud Vision API](https://cloud.google.com/vision/). Diferente do que acontece com o [Microsoft Cognitive Services](https://www.microsoft.com/cognitive-services/en-us/) (MCS), onde temos APIs diferentes para cada tipo de objetivo, o Google agrupou tudo em uma única API, permitindo detectar faces (mas não identifica-los), descrever imagens e até mesmo dizer o local onde a foto foi tirada. Na postagem, vamos dar uma visão geral das principais funcionalidades da API.

Assim como acontece no MCS, para utilizar a API é necessário realizar um cadastro e obter uma chave de identificação. O próprio Google fornece um tutorial de como obter essa chave, que você pode encontrar [nesse link](https://cloud.google.com/vision/docs/common/auth). Uma desvantagem é que para obter a chave é necessário informar um cartão de crédito, mas não se preocupem, pois o uso dessa API é [gratuito para pequenas quantidades de solicitações](https://cloud.google.com/vision/pricing). Uma das vantagens desta API é que a foto não precisa estar hospedada em nenhum servidor para ser analisada, podendo ser enviada junto com o comando, e outra é que todas análises são solicitadas pelo mesmo comando, tendo que especificar somente qual tipo análise você quer através do parâmetro _features_. As opções são:

**FACE_DETECTION**: Para detectar face

**LANDMARK_DETECTION**: Para identificar estruturas naturais ou arquitetônicas populares

**LOGO_DETECTION**: Para identificar logos

**LABEL_DETECTION**: Para descrever elementos/objetos

**TEXT_DETECTION**: Para leitura de texto ([OCR](https://pt.wikipedia.org/wiki/Reconhecimento_%C3%B3tico_de_caracteres))

**SAFE_SEARCH_DETECTION**: Para avaliar o conteúdo da foto (adulto, editado, medicinal e violência)

**IMAGE_PROPERTIES**: Propriedades da imagem (como cor dominante)

Como exemplo nesta postagem, utilizarei fotos tiradas por mim para garantir que são fotos desconhecidas para o Google. Utilizar a API com o R é bastante simples, e pode ser feito através do comando POST do pacote httr:

```
key <- "AIzayDbS4EcWFtyEILqcMZ0azY8WZlq7Bo" # Chave de acesso da API
library(httr) # Carrega o pacote httr

resultado <- httr::POST(url = sprintf("https://vision.googleapis.com/v1/images:annotate?key=%s", key),
  httr::content_type('text/csv'),
  body = list(requests = list(
   image = list(content = [imageToText](https://github.com/cloudyr/RoogleVision/blob/master/R/googleVision-LIB.R)('Foto Hamburger.jpg')),
   features = list(type = 'LABEL_DETECTION'))),
  encode = 'json')
```

O resultado da análise pode ser obtido através do comando content(resultado). Dependendo da análise solicitada, o resultado apresenta um score, que varia de 0 a 1 e que quanto mais próximo de 1, mais 'certeza' tem a API do resultado. Abaixo estão alguns exemplos das possibilidade de análises:

#### **LABEL_DETECTION**

<img src='/img/vision-api/0824c-foto2bhamburger.png', alt = 'hamburguer', width="100", height="200"/>
![](/img/vision-api/0824c-foto2bhamburger.png =90x30)

![](https://dadosaleatorios.files.wordpress.com/2017/02/c0923-hamburger2b-2btabela.png)

![](/img/vision-api/b35e5-borboleta.png)

![](https://dadosaleatorios.files.wordpress.com/2017/02/fbe71-borboleta2b-2btabela.png)

#### **LANDMARK_DETECTION**


![](/img/vision-api/e7bd1-serra.png)

![](https://dadosaleatorios.files.wordpress.com/2017/02/c0f7c-serra2b-2btabela.png)

![](/img/vision-api/79292-igreja.png)

![](https://dadosaleatorios.files.wordpress.com/2017/02/cafe6-igreja2b-2btabela.png)

#### **TEXT_DETECTION**


![](/img/vision-api/37291-carros.png)

![](https://dadosaleatorios.files.wordpress.com/2017/02/bc0dd-carros2b-2btabela.png)

![](/img/vision-api/3d8b9-cerveja.png)


![](https://dadosaleatorios.files.wordpress.com/2017/02/578ac-cerveja2b-2btabela.png)

**Além dos dados mostrados, a API também retorna as mesmas informações palavra por palavra.**


## **Conclusões**

De modo geral, o resultado obtido foi satisfatório - a API conseguiu descrever bem as duas primeiras fotos e acertou o local das duas seguintes. O OCR deixou a desejar, principalmente na segunda foto testada. Os códigos utilizados podem ser encontrados no meu [Github](https://github.com/rcoster/blog). Dúvidas? Sugestões? Deixe seu comentário!

