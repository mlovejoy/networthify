# ui.R

shinyUI(fluidPage(
        titlePanel("Coursera Developing Data Products"),
        
        sidebarLayout(
                sidebarPanel(
                       
                        numericInput("annualSavings", label = h3("Annual                 savings in any currency"), value = 50000),
                        
                        numericInput("annualExpenses", label = h3("Annual expenses in any currency"), value = 50000),
                        
                        numericInput("currentPortfolioValue", label = h3("Current portfolio value in any currency"), value = 100000),
                        
                        sliderInput("SWR", label = h3("Safe Withdrawal Rate (%)"), min = 0, max = 20, value = 4, step = 0.5)
                        
                        #sliderInput("savingsRate", label = h3("Savings Rate %"), min = 0, max = 100, value = 50)
                        
                ),
                
                mainPanel(
                        
                        p("This Shiny application was developed by Mike Lovejoy for the Coursera Data Science Specialization, Developing Data Products course in August 2016."),
                        
                        h1("Networthify Early Retirement Calculator"),
                        
                        p("This Shiny application is a re-creation of the ", a("Networthify Early Retirement Calculator", href="https://networthify.com/calculator/earlyretirement"), ". When your annual return on investments covers 100% of your expenses, you are financially independent. Typical retirement calculators assume you require 80% of your pre-retirement ", strong("income"), ", whereas this calculator assumes you will maintain your style of living and that you need 100% of your pre-retirement ", strong("expenses"), ". Obviously, this is a much more realistic assumption, especially if your savings rate is significantly higher than average."),
                        
                        p(),
                        
                        #textOutput("AnnualSavings"),
                        textOutput("SavingsRate"),
                        #textOutput("SWR"),
                        
                        p(),
                        
                        textOutput("networthify")
                )
        )
))
    
      
