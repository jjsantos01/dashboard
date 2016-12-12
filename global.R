library(shiny)
library(dplyr)
library(jsonlite)
library(lubridate)
json_file <- "A19.json"
answer.file <- "archivo.csv"
json_data <- fromJSON(json_file)
datos <- json_data$notas %>%
    mutate(fecha=ymd(fecha)) %>%
    arrange(fecha)
datos$id <- seq(1,dim(datos)[1])
