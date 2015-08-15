library(shiny)

# Define UI for dataset viewer application
shinyUI(
  fluidPage(
    # Application title
    headerPanel("Mileage Prediction App."),
  
    #sidebarPanel(
    #  p("p creates a paragraph of text."),
    #  numericInput('hp', 'Gross Horsepower (HP)', 123, min = 50, max = 340, step = 10),
    #  submitButton('Submit')
    #),
    mainPanel(
        p("This web page contains a simple application to predict the mileage of a car given
        a gross horsepower value. The prediction uses a least squares linear model fitting the ", 
        em("mtcars"), " dataset.", "The percentage of explained variation by this model is of ",
        textOutput('expVar',inline = TRUE), "%, with a P-value close to ", 
        textOutput('modelP',inline = TRUE), "."),
        h3('Instructions:'),
        tags$ul(
            tags$li("The application is displayed at the left side-panel."), 
            tags$li("To compute an estimate of the mileage for a given power (HP) 
                chose the closest value on the list presented and press submit"), 
            tags$li("The estimate is displayed bellow ", strong("Predicted Mileage"), 
            "and the units are Miles/Gallon.")
        )
    ),
    
    sidebarPanel(
        numericInput('hp', 'Gross Horsepower (HP)', 120, min = 50, max = 340, step = 10),
        submitButton('Submit'),
        h3('Results of prediction'),
        h4('Value entered'),
        verbatimTextOutput("inputValue"),
        h4('Predicted Mileage (Miles/(US) gallon)'),
        verbatimTextOutput("prediction")
    )
  )
)
