####   SOFTONIC  #####
library("xml2")
library("rvest")
install.packages("dplyr")
library("dplyr")
  
  #leyendo pagina
  
  PaginaSoftonic <- read_html("https://en.softonic.com/windows")
  print(html_text(PaginaSoftonic))
  
  # Información body
  Categoria_productos <- html_nodes(PaginaSoftonic, css=".s-media__body")
  print(Categoria_productos)
  
  #Categorías
  Categoria_Apps <- html_nodes(PaginaSoftonic, css="h2")
  print(Categoria_Apps)
  Categoria_Apps <- html_text(Categoria_Apps)
  print(Categoria_Apps)
  
  # Aplicaciones
  Lista_Apps <- html_nodes(PaginaSoftonic, css="h3")
  print(Lista_Apps)
  Lista_Apps <- html_text(Lista_Apps)
  print(Lista_Apps )
  
  #Links categorias
  seccion_categoria <- html_nodes(PaginaSoftonic, css=".list-category-apps")
  Links_categoria <- html_nodes(seccion_categoria,css="a")
  print(Links_categoria)
  href_categoria <- html_attr(Links_categoria,"href")
  print(href_categoria)
  ##### quiero eliminar duplicados para que calce el length, pero no pude con distinct(href_categoria)

  #####SUBPAGINA 
  
  subpaginaSoftonic <- read_html("https://chrome.en.softonic.com/")
  print(subpaginaSoftonic)
  
  appSpecsLi <- html_nodes(subpaginaSoftonic, css=".app-specs__list > li")
  appSpecsLi <- html_text(appSpecsLi)
  print(paste(appSpecsLi))
  
  #extrayendo títulos
  appSpecsTitle <- html_nodes(subpaginaSoftonic, css=".app-specs__list > li")
  appSpecsTitle <- html_text(html_nodes(appSpecsTitle, css=".app-specs__title"))
  print(paste(appSpecsTitle))
  
  #extrayendo descripcion
  appSpecsDescription <- html_nodes(subpaginaSoftonic, css=".app-specs__list > li")
  appSpecsDescription <- html_text(html_nodes(appSpecsDescription, css=".app-specs__description"))
  print(paste(appSpecsDescription))
  #####la descripción es mas grande que el  titulo porque descarga varios idiomas como elementos
  
  
####Subpagina

##información detallada y ordenada de la aplicación
  
softonicProduct <- read_html("https://chrome.en.softonic.com/")

appSpectsLi <- html_nodes(softonicProduct, css=".app-specs__list > li")
print(appSpectsLi)

for (appSpectLi in appSpectsLi) {
  textTitle <- html_text(html_nodes(appSpectLi, css=".app-specs__title"))
  print(textTitle)
  if(textTitle[1] == "License"){
    textDetail <- html_text(html_nodes(appSpectLi, css=".app-specs__description"))
    print(paste("====>",textDetail))
  }else if (textTitle[1] == "Version"){
    textDetail <- html_text(html_nodes(appSpectLi, css=".app-specs__description"))
    print(paste("====>",textDetail))
  }else if (textTitle[1] == "Latest update"){
    textDetail <- html_text(html_nodes(appSpectLi, css=".app-specs__description"))
    print(paste("====>",textDetail))
  }else if (textTitle[1] == "Platform"){
    textDetail <- html_text(html_nodes(appSpectLi, css=".app-specs__description"))
    print(paste("====>",textDetail))
  }else if (textTitle[1] == "OS"){
    textDetail <- html_text(html_nodes(appSpectLi, css=".app-specs__description"))
    print(paste("====>",textDetail))
  }else if (textTitle[1] == "Language"){
    textDetail <- html_text(html_nodes(appSpectLi, css=".app-specs__description"))
    print(paste("====>",textDetail))
  }else if (textTitle[1] == "Downloads"){
    textDetail <- html_text(html_nodes(appSpectLi, css=".app-specs__description"))
    print(paste("====>",textDetail))
  }else if (textTitle[1] == "Developer"){
    textDetail <- html_text(html_nodes(appSpectLi, css=".app-specs__description"))
    print(paste("====>",textDetail))
  }
}



                    



