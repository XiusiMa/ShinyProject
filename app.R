
library(shiny)
library(DT)

myui <- fluidPage(
  titlePanel("Energy Outage"),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput('show_vars', 'Columns in Table to show:',
                         names(mydata), selected = names(mydata))
    ),
    mainPanel(
      tabsetPanel(
        id = 'dataset',
        tabPanel('mydata', DT::dataTableOutput('mytable'))
      )
    )
  ))
# server
myserver <- function(input,output){
  # choose columns to display
  mydata2 = mydata[sample(nrow(mydata),100), ]
  output$mytable <- DT::renderDataTable({
    DT::datatable(mydata2[, input$show_vars, drop = FALSE])
  })
}

shinyApp(ui = myui, server = myserver)