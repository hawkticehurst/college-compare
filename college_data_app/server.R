## Group: Hawk Ticehurst, Alex Davis, Zach Wu, Ishan Mitra
## Info 201: Final Project
## College Data Web App Server

library(shiny)
library(ggplot2)
library(mapdata)
library(dplyr)
library(zipcode)
library(plotly)
data(zipcode)

## Read in cost by location data
costs_data <- read.csv("data/uni_costs_by_location.csv")
costs_data$ZIP = clean.zipcodes(costs_data$ZIP)

## Read in earnings by college type data
earnings_data <- read.csv("data/uni_earnings_by_college_type.csv")

## Read in repayment rate by family income data
debt_data <- read.csv("data/uni_repayment_by_income.csv")

## Read in debt by student subgroup data
student_debt_data <- read.csv("data/uni_debt_by_income.csv")

server <- function(input, output) {
  ############### Cost By Location ###############
  
  ## Filter cost by location data by inputs
  get_data <- reactive({
    if (is.element(input$state, costs_data$STATE)) {
      costs_data <- filter(costs_data, STATE == input$state)
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
  
  ## Render cost by location plot
  output$plot <- renderPlotly({
    usa_map <- map_data("state")
    costs_data <- get_data()
    costs_data <- left_join(costs_data, zipcode, by = c("ZIP" = "zip"))
    costs_data$city <- NULL
    costs_data$state <- NULL
      
    if (nrow(costs_data) > 0) {
      cost_plot <- ggplot(data = usa_map) +
        geom_polygon(mapping = aes(
          x = long,
          y = lat,
          group = group
        ),
        color = "white") +
        coord_quickmap() +
        geom_point(data = costs_data, mapping = aes(
          x = longitude,
          y = latitude,
          color = "red")) +
        scale_fill_gradient("blue") +
        ggtitle("College Costs in the United States") +
        guides(color = FALSE) +
        labs(x = "Longitude", y = "Latitude")
        
      ggplotly(cost_plot) %>% 
        config(displayModeBar = FALSE) %>% 
        add_markers(
          text = ~paste(paste("School:", costs_data$NAME), 
                        paste("In-State Tuition:", costs_data$INSTATE_TUITION), 
                        paste("Out-Of-State Tuition:", costs_data$OUTOFSTATE_TUITION), 
                        sep = "<br />"),
          size = I(8), 
          hoverinfo = "text"
        )
      
    } else {
      ggplot(data = costs_data) +
        geom_polygon(mapping = aes(
          x = longitude,
          y = longitude,
          group = group),
          color = "white") +
        labs(x = "", y = "") +
        coord_quickmap()
    }
  })
  
  # Calculate cost by location summary message
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
             median(costs_data$OUTOFSTATE_TUITION), ".", " Type: ", typeof(costs_data$ZIP))
    } else {
      paste0("No college/university found matching given input.")
    }
  })
  
  ## Render cost by location summary message
  output$message <- renderText({
    output_message <- message()
    paste0(message())
  })
  
  ############### Earnings By College Type ###############
  
  #Get the earnings data based on the type of college selected (and possibly year data?)
  get_earnings <- reactive({
    
    df <- earnings_data %>%
      filter(COLLEGE_TYPE == input$typeOfCollege) %>%
      arrange_(paste0("desc(",input$earnings_data_type,")"))
    
    return(df)
    
  })
  
  
  #Output a plotly bar graph of the top 15 colleges with the highest earnings
  output$distPlot2 <- renderPlotly({
    earnings_df <- get_earnings()
    earnings_df <- earnings_df[1:15,]
    
    p <- ggplot(data=earnings_df, aes_string(x="NAME", y=input$earnings_data_type)) +
      geom_bar(stat="identity") + ggtitle("College Earnings Data By Years After College & College Type") +
      ylab("Mean Earnings") + xlab("Colleges") + guides(fill=FALSE) + theme(axis.text.x=element_blank())
    
    ggplotly(p) %>% config(displayModeBar = FALSE)
  })
  
  ############### Repayment Rate By Family Income ###############
  output$plot3 <- renderPlot({
    
    get_university <- debt_data %>%
      filter(NAME == input$collegeInput) %>%
      select(contains(input$repaymentYears))
      df <- data.frame(x = colnames(get_university), y = as.numeric(get_university[1, ]))

      ggplot(df,aes(x=x, y=y)) +
      geom_bar(stat="identity") +
      geom_text(aes(label=x), vjust=-0.3, size=3.5)+
      geom_bar(stat="identity", color="steelblue", fill="steelblue") +
      ggtitle(input$collegeInput)+
      theme_minimal()
  })
  
  
  
  ############### Debt By Student Subgroup ###############
  
  order_college_debt <- reactive({
    
    student_debt_data %>%
      arrange_(paste0("desc(",input$studentSubgroup,")"))
    
  })
  
  output$distPlot4 <- renderPlotly({
    
    debt_df <- order_college_debt()
    debt_df <- na.omit(debt_df)
    if(input$debtRange == 0) {
      debt_df <- debt_df[1:15,]
    } else {
      debt_df <- tail(debt_df, n=15)
    }
    
    p <- ggplot(data=debt_df, aes_string(x="NAME", y=input$studentSubgroup)) +
      geom_bar(stat="identity") + ggtitle("College Debt by Income Level") +
      ylab("Debt (in US Dollars)") + xlab("Colleges") + guides(fill=FALSE) + theme(axis.text.x=element_blank())
    
    ggplotly(p) %>% config(displayModeBar = FALSE)
    
  })
  
}
