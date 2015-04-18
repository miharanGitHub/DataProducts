library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Randoms with defined correlation"),
        sidebarPanel(
                sliderInput("n", "Number of simulations:", 
                           min=50, max=10000, value=500),
                p("Define the number of simulations"),
                br(),
                br(),
                sliderInput("r", "Correlation:", 
                            min=0, max=1, value=0.5),
                p("Define the correlation"),
                br(),
                br(),
                actionButton("goButton", "Generate!"),
                p("Click the button to update simulation.")
        ),
        mainPanel(
                p("Simulated correlation"),
                verbatimTextOutput("nText"),
                
                # If number of points is less than 50 scatter is not shown
                conditionalPanel("input.n >= 100",
                                 plotOutput("scatterPlot", height = 600, width=600)
                )
        )
))