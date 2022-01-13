#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel("Investment growth"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("rate",
                        "Interest rate percentage:", post = "%",
                        min = 0, step = 0.1 ,
                        max = 10,
                        value = 5),
            sliderInput("time_horizon",
                        "Investment time horizon: ",
                        min = 5, step = 1,
                        max = 20,
                        value = 5),
            sliderInput("investment_amount",
                        "Initial investment: ",
                        min = 1000, step = 1000,
                        max = 10000,
                        value = 5000),
            ),
        mainPanel(
            plotOutput("Plot"),
            tags$a(href = "https://rpubs.com/dimandriop/855270", "Documentation", target = "_blank")
            )
    )
)
)

