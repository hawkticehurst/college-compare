## Group: Hawk Ticehurst, Alex Davis, Zach Wu, Ishan Mitra
## Info 201: Final Project
## College Data Web App UI

library(shiny)
library(ggplot2)
library(mapdata)
library(dplyr)
library(zipcode)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("College Data"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("state", "Type in a Valid State Abbreviation")
    ),
    
    mainPanel(
       plotOutput("plot")
    )
  )
)
