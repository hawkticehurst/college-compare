## Group: Hawk Ticehurst, Alex Davis, Zach Wu, Ishan Mitra
## Info 201: Final Project
## College Data Web App UI

library(shiny)

shinyUI(fluidPage(
  tags$head(
    tags$title("College Compare"),
    tags$link(rel="stylesheet", type = "text/css", href="index.css"),
    tags$link(rel="stylesheet", href="https://unpkg.com/aos@2.3.1/dist/aos.css"),
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
                                 than ever to perform due diligence when exploring your 
                                 collegiate options. Using ",
                                 tags$a(href = "https://collegescorecard.ed.gov/data/", "College Scorecard Data"),
                                 " collected by the U.S. Department of Education we developed a 
                                 resource for helping prospective students in some of this 
                                 process."),
                               p(class = "summary-text",
                                 `data-aos` = "fade-right",
                                 `data-aos-duration` = "900",
                                 "The first tool, below, tackles one of the biggest questions: 
                                 What are the costs of college? Answers to this question can be
                                 filtered by zip code and whether you're an in-state vs. 
                                 out-of-state student.")
                      ),
                      
                      ## Research Question 1 Visualization
                      tags$div(id = "viz-container1",
                               class = "viz-container",
                               `data-aos` = "fade-left",
                               `data-aos-duration` = "800",
                               sidebarLayout(
                                 sidebarPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1000",
                                   selectInput("stateStatus",
                                               "State Status",
                                               c("In State", "Out of State")),
                                   textInput("zipCodeInput",
                                             "Zip Code")
                                 ),
                                 
                                 mainPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1500",
                                   plotOutput("distPlot1")
                                 )
                               )         
                      ),
                      
                      tags$div(id = "viz-container1",
                               class = "viz-container",
                               `data-aos` = "fade-left",
                               `data-aos-duration` = "800",
                               sidebarLayout(
                                 sidebarPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1000",
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
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1500",
                                   plotOutput("plot"),
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
                                 based on Public, Private Nonprofit, and Private For-Profit 
                                 colleges?")     
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
                                               c("Public", "Private Nonprofit", "Private For-Profit"))
                                 ),
                                 
                                 mainPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1500",
                                   plotOutput("distPlot2")
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
                                 college. The third tool ask which colleges have the best 
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
                                   textInput("collegeInput",
                                             "Select College/University"),
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
                                 cumulative median debt disaggregated by student subgroups?")
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
                                   selectInput("studentSubgroup",
                                               "Student Subgroup",
                                               c("White", "Black", "Asian", "Hispanic", "Other?"))
                                 ),
                                 
                                 mainPanel(
                                   `data-aos` = "fade-left",
                                   `data-aos-duration` = "1500",
                                   plotOutput("distPlot4")
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
                          tags$img(src = "hawk.jpg", alt = "Headshot of Hawk Ticehurst"),
                          tags$div(
                            class = "team-card-info",
                            tags$h4("Hawk Ticehurst"),
                            p("Major: Pre-Informatics")
                          )
                        ),
                        tags$div(
                          class = "team-card",
                          tags$img(src = "", alt = "Headshot of Zach Wu"),
                          tags$h4("Zach Wu")
                        ),
                        tags$div(
                          class = "team-card",
                          tags$img(src = "", alt = "Headshot of Ishan Mitra"),
                          tags$h4("Ishan Mitra")
                        ),
                        tags$div(
                          class = "team-card",
                          tags$img(src = "alex.jpeg", alt = "Headshot of Alex Davis"),
                          class = "team-card-info",
                          tags$h4("Alex Davis"),
                          p("Major: Germanics")
                        )
                      )
             )
  ),
  
  tags$script(src = "https://unpkg.com/aos@next/dist/aos.js"),
  tags$script(HTML("AOS.init();"))
))
