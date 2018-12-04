## Group: Hawk Ticehurst, Alex Davis, Zach Wu, Ishan Mitra
## Info 201: Final Project
## College Data Web App UI

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("College Data"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("state", "Search by State Abbreviation"),
      textInput("zip", "Search by Zipcode"),
      sliderInput("in_state", "Select In-State Tuition Range",
                  min = 0, max = 46000, value = c(0, 50000),
                  step = 500),
      sliderInput("out_of_state", "Select Out-Of-State Tuition Range",
                  min = 0, max = 46000, value = c(0, 50000),
                  step = 500)
    ),
    
    mainPanel(
       plotOutput("plot"),
       textOutput("message")
    )
  )
)
