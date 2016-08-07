# server.R

library(shiny)

savings_rate <- function(annual_savings, annual_expenses) 100*(annual_savings/(annual_savings + annual_expenses))

# Annual ROI will be set to 5%
roi <<- .05

#FV <- function(annual_expenses, swr) annual_expenses/(swr/100)

networthify <- function(annual_expenses, swr, annual_savings, roi, current_portfolio_value) (log(annual_expenses/(swr/100) + annual_savings/roi) - log(current_portfolio_value + annual_savings/roi))/log(1 + roi)

shinyServer(function(input, output) {
        
#         output$AnnualSavings <- renderText({
#                 paste("You have entered an annual savings of ", input$annualSavings)
#         })
        
        output$SavingsRate <- renderText({
                paste("You have a savings rate of ", round(savings_rate(input$annualSavings, input$annualExpenses), 1), " percent. Keep it going!")
        })
        
#         output$SWR <- renderText({
#                 paste("You entered a Safe Withdrawal Rate of ", input$SWR, " percent.")
#         })
        
#         output$FV <- renderText({
#                 paste("You have a future value of ", round(FV(input$annualExpenses, input$SWR), 1), " . Good job!")
#         })
        
        output$networthify <- renderText({
                paste("You have ", round(networthify(input$annualExpenses, input$SWR, input$annualSavings, roi, input$currentPortfolioValue), 1), " years until retirement!")
        })
        
})