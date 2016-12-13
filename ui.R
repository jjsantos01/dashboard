fluidPage(
                                        # Application title
    titlePanel("Tablero noticias"),
    
                                        # Sidebar with controls to select a dataset and specify the
                                        # number of observations to view
    sidebarLayout(
        sidebarPanel(
            uiOutput("choose_note"),
            actionButton("goButton", "Guardar")
        ), 
                                        # Show a summary of the dataset and an HTML table with the 
                                        # requested number of observations
        mainPanel(
            h1(htmlOutput("titulo")),
            radioButtons("save_note", label = h3("¿Guardar nota?"),
                         choices = list("Si" = 1, "No" = 2), 
                         selected = 1),
            
            textOutput("nf"),
            strong(htmlOutput("fecha")),
            strong(htmlOutput("fuente")),
            textOutput("boton"),
            textOutput("texto")
        )
    )
)
