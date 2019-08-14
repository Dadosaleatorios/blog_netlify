+++
author = "Bruno Lucian"
categories = ["Rstudio-server", "Rstudio", "GCP"]
date = "2019-08-15T03:00:00+00:00"
draft = true
post-image = "images/blog/r_gcp.png"
slug = ""
tags = []
title = "Como instalar o RStudio Server em uma instância do Google Cloud Platform (GCP)?"

+++
Já pensou em ter seu próprio servidor Rstudio para acessar de onde quiser?

Pois bem, vamos aprender agora como instalar o Rstudio Server para você chamar de meu!

Para começar vamos supor que você já tenha criado uma conta do GCP. Se ainda não fez, temos esse [post aqui ](https://www.dadosaleatorios.com.br/post/como-criar-uma-conta-na-gcp/ "Como criar uma conta na GCP")explicando como fazer.

Você vai precisar criar uma instância do GCP. Uma instância ou **compute engine** nada mais é que uma maquina virtual dentro da arquitetura do google. Sim! Você vai ter uma máquina junto com o Google.

![](/images/blog/comemorar_hi5.gif)

Dentro do projeto que vocẽ criou (no post anterior, de como criar sua conta na GCP) vamos criar uma VM. Agora vamos precisar ir até a página do compute engine como na figura abaixo.

![](/images/blog/compute_engine.jpeg)

Clicar em "create"

![](/images/blog/create_engine.jpeg)

Nesta próxima etapa é preciso entrar com um nome exclusivo (vai ser solicitado que você escolha outro nome, se o nome já existir).  Então faça o seguinte:

1) Selecione o tipo de máquina e a zona que ela vai estar, ou seja o local fisico que eles vão disponibilizar seus discos. 

![](/images/blog/config_engine.jpeg)

2) Você pode alterar o sistema operacional clicando em "Change". O custo será mostrado na medida que você vai mudando as configurações. Você será cobrado pelo processamento e armazenamento em disco.

Podemos ficar tranquilo, pois, com valor de crédito que você ganhou quando criou a conta (se você ganhou),  vamos utilizar por bastante tempo se desligarmos a máquina quando não tivermos trabalhando e nos atentarmos para a subutilização da máquina.

![](/images/blog/choose_ubuntu.jpeg)

Clique em Selecionar e marque a opção "Allow full access to all Cloud

![](/images/blog/allow_API.jpeg)

![](/images/blog/ssh_enter.jpeg)

Você pode fazer o login em ssh selecionando “Open in browser window”.

<img src="/images/blog/ssh_show_.png"  width="800px" />

Agora que já temos nossa máquina propriamente configurada vamos começar a instalar nosso servidor Rstudio :)

Vamos seguir os passos abaixo.

### Instalar R

    sudo sh -c‘ echo “deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/” >> /etc/apt/sources.list`
    
    sudo apt-key adv - keyserver keyserver.ubuntu.com - recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    
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