---
title: 'Modelagem Preditiva: Aprendendo a partir dos dados'
author: dadosaleatorios
date: '2016-01-02'
categories:
  - data science
  - modelagem
slug: ./2016-01-02-modelagem-preditiva-aprendendo-a-partir-dos-dados
---

Em 2013 [foi publicada uma reportagem pela Forbes](http://example.com/) onde era afirmado que machine learning era a disciplina mais popular de Stanford com 760 alunos inscritos. E o motivo pelo qual esta disciplina se tornou popular é simples: porquê machine learning funciona bem no mundo real. Ainda que machine learning seja uma área bem ampla e com diversas aplicações, existe uma especialmente interessante: A modelagem preditiva.

Predição é um dos assuntos mais intrigantes e que despertam o interesse e curiosidade humana. Desde o início dos tempos desejamos fazer predições: a condição climática para saber se o dia será propício a caça, os oráculos prevendo o futuro e as datas em que acontecerá a cheia do Rio Nilo, são exemplos de que esta sempre acompanhou os seres humanos. E utilizando técnicas de modelagem preditiva, é possível estimar predições de forma eficiente.

Modelagem preditiva é uma subárea de estudo em machine learning que tem como objetivo a generalização de um sistema que seja capaz de gerar as melhores predições possíveis. Um sistema pode ser definido como qualquer coisa que recebe uma entrada e gera uma saída, por exemplo se a temperatura está alta (dados de entrada) a venda de sorvetes tende a aumentar (saída).

![](https://dadosaleatorios.files.wordpress.com/2016/01/c4276-machine_learning2b252812529.png)

Podemos definir aprendizado como um processo de estimação de um sistema utilizando um número limitado de observações. Podemos dividir este problema em 3 componentes:

  * Um conjunto de dados de entrada;
  * Um sistema que, dado uma entrada, retorna uma saída;
  * Learning Machine (máquina de aprendizado) que estima a relação entre a entrada e a saída do sistema.
Voltando ao caso do sorvete, posso não saber exatamente como é este sistema de temperatura -> venda de sorvete, mas se durante muito tempo forem coletadas amostras de temperatura e quantidade de sorvete vendido, pode-se obter uma estimativa de como é esta relação, sendo assim possível a realização da predição da venda de sorvetes dado a temperatura diária.

###### Mas então a máquina faz tudo e não é necessária nenhum tipo de intervenção humana?

Errado. Na verdade muitas das etapas envolvidas em um projeto de data science utilizando modelagem preditiva necessita de intervenção humana. Definição do problema, seleção de variáveis, forma de representação dos dados e conhecimentos sobre o negócio são exemplos de coisas a serem observadas. E não é nem necessário citar que caso os dados de entrada sejam escolhidos de forma incorreta então o método de aprendizado será comprometido.

Mas em contrapartida a partir do momento que o modelo está estimado e validado, o processo de predição é completamente automatizado. De forma genérica, os projetos envolvendo machine learning possuem 2 passos principais

**(1)** Aprendizado da relação entre os dados de entrada e a saída do sistema através de amostras.
**(2)** Utilização da dependência estimada em (1) para a realização de predição para futuros dados de entrada.

###### Ok, parece legal, mas como isso pode me ajudar?

Modelagem preditiva está presente em quase todos os lugares, embora nem sempre pareça óbvio. Segue aqui algumas aplicações presentes no dia a dia.
**
****Recomendação**
Sabe aquela estranha sensação de intimidade que você possui com serviços como Netflix em relação aos filmes sugeridos porquê você assistiu um outro filme? Tudo isso é graças a [algoritmos bem eficientes de modelagem](http://www.slideshare.net/xamat/kdd-2014-tutorial-the-recommender-problem-revisited) que aprendem a partir do seu comportamento e o de outros milhões de usuários.
**
****Predição de preço de aluguéis**
O [Airbnb possui uma ferramenta de machine learning](http://nerds.airbnb.com/aerosolve) que auxilia usuário do site que desejam disponibilizar alugueis de quartos. A ferramenta é capaz de estimar valores para a locação dos imóveis utilizando como dados de entrada diversos atributos, incluindo as fotos publicadas no anúncio.
**
****Detecção de spam e filtros de e-mail**
Detecção de spam é umas das aplicações mais antigas e clássicas de problema envolvendo machine learning. A ideia central é utilizar as palavras contidas no e-mail para classificar a mensagem como spam ou não. Uma [aplicação recente feita pelo Google](http://static.googleusercontent.com/media/research.google.com/en//pubs/archive/36955.pdf) é a categorização das mensagens em diferentes filtros (social, promoções, atualizações, ...).
**
****Detecção de fraude**
Ao solicitar crédito ou fazer alguma compra, um modelo de risco calcula a probabilidade de que, dado o perfil informado, a pessoa seja fraudadora ou inadimplente. Existem tecnologias que utilizam diversas fontes de dados, como comportamento de navegação, redes sociais e histórico de transações.
**
****OCR e reconhecimento de escrita**
OCR (optical character recognition - reconhecimento de caractere óptico) é uma tecnologia capaz de reconhecer caracteres a partir de imagens. Isto torna possível a digitalização de documentos e a solução de sistemas de captcha também.

Não há a menor dúvida de que, embora não seja novidade, machine learning é uma metodologia mais moderna e presente do que nunca, com diversas subáreas que possuem problemas e soluções próprias - como por exemplo seleção de atributos, clusterização e modelagem preditiva - que são capazes de atingir o estado da arte e por vezes performam melhores que julgadores humanos.
