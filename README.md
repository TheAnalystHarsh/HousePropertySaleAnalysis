# HousePropertySaleAnalysis by SQL

Context

A multivariate time series has more than one time-dependent variable. Each variable depends not only on its past values but also has some dependency on other variables.

We have accumulated property sales data for the 2007-2019 period for one specific region. The data contains sales prices for houses and units with 1,2,3,4,5 bedrooms. These are the cross-depended variables.

The data can be summarised as:

1)date of sale

2)price

3)property type: unit or house

4)number of bedrooms: 1,2,3,4,5 (these are the multi-variables we are targeting)

5)digit postcode 

Content

raw_sales.csv contains house sales data ranging from 2007-2019
malga12345.csv transforms the raw sales data, re-sampling it at quarterly intervals with median price aggregation and step 4 moving average smoothing

Inspiration

What model would you use to forecast 8 future quarters for each property type and # of bedrooms?
Would the traditional multi-variate forecasting models from the VARMAX family or multi-variate regression outperform LSTM, DLM, RNN networks for this problem?
