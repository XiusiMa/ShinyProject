
library(shiny)
library(DT)

# server
shinyServer(function(input, output){
  # choose columns to display
  mydata2 = mydata[sample(nrow(mydata),100), ]
  output$mytable <- DT::renderDataTable({
    DT::datatable({
      mydata2[, input$show_vars, drop = FALSE]
      })
  })
  
  output$ReasonPlot <- renderPlot({
    
    # Render a barplot
    bp <- barplot(msubdata[,input$cause]*0.01, 
            main="Reason for Outage",
            ylab="Num Customers Affaced(Hundred)",
            xlab="Year")
    axis(1,at=bp,c(2002:2016))
  })
  
  output$CompanyFreqhist <- renderPlot({
 
      
      hist(mset[,input$company],
           probability = TRUE,
           breaks = as.numeric(10),
           xlab = "Duration (minutes)",
           main = "Outage of each Company")
      
      
      if (input$density) {
        dens <- density(mset[,input$company],
                        adjust = input$bw_adjust)
        lines(dens, col = "blue")
      }
  })
}) 
