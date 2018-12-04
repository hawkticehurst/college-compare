## Group: Hawk Ticehurst, Alex Davis, Zach Wu, Ishan Mitra
## Info 201: Final Project
## College Data Web App Server

library(shiny)
library(ggplot2)
library(mapdata)
library(dplyr)
if(!require(zipcode)) {
  install.packages(zipcode)
}
library(zipcode)

## Read in and reformat data
costs_data <- read.csv("uni_costs_by_location.csv")
costs_data$ZIP = as.character(costs_data$ZIP)

server <- function(input, output) {
  
  ## Get Data
  get_data <- reactive({
    if (is.element(input$state, costs_data$STATE)) {
      costs_data <- filter(costs_data, STATE == input$state)
      zipcode <- filter(zipcode, state == input$state)
    }
    if (is.element(input$zip, costs_data$ZIP)) {
      costs_data <- filter(costs_data, ZIP == input$zip)
      zipcode <- filter(zipcode, zip == input$zip)
    }
    
    costs_data <- costs_data %>% 
      filter(STATE != "HI" & STATE != "AK" & STATE != "AS" & STATE != "MH"
             & STATE != "FM" & STATE != "MP" & STATE != "GU"
             & STATE != "PW" & STATE != "PR" & STATE != "VI") %>%
      filter(INSTATE_TUITION <= max(input$in_state) &
             INSTATE_TUITION >= min(input$in_state) &
             OUTOFSTATE_TUITION <= max(input$out_of_state) &
             OUTOFSTATE_TUITION >= min(input$out_of_state))
    
    return(costs_data)
  })
  
  ## Render Plot
  output$plot <- renderPlot({
    usa_map <- map_data("state")
    costs_data <- get_data()
    costs_data <- left_join(costs_data, zipcode, by = c("ZIP" = "zip"))
    costs_data$city <- NULL
    costs_data$state <- NULL
      
    if (nrow(costs_data) > 0) {
      ggplot(data = usa_map) +
        geom_polygon(mapping = aes(
          x = long,
          y = lat,
          group = group),
          color = "white") +
        labs(x = "", y = "") +
        coord_quickmap() +
        geom_point(data = costs_data, mapping = aes(
          x = longitude,
          y = latitude,
          colour = "red")) +
        ggtitle("College Costs in the United States") +
        guides(colour = FALSE)
    } else {
      ggplot(data = usa_map) +
        geom_polygon(mapping = aes(
          x = long,
          y = lat,
          group = group),
          color = "white") +
        labs(x = "", y = "") +
        coord_quickmap()
    }
  })
  
  # Message
  message <- reactive({
    costs_data <- get_data()
    if (nrow(costs_data) > 0) {
      zip_message <- ""
      state_message <- ""
      if (length(unique(costs_data$ZIP)) > 1) {
        zip_message <- paste0("across ", length(unique(costs_data$ZIP)),
                              " zipcodes, ")
        if (length(unique(costs_data$STATE)) > 1) {
          state_message <- paste0(length(unique(costs_data$STATE)),
                                  " states, including ",
                                  unique(costs_data$STATE)[1], " and ",
                                  unique(costs_data$STATE)[2], ", ")
        } else if (length(unique(costs_data$STATE)) == 1) {
          state_message <- paste0(costs_data$STATE[1], ", ")
        }
      } else if (length(unique(costs_data$ZIP)) == 1) {
        zip_message <- paste0("under zipcode ", costs_data$ZIP[1], ", ")
        state_message <- paste0(costs_data$CITY[1], ", ",
                                costs_data$STATE[1], ", ")
      }
      paste0("Summary: ", "Displayed data show ", nrow(costs_data),
             " college(s)/universitie(s) in ", state_message, zip_message,
             "with a median in-state tuition of ",
             median(costs_data$INSTATE_TUITION),
             " and a median out-of state tuition of ",
             median(costs_data$OUTOFSTATE_TUITION), ".")
    } else {
      paste0("No college/university found matching given input.")
    }
  })
  
  ## Render Text
  output$message <- renderText({
    output_message <- message()
    paste0(message())
  })
}
