The dataset we will be using is the **College Scorecard Data** collected by the U.S. Department of Education. 
The data can be accessed at the following URL: [https://collegescorecard.ed.gov/data/](https://collegescorecard.ed.gov/data/). As defined in the [Data Documentation](https://collegescorecard.ed.gov/assets/FullDataDocumentation.pdf), 
> “This project provides data to help students and families compare college costs and outcomes as they weigh the tradeoffs of different colleges, accounting for their own needs and educational goals.” 

The target audience we will be focusing on is high school upperclassmen and their families who are preparing for and exploring college options.

The questions we will be asking and answering are:
1. Which schools give you the highest post-college average earnings for a given range of average cost of attendance for the most up to date year? (i.e. could answer which colleges offer the best bang for your buck financially?)
2. What colleges have the highest post-college average earnings depending on Public, Private Nonprofit, and Private For-Profit colleges?
3. What colleges have the best repayment rate (for 1, 3, 5, and 7 years) based on family income?
4. Which schools have the greatest cumulative median debt disaggregated by student subgroups?

Looking towards the technical aspects necessary to complete this project we will be formatting the final product as a Shiny App and will be working with the data via CSV files. The types of data manipulation that will be necessary to better work with the data are to filter out any NULL values before performing analysis and plotting. Additionally, we will have to filter out any columns that don’t relate to the specific questions we will be asking, which in this case will be data relating to college completion, types of academics available at each institution, and admission statistics. The major libraries we will be using in this project are those we’ve learned about in class. We will not be answering any questions with statistical analysis/machine learning. Finally, one potential challenge we anticipate will be working with a large dataset and how well a server will be able to handle such a dataset.
