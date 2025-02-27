library("tidyverse")
library("shiny")

homerange <- read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")


library(shiny)

ui <- fluidPage(
  
  radioButtons("x",
               "Select Fill Variable",
               choices = c("trophic.guild", "thermoregulation"),
               selected = "trophic.guild"),
  plotOutput("plot")
  
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    
    ggplot(data=homerange, aes_string(x="locomotion", fill=input$x))+
      geom_bar(position = "dodge", alpha = 0.8, color="black")
  })
}

shinyApp(ui, server)

# we dont share these apps as R markdown