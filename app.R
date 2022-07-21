  library(shiny)
  library(shinydashboard)
  library(sunburstR)
  library(tidyverse)  
  
  ui <- fluidPage(
    
    titlePanel("Reto Shiny"),
    sidebarLayout(
      sidebarPanel("Gráfica"),
      mainPanel(
        sunburstOutput("grafica")
      )
    )
  )
  
  server <- function(input, output) {
    
    output$grafica <- renderSunburst({

      base <- read.csv("citibike-tripdata.csv") 
      base2 <-base %>% unite(lista,c(2,13),  sep = "-", remove = TRUE) %>% select(lista,ride_id)
      agrupada <- aggregate(base2$lista, by = list(base2$lista), FUN = length)
      names (agrupada) = c("lista", "numero")
      sunburst(agrupada, width="100%", height=400)
    })
  }
  
  shinyApp(ui = ui, server = server)
  