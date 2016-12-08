library(shiny)
library(rjson)
json_file <- "E:/Dropbox/DataLab/Scripts/OSC/A19.json"
json_data <- fromJSON(file = json_file)
n_json<-length(json_data$notas)
json_data$notas[3][[1]]$titulo
function(input, output) {
  nf <- c()
  
  indice = reactive(strtoi(input$nota))
  output$titulo <-renderText(json_data$notas[indice()][[1]]$titulo)
  output$fecha <-renderText(json_data$notas[indice()][[1]]$fecha)
  output$fuente <-renderText(json_data$notas[indice()][[1]]$fuente)
  output$texto <-renderText(json_data$notas[indice()][[1]]$texto)
  
  observeEvent(input$sig,{
    output$titulo <-renderText(json_data$notas[indice()+1][[1]]$titulo)
    output$fecha <-renderText(json_data$notas[indice()+1][[1]]$fecha)
    output$fuente <-renderText(json_data$notas[indice()+1][[1]]$fuente)
    output$texto <-renderText(json_data$notas[indice()+1][[1]]$texto)
  })
  
  observeEvent(input$goButton,{
    nf<-c(nf, isolate(input$nota))
    output$nf<-renderText(paste(nf))
  })
}
