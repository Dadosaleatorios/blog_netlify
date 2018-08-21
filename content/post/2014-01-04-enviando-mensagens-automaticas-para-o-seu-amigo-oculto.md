---
title: Enviando mensagens automáticas para o seu amigo oculto
author: dadosaleatorios
date: '2014-01-04'
categories:
  - python
  - web crawler
slug: ./2014-01-04-enviando-mensagens-automaticas-para-o-seu-amigo-oculto
---

O mês de Dezembro passou, e como de costume aconteceram as tão esperadas festas. Comidas, bebidas, confraternizações e é claro, não poderia faltar a tão esperada brincadeira de amigo oculto. Comumente já é difícil decidir uma data que consiga agradar a todos, então reunir todos apenas para a realização do sorteio é praticamente impossível. Neste contexto surgiram algumas possibilidade para evitar este problema, que nada mais é que fazer a realização do sorteio em algum ambiente online, cada um dos participantes se cadastra em um site, que realiza o sorteio e envia os resultados por e-mail.

Simples assim.

Este ano o site escolhido para realizar tal façanha foi o [amigosecreto.com.br](http://www.amigosecreto.com.br/) . O site dispões de algumas ferramentas bem interessantes, como por exemplo a possibilidade de enviar mensagens de forma anônima. E entre essas possibilidades você pode enviar uma mensagem para quem te tirou, para quem você tirou ou simplesmente qualquer um do grupo. Feito o sorteio, lá estava o resultado. Tirei uma pessoa bem próxima de mim.

<table cellpadding="0" align="center" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" ><tbody ><tr >
<td style="text-align:center;" >

<img src='/img/2014-01-04-enviando-mensagens-automaticas-para-o-seu-amigo-oculto/imagem-01.png', alt = 'oi', width="600", height="200"/>

</td></tr><tr >
<td style="text-align:center;" class="tr-caption" ><br>Dando um 'oi' para meu amigo oculto.</br>
</td></tr></tbody></table>

Algum tempo se passou, veio a vontade de enviar uma mensagem anônima. Porém estava em desvantagem numérica. Dos 11 participantes, 5 pessoas moram juntas, dentre eles, meu amigo oculto. A primeira preocupação: Se mandar uma mensagem enquanto estiverem as 5 pessoas juntas, meu amigo oculto irá excluir 4 possibilidades. Some a isto a interseção do horário de envio das mensagens e pronto. Fui descoberto e acabou a graça da brincadeira.

...Porém nem tudo estava perdido. Após pensar na situação apocalíptica descrita acima, resolvi inovar na arte da enganação. Eu iria criar um bot capaz de enviar mensagens em horas pré-determinadas. Para isso teria que dominar algumas coisas, como por exemplo a permissão de acesso via cookie.

Para a criação do bot, foi utilizada a linguagem Python. O motivo: A grandiosa biblioteca [requests](http://docs.python-requests.org/en/latest/) e suas facilidades. O primeiro passo é fazer o login. Então vamos analisar o que acontece ao fazer o login no site. Se você usa o Google Chrome, basta apertar botão direito > Inspecionar Elemento. Se você usar o Firefox pode usar o plugin do [Firebug](https://addons.mozilla.org/pt-br/firefox/addon/firebug/) ou apenas apertar o botão direito > Inspecionar Elemento e de certa forma o processo é o mesmo utilizando ambas as plataformas. Feito isso, abra a aba Networks e marque a opção de preservar o log da navegação. Vá para a tela de login do [amigosecreto.com.br](http://www.amigosecreto.com.br/) e preencha suas informações de login, então sua aba Network será parecida com a minha, postada logo abaixo.

<img src='/img/2014-01-04-enviando-mensagens-automaticas-para-o-seu-amigo-oculto/imagem-02.png', alt = 'Network', width="900", height="250"/>

Então podemos ver algumas coisas aí. A primeira é que existe uma página /login.asp e lá dentro temos um Form Data com os campos 'origem', 'origem_string', 'destino', 'email' e 'senha'. As 3 primeiras informações são as mesmas para todos, as duas últimas serão as suas informações pessoais, que embora esteja em branco, na sua tela você estará vendo justamente suas informações de login.

```r
# amigo_secreto.py
import requests
EMAIL = 'meu_email'
SENHA = 'minha_senha'
URL_LOGIN = 'http://www.amigosecreto.com.br/login.asp'
amigo_secreto = requests.session()
dados = {'origem': '/00.asp', 'origem_string': '', 'destino': '',
'email': EMAIL, 'senha': SENHA}
amigo_secreto.post(URL_LOGIN, data=dados)

```

Nos campos EMAIL e SENHA você deve botar suas informações pessoais. /login.asp é a página responsável por fazer o login, e dados são as informações do formulário que devem ser preenchidas. Então finalmente é feito um POST que é o tipo de requisição feita ao servidor. Com isso o login no site estará feito. Agora o que precisamos é ver como enviar mensagens. Aqui não serão compartilhadas as fotos do próprio website, então caso queira entender melhor como as coisas funcionam, recomendaria acompanhar também pelo site o que acontece ao clicar em cada um dos butões.

Agora precisamos começar a coletar as informações de usuários/grupos. Após fazer login, a primeira coisa que fazemos é clicar em um dos grupos que estamos participando, então ao clicar no grupo, o seguinte formulário aparece.

<img src='/img/2014-01-04-enviando-mensagens-automaticas-para-o-seu-amigo-oculto/imagem-03.png', alt = 'formulario', width="800", height="200"/>

Então podemos ver que, ao clicar, acontece um redirecionamento (_http://www.amigosecreto.com.br/load-grupo.asp?grupo_cod=56694_) para uma página referente aquele grupo, no meu caso o código é 56694. Isso faz com que seja possível acessar as informações dentro do grupo desejado. No website é possível ver as mensagens enviadas para todos e também uma aba de nosso interesse, que é a aba de 'mensagens'. Mais uma vez, vamos ver o que acontece ao clicar nesta aba.

<img src='/img/2014-01-04-enviando-mensagens-automaticas-para-o-seu-amigo-oculto/imagem-04.png', alt = 'Network', width="800", height="200"/>

Assim como anteriormente, mais um redirecionamento. Porém desta vez para _http://www.amigosecreto.com.br/grupo-msg.asp . _Agora estamos quase chegando lá, afinal falta apenas ver onde é o local onde acontece o envio de mensagens para a pessoa desejada (no caso, a pessoa que eu tirei). Então clicando em "Quem eu tirei" iremos para a página alvo. Esta página de mensagens é muito importate, pois caso deseje enviar mensagens para outras pessoas, o ponto de partida é este.

<img src='/img/2014-01-04-enviando-mensagens-automaticas-para-o-seu-amigo-oculto/imagem-05.png', alt = 'mensagem', width="800", height="200"/>

Com isso, somos levados a página _http://www.amigosecreto.com.br/grupo-msg-quem-eu-tirei.asp_ . E enviando uma mensagem de teste pelo site, podemos ver claramente o que acontece de forma a conseguir reproduzir utilizando uma linguagem de programação.

<img src='/img/2014-01-04-enviando-mensagens-automaticas-para-o-seu-amigo-oculto/imagem-06.png', alt = 'Quem_tirei', width="800", height="200"/>

Estamos enviando um formulário com 3 campos ("quem_eu_tirei", "quem_me_tirou" e "amigo_mensagem_secreta") para _http://www.amigosecreto.com.br/grupo-msg-quem-eu-tirei.asp_ . Os 2 primeiros campos devem ser obrigatoriamente preenchidos com "quem_eu_tirei"=1 e "quem_me_tirou"=0, já em "amigo_mensagem_secreta" deve-se escrever a mensagem que se deseja enviar, que no exemplo acima foi "Duvido advinhar quem sou eu !". A seguir mostramos uma implementação em Python dos passos descritos anteriormente.

```r
# amigo_secreto.py<br></br>import requests<br></br><br></br>EMAIL = 'meu_email'<br></br>SENHA = 'minha_senha'<br></br>mensagem = 'Aqui vai sua mensagem'<br></br><br></br>URL_LOGIN = 'http://www.amigosecreto.com.br/login.asp' # Passo 1 - Login<br></br>URL_GRUPO = 'http://www.amigosecreto.com.br/load-grupo.asp?grupo_cod=56694' # Passo 2 - Acesso ao grupo<br></br>URL_GRUPO_MSG = 'http://www.amigosecreto.com.br/grupo-msg.asp' # Passo 3 - Mensagens do grupo<br></br>URL_GRUPO_MSG_QUEM_ME_TIROU = 'http://www.amigosecreto.com.br/grupo-msg-quem-eu-tirei.asp' # Passo 4 - Mensagem do meu amigo oculto<br></br>URL_ENVIA_MSG_QUEM_ME_TIROU = 'http://www.amigosecreto.com.br/grupo-msg-quem-grava.asp' # Passo 5 - Enviando a mensagem<br></br><br></br>sessao = requests.session()<br></br>dados = {'origem': '/00.asp', 'origem_string': '', 'destino': '',<br></br>                 'email': EMAIL, 'senha': SENHA}<br></br>sessao.post(URL_LOGIN, data=dados)<br></br>sessao.get(URL_GRUPO.format(id_grupo))<br></br>sessao.get(URL_GRUPO_MSG)<br></br>sessao.get(URL_GRUPO_MSG_QUEM_ME_TIROU)<br></br>dados_mensagem = {'quem_eu_tirei': '1', 'quem_me_tirou': '0',<br></br>                  'amigo_mensagem_secreta': mensagem}<br></br>sessao.post(URL_ENVIA_MSG_QUEM_ME_TIROU, data=dados_mensagem)<br></br><br></br>
```

Apesar de parecer ser uma tarefa complexa, os passos são bem intuitivos. Basta seguir o fluxo que você seguiria normalmente, caso estivesse no site, desde fazer o login até o momento de envio da mensagem.
