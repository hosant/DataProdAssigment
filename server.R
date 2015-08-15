# Linear Model for Mileage per gallon
# in function of power.
modFit <- lm(mpg~hp, data = mtcars)
    
# Function to compute the predicted value for a given
# mileage.
mileage <- function(hp) predict(modFit, newdata = data.frame(hp = c(hp)))[[1]]



shinyServer(
  function(input, output) {
    output$expVar <- renderText({ round(100 * summary(modFit)$r.squared,1) })
    output$modelP <- renderText({ round(summary(modFit)$coefficients[1,4],2) })
    output$inputValue <- renderPrint({input$hp})
    output$prediction <- renderPrint({mileage(input$hp)})
  }
)