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

* Instalar R

    sudo sh -c‘ echo “deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35 /” >> / etc / apt / sources.list`
    
    sudo apt-key adv - servidor de chaves keyserver.ubuntu.com - recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    
    sudo apt update
    
    sudo apt instala r-base r-base-dev
    

* Instalar o RStudio Server

    sudo apt instala gdebi-core
    
    sudo wget https: // download2.rstudio.org / rstudio-server-1.1.456-amd64.deb
    
    sudo gdebi rstudio-server-1.1.456-amd64.deb
    

* Adicionar um usuário do RStudio

    sudo adduser newuser

* Acessar o RStudio Server

Abrindo o RStudio em um navegador: Vá para

    http: // EXTERNAL-IP-ADDRESS:8787