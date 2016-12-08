library(shiny)
library(rjson)
json_file <- "E:/Dropbox/DataLab/Scripts/OSC/A19.json"
json_data <- fromJSON(file = json_file)
n_json<-length(json_data$notas)

fluidPage(
  # Application title
  titlePanel("Tablero noticias"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      selectInput("nota", "numero de la nota:", 
                  choices = seq(1,n_json)
                  ),
      actionButton("goButton", "Guardar"),
      actionButton("sig", "Siguiente")
      ), 
          # Show a summary of the dataset and an HTML table with the 
    # requested number of observations
    mainPanel(
      h1(htmlOutput("titulo")),
      textOutput("nf"),
      strong(htmlOutput("fecha")),
      strong(htmlOutput("fuente")),
      textOutput("boton"),
      textOutput("texto")
      )
    )
)
