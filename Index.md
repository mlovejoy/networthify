---
title       : Networthify Shiny Application
subtitle    : Early Retirement Calculator
author      : MLovejoy, August 2016
job         : Coursera Data Science - Developing Data Products
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Retirement Calculators

Normal retirement calculators assume you will need 85% of your pre-retirement income once you retire. For example, if you earn $100,000, you will need $85,000 in retirement. But what if you only spend $40,000 per year while earning $100,000? Why would you suddenly need $85,000 once you retire?

The purpose of this Networthify Early Retirement Calculator is to make these calculations more realistic - your post-retirement expenses should be based on your pre-retirement expenses, not income. If your savings rate is fairly high, you simply won't need to work as many years before you'll have enough money saved for retirement - this won't be reflected in traditional retirement calculators.

For CNN's retirement calculator and their assumptions, see http://money.cnn.com/calculator/retirement/retirement-need/

--- .class #id 

## Early Retirement Calculator Assumptions

This retirement calculator, based on Networthify's calculator (https://networthify.com/calculator/earlyretirement), assumes you have a current portfolio that can gain value and annual income, a certain percentage of which you save and the rest you spend.

This calculator also assumes your current portfolio and all future earnings will gain 5% annually. The Safe Withdrawal Rate is defaulted to 4%, which is standard for retirement calculators based on the Trinity Study, but you can increase it or decrease it, based on your risk tolerance (higher is riskier).

--- .class #id 

## How to Use the Calculator

To use the early retirement calculator, simply enter your annual savings and annual expenses, and also your current portfolio value.

You can also adjust the safe withdrawal rate, but it is suggested to use the standard 4%.

Any changes you make to these inputs will automatically adjust the outputs, which are your savings rate and calculated number of years until you can retire.

Sample code to calculate the savings rate:


```r
savings_rate <- function(annual_savings, annual_expenses) 
        100*(annual_savings/(annual_savings + annual_expenses))

# Savings rate calculation test for $10,000 annual savings and $20,000 annual expenses
savings_rate(10000, 20000)
```

```
## [1] 33.33333
```

--- .class #id 

## Where to Use the Calculator

Link for the Networthify Early Retirement Calculator as hosted on shinyapps.io:

https://mlovejoy.shinyapps.io/networthifyApp/

Sample code to calculate the number of years until retirement:


```r
networthify <- function(annual_expenses, swr, annual_savings, roi, 
                        current_portfolio_value) 
        (log(annual_expenses/(swr/100) + annual_savings/roi) - 
        log(current_portfolio_value + annual_savings/roi))/log(1 + roi)

round(networthify(60000, 4, 60000, .05, 400000), 1)
```

```
## [1] 10.7
```
Check against Networthify: https://networthify.com/calculator/earlyretirement?income=120000&initialBalance=400000&expenses=60000&annualPct=5&withdrawalRate=4
