library(shiny)
library(shinyWidgets)
library(leaflet)
library(tidyverse)

df_location <- read_csv('data/Hospital_Locations.csv')

df_location <- df_location %>%
  mutate(popup_text = paste0("<center>", #Setting up popup info
                             "</br><b>Hospital Name</b>: ", Hospital_Name, 
                             "</br><b>Type of Hospital</b>: ", Type,
                             "</br><b>Address</b>: ", Address,
                             "</br><a href='", Link, "' target='_blank'>Visit Hospital Website...</a></center>"))

df_location <- df_location[order(df_location$LGAName),]


ui <- bootstrapPage(
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  
  leafletOutput("map", width = "100%", height = "100%"),
  
  absolutePanel(top = 10, right = 10,
                selectInput("LGA", label = "Select a suburb:",
                            choices = c('ALL SUBURBS', unique(df_location$LGAName))
                )
  )
)



server <- function(input, output, session) {
  
  filteredData <- reactive({
    if (input$LGA == "ALL SUBURBS") {
      df_location
    } else {
      filter(df_location, LGAName %in% input$LGA)
    }
  })
  
  output$map <- renderLeaflet({
    
    df_location$Type <- factor(df_location$Type)
    
    private_public <- c("red", "blue")[df_location$Type]
    
    icons <- awesomeIcons(
      # fa-plus-square, fa-medkit, fa-h-square, fa-user-md
      icon = "fa-plus-square",
      markerColor = private_public,
      library = "fa"
    )
    
    leaflet(filteredData()) %>%
      addProviderTiles(providers$Esri.WorldTopoMap) %>%
      addAwesomeMarkers(~Longitude, ~Latitude, 
                        icon = icons, 
                        label = ~Hospital_Name, 
                        labelOptions = labelOptions(textsize = "12px"),
                        popup = ~popup_text,
                        clusterOptions = markerClusterOptions()
                        )
  })
  
  observe({
    df_location$Type <- factor(df_location$Type)
    
    private_public <- c("red", "blue")[df_location$Type]
    
    icons <- awesomeIcons(
      # fa-plus-square, fa-medkit, fa-h-square, fa-user-md
      icon = "fa-plus-square",
      markerColor = private_public,
      library = "fa"
    )
    
    leafletProxy("map", data = filteredData()) %>%
      clearShapes() %>%
      addAwesomeMarkers(~Longitude, ~Latitude, 
                        icon = icons, 
                        label = ~Hospital_Name, 
                        labelOptions = labelOptions(textsize = "12px"),
                        popup = ~popup_text,
                        clusterOptions = markerClusterOptions()
                        )
  })
}


shinyApp(ui, server)
