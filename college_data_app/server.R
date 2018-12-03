## Group: Hawk Ticehurst, Alex Davis, Zach Wu, Ishan Mitra
## Info 201: Final Project
## College Data Web App Server

library(shiny)
library(ggplot2)
library(mapdata)
library(dplyr)
library(zipcode)

zipcode <- data("zipcode")
costs_data <- read.csv("../uni_costs_by_location.csv")


server <- function(input, output) {
   get_data <- reactive({
     if (is.element(input$state, costs_data$STATE)) {
       costs_data <- filter(costs_data, STATE == input$state)
       zipcode <- filter(zipcode, state == input$state)
     }
     return(costs_data)
   })
   output$plot <- renderPlot({
     usa_map <- map_data("state")
     costs_data <- get_data()
     costs_data <- inner_join(costs_data, zipcode, by = c("ZIP" = "zip"))
     ggplot(data = usa_map) +
       geom_polygon(mapping = aes(
         x = long,
         y = lat,
         group = group),
         color = "white") +
       coord_quickmap() +
     geom_point(data = costs_data, mapping = aes(
       x = lng,
       y = lat,
       color = usa_data$Shape)) +
       ggtitle("College Costs in the United States") +
       guides()##tbd
   })
}
