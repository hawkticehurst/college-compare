## Group: Hawk Ticehurst, Alex Davis, Zach Wu, Ishan Mitra
## Info 201: Final Project
## College Data Web App UI

library(shiny)

shinyUI(fluidPage(
  tags$head(
    tags$title("College Data Webapp"),
    tags$link(rel="stylesheet", type = "text/css", href="index.css"),
    tags$meta(charset="utf-8"),
    tags$meta(name="viewport", content="width=device-width, initial-scale=1, shrink-to-fit=no")
  ),

  navbarPage(id = "navbar",
             collapsible = TRUE,
             header = TRUE,
             position = c("fixed-top"),
             title = "College Data Webapp",
             
             ## Project Page Content
             tabPanel("Project", 
                      tags$div(class = "jumbotron",
                               h1(class = "focus-in-contract",
                               "College Data"),
                               p("An information resource for incoming college students.")
                      ),
                      
                      ## Research Question 1 Visualization
                      tags$div(class = "viz-card",
                               h3("Cost of College By Location"),
                               p("What are the costs of college by zip code? How about if you're an in-state vs. out-of-state student?"),
                               sidebarLayout(
                                 sidebarPanel(
                                   sliderInput("bins",
                                               "Number of bins:",
                                               min = 1,
                                               max = 50,
                                               value = 30)
                                 ),
                                 
                                 mainPanel(
                                   plotOutput("distPlot1")
                                 )
                               )         
                      ),
                      
                      ## Research Question 2 Visualization
                      tags$div(class = "viz-card",
                               h3("Highest Post-College Earnings"),
                               p("What colleges have the highest post-college average earnings depending on Public, Private Nonprofit, and Private For-Profit colleges?"),
                               sidebarLayout(
                                 sidebarPanel(
                                   sliderInput("bins",
                                               "Number of bins:",
                                               min = 1,
                                               max = 50,
                                               value = 30)
                                 ),
                                 
                                 mainPanel(
                                   plotOutput("distPlot2")
                                 )
                               )        
                      ),
                      
                      ## Research Question 3 Visualization
                      tags$div(class = "viz-card",
                               h3("Best Repayment Rates"),
                               p("What colleges have the best repayment rate (for 1, 3, 5, and 7 years) based on family income?"),
                               sidebarLayout(
                                 sidebarPanel(
                                   sliderInput("bins",
                                               "Number of bins:",
                                               min = 1,
                                               max = 50,
                                               value = 30)
                                 ),
                                 
                                 mainPanel(
                                   plotOutput("distPlot3")
                                 )
                               )      
                      ),
                      
                      ## Research Question 4 Visualization
                      tags$div(class = "viz-card",
                               h3("Largest Debt"),
                               p("Which schools have the greatest cumulative median debt disaggregated by student subgroups?"),
                               sidebarLayout(
                                 sidebarPanel(
                                   sliderInput("bins",
                                               "Number of bins:",
                                               min = 1,
                                               max = 50,
                                               value = 30)
                                 ),
                                 
                                 mainPanel(
                                   plotOutput("distPlot4")
                                 )
                               )       
                      )
             ),
             
             ## About Page Content
             tabPanel("About", 
                      "contents2"
             ),
             
             ## Team Page Content
             tabPanel("Team", 
                      "contents3"
             )
  )
))
