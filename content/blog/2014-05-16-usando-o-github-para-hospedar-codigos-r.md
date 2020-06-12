---
title: Usando o github para hospedar códigos R
author: dadosaleatorios
date: '2014-05-16'
categories:
  - github
  - linguagem R
slug: ./2014-05-16-usando-o-github-para-hospedar-codigos-r
featured_image: 'images/blog/post-github.png'
---

Versionamento de arquivos é uma prática comum entre desenvolvedores de software, e a prática não é difícil de entender. Uma vez que existe uma equipe com muitas pessoas trabalhando em um mesmo projeto, necessita-se de algum tipo de sistema de gerenciamento de arquivos para checar as modificações de uma forma minimamente esperta, caso contrário seria uma verdadeira desordem duas pessoas trabalhem em cima de um mesmo arquivo.

Pode-se argumentar que não é necessária a utilização de uma ferramente de versionamento de arquivos uma vez que podemos utilizar o Dropbox, por exemplo. Porém na maioria dos casos esta prática não é nem um pouco recomendada, em especial pelo fato de não armazenar um histórico de versões/modificações e a impossibilidade de alterações simultâneas em um mesmo arquivo. Neste sentido surgem os denominados sistemas de versionamento de arquivos. E existem muitos deles, cada um com seus pontos positivos e negativo. Como algumas opções podemos citar o [CVS](http://savannah.nongnu.org/projects/cvs/), [SVN](http://subversion.apache.org/) e o [Git](http://git-scm.com/).

Git é um sistema de versão baseado na ideia de que em cada instante de tempo que você faz um contribuição, você tem um snapshot dos seus arquivos, e no próximo snapshot, você não terá arquivos novos, mas sim modificações dos arquivos já existentes. E isso faz com que a ferramenta seja extremamente eficiente, computacionalmente falando. Para usarmos o Git, precisamos de algum serviço de hospedagem, e neste caso, utilizaremos o [Github](https://github.com/). E o primeiro passo é criar uma conta, o segundo é [baixar alguma versão](http://git-scm.com/downloads) que satisfaça seu sistema operacional.

Conta criada e instalado o software Git, temos que criar um repositório que vai hospedar os arquivos do projeto, que no meu caso são códigos em R e arquivos txt. Então basta clicar em **[create repositories](https://github.com/repositories/new)** no Github que você será encaminhado a uma página onde terá que inserir um nome do repositório.

<table cellpadding="0" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" ><tbody ><tr >
<td style="text-align:center;" >

![](https://dadosaleatorios.files.wordpress.com/2014/05/d1c29-create_repo.png)

</td></tr><tr >
<td style="text-align:center;" class="tr-caption" >Criando um repositório Git
</td></tr></tbody></table>Basta clicar em _create repository_ e pronto, seu repositório está criado. Agora vamos navegar até a pasta onde desejamos inicializar o Git, isto é, o local onde encontram-se os arquivos que desejamos inserir no repositório e executar o seguinte comando - usuários _windows_ podem fazer isso com o programa _git bash_. Para acessar a pasta basta digitar _cd 'caminho da pasta'_.

    git init<br></br>git remote add origin https://github.com/djongs/topicmodelling_r.git

Apenas após feito isso, poderemos executar os comandos git nesta pasta - o primeiro comando - e enviar para o repositório criado no Github. É bom lembrar que isto é necessário ser feito apenas uma vez. Agora temos que adicionar os arquivos ao repositório. A imagem abaixo é uma screenshot da pasta em que estão os arquivos.

<table cellpadding="0" style="margin-left:auto;margin-right:auto;text-align:center;" cellspacing="0" class="tr-caption-container" ><tbody ><tr >
<td style="text-align:center;" >

![](https://dadosaleatorios.files.wordpress.com/2014/05/3bdbf-pasta.png)

</td></tr><tr >
<td style="text-align:center;" class="tr-caption" >Screenshot da minha pasta onde encontram-se os arquivos
</td></tr></tbody></table>

Agora vamos adicionar estes arquivos a fila de _commits_ que serão enviados ao Github. Fazer um _commit_ é enviar ao Git uma coleção de alterações que foram feitas no código.

    git add README.md<br></br>git add funcoes_uteis.R<br></br>git add script.R<br></br>git add textos/<br></br>git commit

Após executado o git commit, irá aparecer uma tela com os arquivos que você irá enviar para o Github, e você deve inserir também um comentário sobre aquele commit que você está fazendo. E quando leva-se em consideração desenvolvimento ao longo do tempo, esta ferramenta realmente mostra sua utilidade, já que é possível ver todas as mudanças e os respectivos comentários sobre ela. Agora basta enviarmos as modificações para o Github.

    git push

E pronto, com isso seu código estará disponível na página do seu projeto, e para modificações futuras, basta seguir o mesmo raciocínio. Se quiser clonar o repositório de alguém com todos os arquivos basta executar o seguinte comando.

    git clone https://github.com/djongs/topicmodelling_r.git

E um último detalhe importante é quanto a atualização. Quando trabalha-se em conjunto com outras pessoas em um mesmo repositório, é normal que seus códigos locais fiquem diferente dos códigos que estão no repositório, então é necessário sincronizá-lo com os arquivos do github. Para isso, basta executar a linha abaixo.

    git pull

Certamente o git é uma plataforma muito mais rica do que o que foi mencionado aqui, porém com estes poucos comandos básicos (git add, git commit, git pull, git push) é possível começar a utilizar a plataforma e ir aprendendo novas coisas gradualmente. Caso queira aprender de uma forma mais profunda, recomendaria dar uma olhada no [trygit](https://try.github.io/levels/1/challenges/1), que é uma plataforma de aprendizado interativa.
