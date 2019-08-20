+++
author = "Bruno Lucian e Leandro Oliveira"
categories = ["Rstudio-server", "Rstudio", "GCP"]
date = "2019-08-14T14:00:00+00:00"
image = "images/blog/r_gcp.png"
post-image = "/images/blog/r_gcp.png"
slug = ""
tags = []
title = "Como instalar o RStudio Server em uma instância do Google Cloud Platform (GCP)?"

+++
Já pensou em ter seu próprio servidor Rstudio para acessar de onde quiser?

Se sua resposta for **SIM**, vamos aprender agora como instalar o Rstudio Server para você chamar de seu!

Antes de começar, vamos supor que você já tenha criado uma conta na GCP (Google Cloud Platform) e tenha um projeto associado. Se ainda não tem uma conta ou projeto associado, temos esse [post aqui ](https://www.dadosaleatorios.com.br/post/como-criar-uma-conta-na-gcp/)explicando como fazer.

O próximo passo será criar uma instância na GCE (Google Compute Engine). Uma instância, significa uma máquina virtual dentro da arquitetura do Google Cloud Platform. Sim, você vai ter uma máquina dentro da infraestrutura da Google.

![](/images/blog/comemorar_hi5.gif)

Para criar uma instância, acesse seu projeto e no menu superior esquerdo, selecionar a opção “Compute Engine”, na guia “Compute”, como na figura abaixo.

![](/images/blog/compute_engine.jpeg)

Um novo menu surgirá, com itens específicos para máquinas virtuais. Na opção “VM Instances” (selecionada por padrão), clicar no botão “Create”.

![](/images/blog/create_engine.jpeg)

A primeira coisa a se fazer é selecionar o nome da sua instância. Lembre-se que deve ser um nome exclusivo (vai ser solicitado que você escolha outro nome, se o nome já existir).

Na sequência, devemos selecionar uma zona. A zona significa o local físico onde sua instância (ou máquina virtual) está localizada. Escolha uma zona de sua preferência.

Agora devemos escolher o tipo de máquina que vamos utilizar. No exemplo abaixo, estou selecionando o tipo básico de máquina, mas é possível escolher entre as opções pré-definidas de vCPU e memória ou customizar conforme sua necessidade.

![](/images/blog/Screenshot from 2019-08-14 00-09-13.png)  
Em Disco de Inicialização (Boot disk), é onde podemos alterar o sistema operacional e definir o tamanho do disco de inicialização. Existem várias distribuições de Linux. Basta clicar em Alterar (Change) e escolher a distribuição que mais te agrada. No tamanho do disco, por enquanto mantenha os 10 GB.

![](/images/blog/choose_ubuntu.jpeg)

É importante saber todas as alterações realizadas refletem no seu custo mensal daquela instância. Essas informações estão disponíveis no lado direito, conforme imagem.

![](/images/blog/Screenshot from 2019-08-14 00-11-28.png)

Você será cobrado pelo processamento do Compute Engine e custo de armazenamento em disco. No entanto, fique tranquilo, lembre-se que com o valor de crédito que você ganhou quando criou a conta (se você ganhou), vamos poder utilizar por bastante tempo, se adotarmos a boa prática de desligarmos a máquina quando não estivermos trabalhando e nos atentarmos para a subutilização da máquina.

Em Escopo de Acesso (Access scopes), selecione a opção “Allow full access to all Cloud APIs”. Essa opção garante acesso a todas as APIs disponíveis na GCP, ou seja, sem limitações de uso.

![](/images/blog/Screenshot from 2019-08-14 00-15-20.png)

Para finalizar, clique em Create. Após alguns segundos, você verá a tela abaixo. A lista mostra todas as instâncias de VM existentes com seus respectivos status e algumas informações como zona, IP interno e externo e opções para se conectar a ela.

![](/images/blog/allow_API.jpeg)

A penúltima opção da lista, é o botão de conexão. Repare que já existe um item pré-selecionado, SSH. Clique no botão que representa uma seta para baixo. Vai abrir um menu como a imagem abaixo.

![](/images/blog/ssh_enter.jpeg)

Você pode fazer o login via SSH selecionando a opção “Open in browser window”.

<img src="/images/blog/ssh_show_.png"  width="800px" />

Agora que já temos nossa máquina propriamente configurada vamos começar a instalar nosso servidor Rstudio :)

Vamos seguir os passos abaixo.

### Instalar R

    sudo apt-key adv - keyserver keyserver.ubuntu.com - recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    
    sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
    
    sudo apt update
    
    sudo apt-get install r-base

### Instalar o RStudio Server

Podemos verificar a versão mais atual no site do[ Rstudio](https://www.rstudio.com/products/rstudio/download-server/ "Rstudio-server")

    sudo apt-get install gdebi-core
    
    wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.2.1335-amd64.deb
    
    sudo gdebi rstudio-server-1.2.1335-amd64.deb

### Adicionar um usuário do RStudio

    sudo adduser newuser

### Acessar o RStudio Server

Para abrir o RStudio em um navegador: Vá para

    http://EXTERNAL-IP-ADDRESS:8787

Agora é só você desfrutar do seu novo servidor podendo acessar de qualquer lugar com acesso a internet e testar seus códigos.

Então galera por hoje é só, se ficou alguma dúvida comente ai que vamos tentar te ajudar.