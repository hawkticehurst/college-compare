## Group: Hawk Ticehurst, Alex Davis, Zach Wu, Ishan Mitra
## Info 201: Final Project
## College Data Web App Server

library(shiny)

shinyServer(function(input, output) {
   
  output$distPlot1 <- renderPlot({
    x    <- faithful[, 2] 
    stateStatus <- seq(min(x), max(x), length.out = input$stateStatus + 1)
    
    hist(x, breaks = stateStatus, col = 'darkgray', border = 'white')
  })
  
  output$distPlot2 <- renderPlot({
    x    <- faithful[, 2] 
    typeOfCollege <- seq(min(x), max(x), length.out = input$typeOfCollege + 1)
    
    hist(x, breaks = typeOfCollege, col = 'darkgray', border = 'white')
  })
  
  output$distPlot3 <- renderPlot({
    x    <- faithful[, 2] 
    brepaymentYearsins <- seq(min(x), max(x), length.out = input$brepaymentYearsins + 1)
    
    hist(x, breaks = repaymentYears, col = 'darkgray', border = 'white')
  })
  
  output$distPlot4 <- renderPlot({
    x    <- faithful[, 2] 
    studentSubgroup <- seq(min(x), max(x), length.out = input$studentSubgroup + 1)
    
    hist(x, breaks = studentSubgroup, col = 'darkgray', border = 'white')
  })
  
})
