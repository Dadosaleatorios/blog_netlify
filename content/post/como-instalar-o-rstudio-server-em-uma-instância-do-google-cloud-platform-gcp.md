+++
author = "Bruno Lucian"
categories = ["Rstudio-server", "Rstudio", "GCP"]
date = "2019-07-31T03:00:00+00:00"
draft = true
post-image = ""
slug = ""
tags = []
title = "Como instalar o RStudio Server em uma instância do Google Cloud Platform (GCP)?"

+++
Já pensou em ter seu próprio servidor Rstudio para acessar de onde quiser?

Pois muito bem, vamos aprender agora como instalar o Rstudio Server para você chamar de meu!

Para começar vamos supor que você já tenha criado uma instância do GCP.

Se você precisar de ajuda para criar uma instância do GCP, verifique aqui.

Vamos supor que estamos usando o Ubuntu 18.04.

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