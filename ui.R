library(shiny)
library(DT)
shinyUI(fluidPage(
  titlePanel("Energy Outage"),
  sidebarLayout(
    sidebarPanel(
        checkboxGroupInput('show_vars', 'Columns in Table to show:',
                           names(mydata), selected = names(mydata)),
        br(),
        helpText("Click the Columns that you want to choose")
      ),
      mainPanel(
        tabsetPanel(
          id = 'dataset',
          tabPanel('mydata', DT::dataTableOutput('mytable'))
        ))),
  fluidRow(
    column(6,
           plotOutput('ReasonPlot')
           ),
    column(6,
        plotOutput('CompanyFreqhist')),

  hr()),
        
        fluidRow(
          column(3,
                 h4("Reason Cause the Outage(2002 - 2016)"),
                 selectInput(inputId = "cause", label = "Cause :", 
                             choices=colnames(msubdata)),
                 br()
          ),
          column(4, offset = 1,
                 h4("Frequency of Outage happended by Each Company"),
                 selectInput(inputId = "company", label = "Company :", 
                             choices=names(mset)),
                 br(),
                 checkboxInput(inputId = "density",
                               label = strong("Show density estimate"),
                               value = FALSE)
                 ),
          column(4,
                 # Display this only if the density is shown
                 conditionalPanel(condition = "input.density == true",
                                  sliderInput(inputId = "bw_adjust",
                                              label = "Bandwidth adjustment:",
                                              min = 0.2, max = 2, value = 1, step = 0.2)
                                  )
                 ))
  ))