library(shiny)

shinyUI(pageWithSidebar(  
  headerPanel("Motor Trend Cars MPG Factors"),
  # Sidebar controls factor included in lm calculation
  sidebarPanel(
    p("Select the factors, impacting mpg, to be included in the linear regression model:"),
    checkboxInput('cyl', 'Number of Cylinders', FALSE),
    checkboxInput('disp', 'Displacement of the Engine', FALSE),
    checkboxInput('hp', 'Horsepower', FALSE),
    checkboxInput('drat', 'Rear Axle Ratio', FALSE),
    checkboxInput('wt', 'Weight (/1000 lbs)', FALSE),
    checkboxInput('qsec', '1/4 Mile Time', FALSE),
    checkboxInput('vs', 'V/Straight', FALSE),
    checkboxInput('gear', 'Number of Gears', FALSE),
    checkboxInput('carb', 'Number of Carburators', FALSE)
  ),
  
  # Show a Tab for the plots using the selected factors
  mainPanel(
    tabsetPanel(
	  #tabPanel("Readme", verbatimTextOutput("readme")), 
tabPanel("Readme", 
tags$div(class="header", checked=NA,
tags$p("My Shiny App lets you choose different factors to include in a linear model."),
tags$p("The linear model shows the impact of the factor on miles per gallon."),
tags$p("The plot renders the residuals versus the fitted values."),
tags$p("mtcars factors impacting mpg:"),
tags$p("cyl   - Number of Cylinders in the Engine"),
tags$p("disp  - Displacement of the Engine (cu.in.)"),
tags$p("hp    - Gross Horsepower"),
tags$p("drat  - Rear Axil Ratio"),
tags$p("wt    - Weight (lb/1000)"),
tags$p("qsec  - Time in the Quarter Mile"),
tags$p("v/s   - V/S"),
tags$p("am    - Transmission (0=Automatic, 1=Manual)"),
tags$p("gear  - Number of Gears"),
tags$p("carb  - Number of Carburators")
)
),
      tabPanel("Residual Plots", plotOutput("plot"))
    )
  )
))
