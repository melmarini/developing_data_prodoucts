# BMI Calculator - User interface
# This is the user-interface definition of the BMI Shiny web application. You can
# run the application by clicking 'Run App' above.

library(shiny) 

shinyUI(
  
  # Create page with side bar
  pageWithSidebar(
    
    # Application title
    headerPanel("Body Mass Index (BMI) Calculator"),
    
    # Side bar
    sidebarPanel(
      numericInput('weight', 'Insert your weight in kilograms', 70) ,
      numericInput('height', 'Insert your height in metres', 1.70, min = 0.2, max = 3, step = 0.01),
      submitButton('Submit')
    ), 
    
    # Main panel
    mainPanel(
      p('Taking into account the values entered by you, your Body Mass Index is:'),
      verbatimTextOutput("estimation"),
      p('The above BMI result, also known as the Quetelet index, is the value derived from the weight and height of an individual (both adult men and women). This BMI result means that you are classified as:'),
      strong(verbatimTextOutput("diagnostic")),
      p('This result is derived from the classification below, which regards the BMI result, and is applied by the World Health Organization (WHO):'),
      tags$div(
        tags$ul(
          tags$li('BMI < 18.5        = Underweight'),
          tags$li('18,5 < BMI < 24,9 = Normal weight'),
          tags$li('24,9 < BMI < 29,9 = Overweight'),
          tags$li('BMI > 29,9        = Obesity')))
    )
    
  )
  
)