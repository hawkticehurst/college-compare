## Group: Hawk Ticehurst, Alex Davis, Zach Wu, Ishan Mitra
## Info 201: Final Project
## College Data Web App UI

library(shiny)
library(plotly)

costs_data <- read.csv("data/uni_costs_by_location.csv")
debt_data <- read.csv("data/uni_repayment_by_income.csv")


shinyUI(fluidPage(
  tags$head(
    tags$title("College Compare"),
    tags$link(rel="stylesheet", type = "text/css", href="index.css"),
    tags$link(rel="stylesheet", href="https://unpkg.com/aos@2.3.1/dist/aos.css"),
    tags$link(rel="icon", href="favicon.ico", type="image/x-icon"),
    tags$meta(charset="utf-8"),
    tags$meta(name="viewport", content="width=device-width, initial-scale=1, shrink-to-fit=no")
  ),

  navbarPage(id = "navbar",
             collapsible = TRUE,
             header = TRUE,
             position = c("fixed-top"),
             title = "College Compare",
             
             ## Home Page Content
             tabPanel("Home",
                      tags$header(
                        tags$div(id = "header-content",
                                 h1(id = "home-title",
                                    class = "focus-in-contract",
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
                               h3(id = "color-bar1", 
                                  class = "summary-title",
                                  `data-aos` = "fade-right",
                                  `data-aos-duration` = "800",
                                  "Cost of College"),
                               p(class = "summary-text",
                                 `data-aos` = "fade-right",
                                 `data-aos-duration` = "900",
                                 "It's no secret that college is expensive. It's more important 
                                 than ever to perform due diligence when exploring your collegiate 
                                 options. Using ",
                                 tags$a(href = "https://collegescorecard.ed.gov/data/", "College Scorecard Data"),
                                 " collected by the U.S. Department of Education we developed a 
                                 resource for helping prospective students and their families in 
                                 some of this process."),
                               p(class = "summary-text",
                                 `data-aos` = "fade-right",
                                 `data-aos-duration` = "900",
                                 "The first tool, below, tackles one of the biggest questions: 
                                 What are the costs of college? Results to this question can be
                                 filtered by state, in-state tuition level, and out-of-state
                                 tuition level.")
                      ),
                      
                      ## Research Question 1 Visualization Version 2
                      tags$div(id = "viz-container1",
                               class = "viz-container",
                               `data-aos` = "fade-left",
                               `data-aos-duration` = "800",
                               sidebarLayout(
                                 sidebarPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1000",
                                   selectInput("state",
                                               "Search by State", costs_data$STATE),
                                   radioButtons("tuition_type", "Select In-State or Out-Of-State Tuition",
                                                choices = list("In-State Tuition"=0, "Out-Of-State Tuition"=1),
                                                selected = 0),
                                   sliderInput("tuition_range", "Select Tuition Range",
                                               min = 0, max = 46000, value = c(0, 50000),
                                               step = 500)
                                 ),
                                 
                                 mainPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1500",
                                   plotlyOutput("plot"),
                                   textOutput("message")
                                 )
                               ) 
                      ),
                      
                      ## Summary of Research Question 2
                      tags$div(class = "summary-content-container",
                               h3(id = "color-bar2", 
                                  class = "summary-title", 
                                  `data-aos` = "fade-right",
                                  `data-aos-duration` = "800",
                                  "Post-College Earnings"),
                               p(class = "summary-text",
                                 `data-aos` = "fade-right",
                                 `data-aos-duration` = "1000",
                                 "Another incredibly important consideration is the return of 
                                 investment from your college experience. The second tool asks 
                                 which colleges have the highest post-college average earnings 
                                 based on how many years it's been since graduation and whether
                                 it was a Public, Private Nonprofit, and Private For-Profit 
                                 university?")     
                      ),
                      
                      ## Research Question 2 Visualization
                      tags$div(id = "viz-container2",
                               class = "viz-container",
                               `data-aos` = "fade-left",
                               `data-aos-duration` = "800",
                               sidebarLayout(
                                 sidebarPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1000",
                                   selectInput("typeOfCollege",
                                               "Type of College",
                                               c("Public" = 1, 
                                                 "Private Nonprofit" = 2, 
                                                 "Private For-Profit" = 3)),
                                   radioButtons("earnings_data_type", label = h3("Select years of data to view"),
                                                choices = list("10 Years" = "MEAN_EARNINGS_10_YEARS", 
                                                               "8 years" = "MEAN_EARNINGS_8_YEARS", 
                                                               "6 years" = "MEAN_EARNINGS_6_YEARS"),
                                                selected = "MEAN_EARNINGS_10_YEARS")
                                 ),
                                 
                                 mainPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1500",
                                   plotlyOutput("distPlot2")
                                 )
                               )        
                      ),
                      
                      ## Summary of Research Question 3
                      tags$div(class = "summary-content-container",
                               h3(id = "color-bar3", 
                                  class = "summary-title", 
                                  `data-aos` = "fade-right",
                                  `data-aos-duration` = "800",
                                  "Best Repayment Rates"),
                               p(class = "summary-text",
                                 `data-aos` = "fade-right",
                                 `data-aos-duration` = "1000",
                                 "With college being so expensive a third consideration is how 
                                 long it will take to repay debt accumulated during your time at
                                 school. The third tool ask which colleges have the best 
                                 repayment rate (for 1, 3, 5, and 7 years) based on family 
                                 income?")
                      ),
                      
                      ## Research Question 3 Visualization
                      tags$div(id = "viz-container3",
                               class = "viz-container",
                               `data-aos` = "fade-left",
                               `data-aos-duration` = "800",
                               sidebarLayout(
                                 sidebarPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1000",
                                   selectInput("collegeInput",
                                               "Select College/University", debt_data$NAME),
                                   selectInput("repaymentYears",
                                               "Repayment Years",
                                               c("1 year"="1", "3 years"="3", "5 years"="5", "7 years"="7"))
                                 ),
                                 
                                 mainPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1500",
                                   plotOutput("plot3")
                                 )
                               )      
                      ),
                      
                      ## Summary of Research Question 4
                      tags$div(class = "summary-content-container",
                               h3(id = "color-bar4", 
                                  class = "summary-title",
                                  `data-aos` = "fade-right",
                                  `data-aos-duration` = "800",
                                  "Largest Debt"),
                               p(class = "summary-text", 
                                 `data-aos` = "fade-right",
                                 `data-aos-duration` = "1000",
                                 "Finally, examining what level of debt can be expected at certain
                                 colleges can be a helpful contributing factor in your college 
                                 decision. The fourth tool ask which schools have the greatest 
                                 cumulative median debt disaggregated by family income?")
                      ),
                      
                      ## Research Question 4 Visualization
                      tags$div(id = "viz-container4",
                               class = "viz-container",
                               `data-aos` = "fade-left",
                               `data-aos-duration` = "800",
                               sidebarLayout(
                                 sidebarPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1000",
                                   radioButtons("studentSubgroup",
                                                "Student Income Group",
                                                c("Low Income ($0 - $30k)" = "LOW_INCOME_MEDIAN_DEBT", 
                                                  "Middle Income ($30k - $75k)" = "MED_INCOME_MEDIAN_DEBT",
                                                  "High Income ($75k+)" = "HI_INCOME_MEDIAN_DEBT")),
                                   radioButtons("debtRange",
                                                "High/Low Debt?",
                                                c("Colleges with Highest Debt" = 0, 
                                                  "Colleges with Lowest Debt" = 1))
                                 ),
                                 
                                 mainPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1500",
                                   plotlyOutput("distPlot4")
                                 )
                               )       
                      )
             ),
             
             ## Team Page Content
             tabPanel("Team", 
                      tags$header(
                        tags$div(id = "team-header-content",
                                 h1(id = "team-title",
                                    class = "focus-in-contract",
                                    "The Team")
                        )
                      ),
                      tags$div(
                        class = "team-card-container",
                        tags$div(
                          class = "team-card",
                          `data-aos` = "fade-left",
                          `data-aos-duration` = "900",
                          tags$img(src = "hawk.jpg", alt = "Headshot of Hawk Ticehurst"),
                          tags$div(
                            class = "team-card-info",
                            tags$h4("Hawk Ticehurst"),
                            p("Major: Informatics Undeclared")
                          )
                        ),
                        tags$div(
                          class = "team-card",
                          `data-aos` = "fade-right",
                          `data-aos-duration` = "900",
                          tags$img(src = "zach.jpg", alt = "Headshot of Zach Wu"),
                          tags$div(
                            class = "team-card-info",
                            tags$h4("Zach Wu"),
                            p("Major: Computer Science Undeclared")
                          )
                        ),
                        tags$div(
                          class = "team-card",
                          `data-aos` = "fade-left",
                          `data-aos-duration` = "900",
                          tags$img(src = "ishan_headshot.jpg", alt = "Headshot of Ishan Mitra"),
                          tags$div(
                            class = "team-card-info",
                            tags$h4("Ishan Mitra"),
                            p("Major: Engineering Undeclared")
                          )
                        ),
                        tags$div(
                          class = "team-card",
                          `data-aos` = "fade-right",
                          `data-aos-duration` = "900",
                          tags$img(src = "alex.jpg", alt = "Headshot of Alex Davis"),
                          tags$div(
                            class = "team-card-info",
                            tags$h4("Alex Davis"),
                            p("Major: Germanics")
                          )
                        )
                      )
             )
  ),
  
  tags$script(src = "https://unpkg.com/aos@next/dist/aos.js"),
  tags$script(HTML("AOS.init();"))
))