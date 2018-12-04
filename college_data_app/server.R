## Group: Hawk Ticehurst, Alex Davis, Zach Wu, Ishan Mitra
## Info 201: Final Project
## College Data Web App Server

library(shiny)

shinyServer(function(input, output) {
   
  output$distPlot1 <- renderPlot({
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  
  output$distPlot2 <- renderPlot({
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  
  output$distPlot3 <- renderPlot({
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  
  output$distPlot4 <- renderPlot({
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  
})
