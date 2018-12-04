## Group: Hawk Ticehurst, Alex Davis, Zach Wu, Ishan Mitra
## Info 201: Final Project
## College Data Web App UI

library(shiny)

shinyUI(fluidPage(
  tags$head(
    tags$title("College Compare"),
    tags$link(rel="stylesheet", type = "text/css", href="index.css"),
    tags$meta(charset="utf-8"),
    tags$meta(name="viewport", content="width=device-width, initial-scale=1, shrink-to-fit=no")
  ),

  navbarPage(id = "navbar",
             collapsible = TRUE,
             header = TRUE,
             position = c("fixed-top"),
             title = "College Compare",
             
             ## Project Page Content
             tabPanel("Home",
                      tags$header(
                        tags$div(id = "header-content",
                                 h1(class = "focus-in-contract",
                                    "College Compare"),
                                 p(class = "text-focus-in",
                                   "An information resource for prospective college students.")
                        ),
                        tags$div(class = "wave wave1"),
                        tags$div(class = "wave wave2"),
                        tags$div(class = "wave wave3")
                      ),
                      
                      ## Summary of Research Question 1
                      tags$div(class = "summary-content-container",
                               h3(id = "color-bar1", class = "summary-title", "Cost of College"),
                               p(class = "summary-text",
                                 "It's no secret that college is expensive. It's more important 
                                 than ever to perform due diligence when exploring your 
                                 collegiate options. What are the costs of college by zip code? 
                                 How about if you're an in-state vs. out-of-state student?")     
                      ),
                      
                      ## Research Question 1 Visualization
                      tags$div(class = "viz-container",
                               sidebarLayout(
                                 sidebarPanel(
                                   selectInput("stateStatus",
                                               "State Status",
                                               c("In State", "Out of State")),
                                   textInput("zipCodeInput",
                                             "Zip Code")
                                 ),
                                 
                                 mainPanel(
                                   plotOutput("distPlot1")
                                 )
                               )         
                      ),
                      
                      ## Summary of Research Question 2
                      tags$div(class = "summary-content-container", 
                               h3(id = "color-bar2", class = "summary-title", "Post-College Earnings"),
                               p(class = "summary-text",
                                 "What colleges have the highest post-college average earnings depending
                                 on Public, Private Nonprofit, and Private For-Profit colleges?")     
                      ),
                      
                      ## Research Question 2 Visualization
                      tags$div(class = "viz-container",
                               sidebarLayout(
                                 sidebarPanel(
                                   selectInput("typeOfCollege",
                                               "Type of College",
                                               c("Public", "Private Nonprofit", "Private For-Profit"))
                                 ),
                                 
                                 mainPanel(
                                   plotOutput("distPlot2")
                                 )
                               )        
                      ),
                      
                      ## Summary of Research Question 3
                      tags$div(class = "summary-content-container", 
                               h3(id = "color-bar3", class = "summary-title", "Best Repayment Rates"),
                               p(class = "summary-text", 
                                 "What colleges have the best repayment rate (for 1, 3, 5, and 7 years) 
                                 based on family income?")
                      ),
                      
                      ## Research Question 3 Visualization
                      tags$div(class = "viz-container",
                               sidebarLayout(
                                 sidebarPanel(
                                   selectInput("repaymentYears",
                                               "Repyament Years",
                                               c("1 year", "3 years", "5 years", "7 years"))
                                 ),
                                 
                                 mainPanel(
                                   plotOutput("distPlot3")
                                 )
                               )      
                      ),
                      
                      ## Summary of Research Question 4
                      tags$div(class = "summary-content-container", 
                               h3(id = "color-bar4", class = "summary-title", "Largest Debt"),
                               p(class = "summary-text", 
                                 "Which schools have the greatest cumulative median debt disaggregated 
                                 by student subgroups?")
                      ),
                      
                      ## Research Question 4 Visualization
                      tags$div(class = "viz-container",
                               sidebarLayout(
                                 sidebarPanel(
                                   selectInput("studentSubgroup",
                                               "Student Subgroup",
                                               c("White", "Black", "Asian", "Hispanic", "Other?"))
                                 ),
                                 
                                 mainPanel(
                                   plotOutput("distPlot4")
                                 )
                               )       
                      )
             ),
             
             ## Team Page Content
             tabPanel("Team", 
                      "contents3"
             )
  )
))
