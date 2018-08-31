#Pacotes
require(tidyverse)

#criando script que captura imagens dos post antigos

posts <- list.files("content/post/", pattern = "*.md")
i = 49
for(i in 18:52){

  texto <- readLines(paste0("content/post/", posts[i]), encoding = "utf-8")
  
  imagens <- grep("jpg|png", texto, value = T)
  
  # dir.create(paste0("static/img/", str_replace(posts[i], ".md", "")))

  if(length(imagens) > 0){
    for(j in seq_along(imagens)){
      
      urlname <- str_extract_all(imagens[j], "http(.*?)(jpg|png)")[[1]][1]
      
      figname <- paste0(str_replace(posts[i], ".md", ""), "-imagem-", str_pad(j, 2, pad = 0)) 
      
      download.file(urlname, destfile = paste0("static/img/", 
                                               str_replace(posts[i], ".md", ""), "/imagem-", 
                                               str_pad(j, 2, pad = 0), 
                                               if_else(
                                                 str_detect(imagens[2], ".jpg"), 
                                                 ".jpg", 
                                                 ".png")),
                    mode = 'wb')  
      
    }  
  }

}
