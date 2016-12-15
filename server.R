function(input, output, session) {

    indice <- reactive({
        as.integer(input$nota)
    })

    respuesta <- reactive({
        input$save_note
    })
    respuestas <- reactive({
        if(file.exists(answer.file)){
            respuestas <- read.csv(answer.file)
        }else{
            respuestas <- datos %>% select(id,ind)
            respuestas$respuesta <- -1
        }
        respuestas$respuesta[indice()] <- respuesta()
        respuestas
    })

    output$titulo <- renderText({
        datos$titulo[indice()]
    })
    output$fecha <- renderText({
        as.character(datos$fecha[indice()])
    })
    output$fuente <- renderText({
        datos$fuente[indice()]
    })
    output$texto <- renderText({
        datos$texto[indice()]
    })

    note_selector <- reactive({
        if(file.exists(answer.file)){
            respuestas <- read.csv(answer.file)
        }else{
            respuestas <- datos %>% select(ind)
            respuestas$respuesta <- -1
        }
        return(respuestas)
    })
    output$choose_note <- renderUI({
        
        ids <- note_selector() %>% filter(respuesta==-1) %>% select(ind)
        selectInput("nota", "Nota: ", ids)
    })

    observeEvent(
        input$goButton,{
            write.csv(respuestas(), file=answer.file, row.names=FALSE)
            session$reload()
        })
    output$tab1 <- renderDataTable(
        datatable({
            req(input$nota)
            datos %>%
                select(ind,titulo,fecha,fuente) %>%
                filter(ind<=indice()+1,ind>=indice()-1)

        },options = list(paging = FALSE, searching = FALSE))
    )
}
