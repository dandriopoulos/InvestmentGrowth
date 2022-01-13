#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$Plot <- renderPlot({

        # generate rate based on input$rate from ui.R
        x    <- input$rate
        time    <- input$time_horizon
        amount <- input$investment_amount

        df <- matrix(ncol=2, nrow=time)

        for(i in 1:time) {
            df[i,1] <- i
            df[i,2]<- amount*(1+x*0.01)^(i)
        }

        df <- data.frame(df)

        # draw the histogram with the specified number of rate
        g<-ggplot(df, aes(x=df$X1, y=df$X2)) +
            geom_bar(stat = "identity", width = 0.5) + xlab("Time horizon (years)") + ylab("Investment Value ($USD)") + ggtitle("Investment growth")
        g+theme(axis.text=element_text(size=12),
                axis.title=element_text(size=14,face="bold"), plot.title = element_text(size = 16, face = "bold"))
    })

})
