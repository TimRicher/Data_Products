library(shiny)

shinyServer(function(input, output) {

  data(mtcars)
  
# Create factors
  mtcars[mtcars$am == 0, 'am'] <- 'automatic'
  mtcars[mtcars$am == 1, 'am'] <- 'manual'
  mtcars[, 'am'] <- as.factor(mtcars[, 'am'])

  # Generate linear model fit based on selected factors.
  fit <- reactive({
    selected <- ""
    selected <- c( selected, ifelse( input$cyl, 'I(cyl-6)', '' ) )
    selected <- c( selected, ifelse( input$disp, 'disp', '' ) )
    selected <- c( selected, ifelse( input$hp, 'I(hp-150)', '' ) ) 
    selected <- c( selected, ifelse( input$drat, 'drat', '' ) ) 
    selected <- c( selected, ifelse( input$wt, 'I(wt-3)', '' ) )
    selected <- c( selected, ifelse( input$qsec, 'qsec', '' ) ) 
    selected <- c( selected, ifelse( input$vs, 'vs', '' ) ) 
    selected <- c( selected, ifelse( input$gear, 'I(gear-4)', '' ) ) 
    selected <- c( selected, ifelse( input$carb, 'I(carb-1)', '' ) )
    selected <- c('am', selected)
	lm( reformulate(termlabels = selected[selected!=""], response = 'mpg'), data=mtcars)
  })
    
  # Plot the residuals.
  output$plot <- renderPlot({
    par(mfrow=c(2,2))
    plot(fit())
  })
  
  # Generate a summary of the regression
  #output$readme <- renderPrint({
  #  readme_text(mtcars, "text")
  #})
  
})
