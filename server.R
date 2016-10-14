# BMI Calculator - Function & Server Logic
# This is the server logic of the BMI Shiny web application. You can run the 
# application by clicking 'Run App' above.

library(shiny) 

# BMI calculation
BMI <- function(weight, height) { weight/(height^2) }

# Check diagnostic result based on BMI result
diagnosis <- function(weight, height)
{ BMI_value <- weight/(height^2)
ifelse(BMI_value < 18.5, "underweight",
       ifelse(BMI_value < 25, "normal weight",
              ifelse(BMI_value < 30, "overweight",
                     "obesity"))) }

# Define server logic to present results
shinyServer( 
  # Define function for input and output values for BMI calculation
  function(input, output) 
  { # Input and output
    output$inputweightvalue <- renderPrint({input$weight})
    output$inputheightvalue <- renderPrint({input$height})
    output$estimation <- renderPrint({BMI(input$weight,input$height)})
    output$diagnostic <- renderPrint({diagnosis(input$weight,input$height)}) }
)