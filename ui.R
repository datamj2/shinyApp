library(shiny)

# rsconnect::deployApp("/Users/mjlaptop3/0 coursera datascience/developing data products/0 week04/0 project/0 shiny app")
# https://datamj2.shinyapps.io/ddd_wk04_proj/
shinyUI(fluidPage(
        titlePanel("Predict judicial retention rating from attorney ratings"),
        sidebarLayout(
                sidebarPanel(
                        selectInput("Pred1", "Choose predictor (rating category):",choice = c("num of attorney contacts with judge" = "CONT","judicial integrity" = "INTG","judge's familiarity with law" = "FAMI"),selected = NULL),
                        sliderInput("sliderPred1", "Select predictor value", 5.5, 10.5, value = 7.5,step=.1),
                        checkboxInput("showModel1", "Show/Hide Model", value = TRUE),
                        # helpText(paste("Choose predictor","selects the type of rating. Select predictor value is the value used to predict Judicial retention rating.")),
                        tags$span(class="help-block", checked=NA,
                                  tags$b("Instructions")
                        ),
                        tags$span(class="help-block", checked=NA,
                                 tags$em("Choose predictor (rating category):"),
                                 tags$p("selects the type of rating used to predict Judicial retention rating.")
                        ),
                        tags$span(class="help-block", checked=NA,
                                 tags$em("Select predictor value:"),
                                 tags$p("selects the numerical value used to predict Judicial retention rating.")
                        ),
                        tags$span(class="help-block", checked=NA,
                                 tags$em("Show/Hide Model"),
                                 tags$p("displays/hides the regression line from the model.")
                        ),
                        tags$span(class="help-block", checked=NA,
                                  tags$p("Click on link below for ui.R and server.R code"),
                                  tags$a(href="https://github.com/datamj2/shinyApp","https://github.com/datamj2/shinyApp")
                        )

               ),
                
                mainPanel(
                        plotOutput("plot1"),
                        h4("Predicted retention rating from Model:"),
                        textOutput("pred1")
                )
        )
)
)