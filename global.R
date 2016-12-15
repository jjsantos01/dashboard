library(shiny)
library(dplyr)
library(jsonlite)
library(lubridate)
#library(DT)
json_file <- "OSC.json"
answer.file <- "OSC.csv"
json_data <- fromJSON(json_file)
datos <- json_data$notas %>%
    mutate(fecha=ymd(fecha)) %>%
    arrange(fecha)
datos$ind <- seq(1,dim(datos)[1])
