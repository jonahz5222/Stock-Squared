# Stock<sup>2</sup>

## The Issue
Stock profiles have a lot of information, and it's easy to look at individual stock profiles and determine their growth rate. But what if you want to watch large numbers of stocks at once? It can be hard to digest large quantities of information when it isn't presented in an intelligent, user-first manner.

## The Solution
Enter Stock<sup>2</sup>, an iOS application for investors on the go who need information in large quantities without compromising on quality and readability. The screen is divided into 12 economic sectors encompassing a wide variety of stocks being traded. These sectors are: 
* Energy
* Materials
* Industrials
* Consumer Goods
* Health Care
* Financials
* Technology
* Telecommunication Services
* Utilities
* Real Estate
* Consumer Services
* Media

Users can select a sector on the screen to get a close up view of what investments it has to offer. Each sector presents 12 stocks to the user that represent the highest value, highest grossing investments. Our design hopes to strike a balance between not overwhelming the user and providing them with a wide berth of knowledge. Each stock is color coded to represent its growth (or lack there of). Shades of red represent a decline in value, while increasingly bright shades of green represent growth. Further, users can select individual stocks to see a graph of the stock's history and more detailed information.

## The How
Using the Investor's Exchange (IEX) API, we are able to source a selection of stocks that encompasses the state of a market sector. We then utilize a ranking algorithm to determine which of the many stocks we should actually present to users. Those that show the most growth earn a top spot in each sector.

## The Why
Stock Squared leverages unique design principles to enhance financial literacy and simplify new stock discovery. We want to illustrate that no stock exists in a vacuum and help put financial data in the hands of consumers in an easy to understand fashion. The everyday person struggles to know where to start with investment, and by simplifying the process we hope to ease the journey.
