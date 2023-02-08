# House-Pricing

## Overview of the Project

The aim of the project is to create a machine learning model that can predict the prices of houses in Ames City, Iowa, USA. 
Tableau will use the machine learning model predicted values to display trends and results for the sellers, where the sellers can visualize how the predicted sale price can be affected by various variables.

## Why Was This Topic Choosen?

As many homeowners look to sell their homes, they may wonder what factors determine what their home is worth. Using machine learning, and a determined set of variables, the algorithm will be able to pinpoint what key factors need to be taken into consideration to maximize the sale of their home.
Another reason to choose this topic is that this model can be adapted to any country and city in the world. Therefore, it is possible to realign and improve the model for future projects.

## Data Description

The original train.csv Dataset was retrieved from Kaggle website 
[https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/data?select=train.csv], and was composed 
of 81 columns and 1460 rows. In the first segment of the project, the Dataset was filtered for only useful fields and updated 
as 18 columns and 1150 rows as stated with their descriptions below:

- Lot Area (Lot size in square feet)
- Lot Shape (General shape of property)
- Neighbourhood (Physical locations within Ames city limits)
- Building Type (Type of dwelling)
- Year Built (Original construction date)
- Year Remodeled (Same date as construction date if no remodeling or additions)
- Heating Type (Type of heating)
- Total House Square Feet (Total area of the house in square feet)
- Number of Full Bathrooms (Full bathrooms above grade)
- Number of Half Bathrooms (Half baths above grade)
- Number of Bedrooms above ground floor (Does NOT include basement bedrooms)
- Fireplaces (Yes/No)
- Garage Type (Garage location)
- Garage Cars (Size of garage in car capacity)
- Paved Drive (Paved driveway)
- Pool (Yes/No)
- Year Sold (YYYY-MM-DD)
- Sale Price

## Database

The database schema for the project has been defined and included the following 7 tables:

- HouseType: The list of types of houses, such as one storey house, two storey house, etc.
- GarageType: A list of types of garages, such as basement garage, detached-garage, etc.
- Neighbourhood: A list of neighborhoods in the City of Ames
- Lotshape: A list of lot shapes including regular, slightly irregular, moderately irregular, or regular
- Heating: A list of types of heating such as steam heat, gas heat, hot water heat, etc.
- HouseSaleHistory: A table includes house sales transactions in the City of Ames. This table only includes clean records which have been extracted from the original dataset.
- HouseSalePrediction: A table keep tracks all predictions made by the ML model when time allows us to do so.

The ERD has been created and can be found at the link below:
[https://github.com/litarusso/House-Pricing/blob/P_Le/ERD%20diagram.png]

The script to create all 7 tables and insert data to all 5 reference tables has been created. The script can be found at the link below:
[https://github.com/litarusso/House-Pricing/blob/P_Le/Create_Tables_Script.sql]

## Technologies Used in the Project

- Cleaning, Preparing and Exploring the Data
	* Jupyter Notebook
	* Pandas
	* Numpy
	* Matplotlib
- Visualizing Data 
	* Tableau
- Database Schema
	* ERD
- Database
	* PostgreSQL
- Training and Executing Machine Learning Model
	* Machine Learning
	* OneHotEncoder, RareLabelEncoder, RandomForestRegressor, joblib, MultipleLinearRegression
	
## Description of Data Exploration
The original dataset, as mentioned in the ‘Data Description’ consisted of 81 columns and 1460 rows. By the end of the data wrangling only 18 columns and 1150 rows remained. This section aims to provide the reasoning that led to various categories of data being removed, or transformed.

### Subjective

Various columns were given ratings for the state of a certain property of the house, either as a 1-10, or an ordinal rating from poor to excellent. As methodical the rating system may be, the actual category itself can be put up to debate depending on who one asks. An example from the original dataset is a column named ‘HeatingQC’ (Heating quality and condition) where it rates the quality of heating, and its condition, from poor to excellent. What was noted that people react differently to heat. For some what could be considered average, or typical, could be someone else’s excellent. For this reason, various other columns that were categorized as subjective were dropped from the dataset.

### Null Values

An inherent part of any dataset, whether large or small, is the eventuality of missing data - a null value, or a blank cell. This dataset was no different. Using the ‘df.isnull()’ function, columns with null values were identified and further looked into. Depending on the row, the purpose of the null value was inspected. For example, in the case of column ‘GarageType”, where 72 null values were found, it was noted that the null values did not mean that the dataset was missing information, but rather the null values represented the lack of a garage. Therefore, these values were converted to ‘NoGar’ to show that there is no garage. Another example would be column ‘FullBath’ where, for some reason, there are houses without full bathrooms. Rows with ‘0’, as their ‘FullBath’ value, were removed from the dataset.

### Data Transformation

Some of the columns had integer types of data to represent the corresponding part of the house, such as the square footage of the pool (PoolArea), or the number of fireplaces (Fireplaces). When the decision came to whether drop, or not, these columns. Ultimately, the team decided that it would be nice for one to look for these features, should they be available. Once it was determined the columns would stay in the dataset, it begged the question: How would they be represented? The answer came down to converting the numeric values to Booleans. If the ‘PoolArea’ was greater than zero, then the house has a pool. Otherwise, if the value was zero then the house has no pool. The same approach was taken with the ‘Fireplaces’ where if the count of fireplaces was 0, then there were no fireplaces, and if the value was greater than zero, the house does have at least one fireplace.

Another case of data transformation was the ‘MoSold’ and ‘YrSold’, as they were represented by two integer values. It became apparent that a data transformation was required when attempting to import the dataset when the DATE data format in PostreSQL required the ‘DateSold’ to be in YYYY-MM-DD, rather than YY. Two new columns were created: ‘DaySold’, which was given an arbitrary value of ‘01’, rather than ‘30’ or ‘31’, as not all months share these days. Secondly, ‘DateSold’, that utilized the RIGHT, MID, and LEFT functions in Microsoft Excel, and referenced the respective year, month and day, sold columns. Lastly, the ‘DateSold’ column was categorized as a ‘Date’ column within excel with a custom format that would meet the expectations of PostreSQL.
 
### Merging Information

Initially, the ‘Neighborhood’ names were shortened to facilitate reading, such as ‘BrkSide’ being ‘Brookside’. Using the ‘data_description.txt’ a table was created with the purpose of merging it with the dataset in order to drop the abbreviated neighborhood column and replacing it with a new column that has the full names.

## Analysis on the Machine Learning Model and Visualization

### Definitions:

Mean Absolute Error (MAE): Measures the difference between the predicted and true value. It is a useful metric, as it provides a sense of magnitude of errors in the predictions. A lower MAE value indicates a better fit between the predicted and true values, whereas a higher MAE value indicates a worse fit. It should be noted that the MAE is sensitive to outliers, so the distribution of data and presence of outliers should be taken into consideration when interpreting the MAE value.

Mean Squared Error (MSE): A measure of the average of the squared differences between the predicted and true values. Commonly used to evaluate the performance of a model. Just like the MEA, a low MSE indicates a better fit between the predicted and true values, and vice versa for a high MSE.

Root Mean Squared Error (RMSE): A measure of the differences between values (sample and population values) predicted by a model and the true values. RMSE follows the same rules as the MAE and MSE where a low RMSE value indicates a better fit between predicted and true values, and a higher RMSE indicates a worse fit.

R-Squared: Represents the proportion of the variance in the dependent variable that is predictable from the independent variables. Ranges from 0 to 1, where 0 means the model cannot explain any of the variability of the response data, and 1 means the model can explain the variability. A higher R-Squared value indicates a better fit between the predicted and true values, whereas a lower R-Squared indicates a worse fit.

### Introduction

The model starts off with loading the dependencies and model libraries. Then, it imports the ‘clean_data.csv’ and verifies the null value count is zero across all the columns. Afterwards, the dataset is split into training and testing sets and converts categorical values into numerical ones using the ‘OneHotEncoder’ library. When the dataset is split into training and testing, the count of elements is added to ensure they add up to the same number of elements in the clean dataset. The selected features for conversion from categorical to numeric are those with non-integer data types, such as “LotShape’, or ‘Neighborhood’. Subsequently, the RareLabelEncoder is then used to group features in a new category called “Rare”, so that it may prevent over-fitting. Over-fitting is when the model doesn’t generalize well from the training data to unseen data. This is why the dataset is split into the training and testing datasets. If the model does much better on the training set than on the test set, then the model is likely over-fitting. 

### Model 1: Random Forest
The Random Forest algorithm was used for the first model. The Random Forest algorithm combines ensemble methods and the decision tree framework to deliver randomly drawn decision trees to output a final result that provides strong predictions/classifications. In this case, two parameters were provided:
- n_estimators – The number of decision trees the model will be running
- random_state – Sets a seed to the random generator, so that the train-test splits are always prearranged.

![image](https://user-images.githubusercontent.com/110554264/216373838-cae6f6c7-4570-4836-9642-d5fe2438ceea.png)

From the image above we can note the following outputs:
- MEA: 21,241.974
- MSE (Mean Squared Error): 1,715,333,569.928
- RMSE (Root Mean Squared Error): 41,416.586
- R-Squared: 0.737

In this case, the results from this model were not terrible, but nor were they great. This can be determined the RMSE value of 41,416.586 falling in between the provided data range of 37,900 to 755,000. Furthermore, the R-Squared measured 0.737 which is a good starting point for the model to be able to explain the variability.

### Model 2: Multiple Linear regression (MLR)
The Linear Regression algorithm models a target prediction value based on independent variables. It is used for determining the relationship between variables and forecasting.

![MLR_model_results](https://user-images.githubusercontent.com/111096246/215362738-8b1d6368-42dd-44c5-a1fa-d2cf5340a2dc.PNG)

From the image above we can note the following outputs:
- MEA: 24,223.338
- MSE: 1,454,333,984.589
- RMSE: 38,135.731
- R-Squared: 0.777
The results from the Linear Regression model are similar, but not the same, as the Random Forest model. 

<img width="900" alt="Screen Shot 2023-02-01 at 11 07 58 AM" src="https://user-images.githubusercontent.com/111788394/216098085-c1c2e7b7-5b48-40dc-9a1c-90cd246f8602.png">

After comparing both models the following can be observed: 
- Both the MSE and RMSE were lower in the Linear Regression model than the Random Forest model. Making the Linear Regression model more suitable for predicting the house sale values.
- The MAE was lower in the Random Forest model than the Linear Regression hence making the Random Forest model more suitable for predicting the house sale values.
- The R-Squared was higher in the Linear Regression model than the Random Forest model. Therefore, the Linear Regression model is more suitable for predicting the house sale values.
- In conclusion, out of the four different scores, three sided with the Linear Regression model being the most apt model to use for further work.

### Determine and Suggest Top 10 Most Important Features
The ‘enumerate’ function was used to determine the importance “value” of all the categories, where the results were placed into a dataframe and ordered by level of importance. The top 10 most important features can be found in the image below:

![top_ten_features](https://user-images.githubusercontent.com/111096246/215362764-3832c90e-2344-4cae-96b5-7c99a4246a90.PNG)

Where the rank goes as follows:
1. Total House Square Feet
2. Year Built
3. Year Remodelled 
4. Number of Cars That Fit In Garage
5. Lot Area
6. Month Sold
7. Number of Full Bathrooms
8. Number of Bedrooms Above Ground Level
9. Year Sold
10. Whether the house has a Fireplace

### Refine Models using the suggested top 10 most important features:
The 2 other Random Forest and Multiple Linear Regression models were built and trained using only the top 10 most important features instead of 18 features from the model 1 and model 2 above. And below is the performance comparison of these 4 models:
![image](https://user-images.githubusercontent.com/110554264/216366651-5f8baaf6-069c-481c-a8a5-21c6d8875ad8.png)

From the bar chart above, which visualizes the results from both models being applied to both the 18 variables, and the top ten variables. The following can be concluded based on what is known regarding the relationships that MEA, MSE, RMSE, and R-Squared have with the results.

- The lower MAE means a better fit for the model, so between the models running the 18 variables, the linear regression model is the one with the best fit. Furthermore, between the models working with the top ten features, the random forest model has a better fit.

- The relationship with the MSE is the same as the MAE. The lower the score the better. In the case of the 18 variable models, the linear regression has a better fit. For the models running the top ten variables the random forest model has a better fit.

- Based on the results for the RMSE, the model which has a better fit, for 18 variables, is the linear regression model, and the model most appropriate for running the top ten features is the random forest.
- Last, but not least, based on the results of the R-Squared test, where a higher score determines the better fit, it can be noted that the random forest model works best for the 18 variables. However, for the models running the top ten features the linear regression model is more appropriate.

- In conclusion: For running the model with the original 18 variables submitted, it is recommended to use the linear regression model, as it outperformed the random forest model in three out of four tests, with an accuracy score of 77%. On the other hand, for the model running the top ten variables, it is recommended to use the linear regression model, as it outperformed the random forest model in three out of four tests. 

To summarize, the linear regression model is the most appropriate model to utilize, regardless of the number of variables provided.

### Visualization of Predicted Values Vs. Actual Values

In the image below, the graph on the left visualizes the predicted results from the MLR model, and the graph on the right indicates the Random Forest model. Actual values are symbolized by red circles, and predicted values by blue circles. As noted in the model results, the predicted values do not match the actual values all that well, but one thing that can be noted is how the MLR predictions are slightly closer than the RF predictions. Here one can also notice the presence of two potential outliers.

![model_comparison](https://user-images.githubusercontent.com/111096246/215362778-e14b992d-eaa7-40f3-a9f0-3884d4cfdbdb.PNG)

Furthermore, with the results of each model stacked on top of the actual values in this line graph, one has to keep an eye out for where the orange line (Predicted_MLR) comes close to matching the blue line (Actual price), in order to verify that the MLR model is, indeed, the more appropriate model to predict house sale values.

![model_accuracy](https://user-images.githubusercontent.com/111096246/215362780-8321c2b5-1b68-487c-8598-639c6c4057db.PNG)

### Results of the Analysis

Three questions were proposed at the beginning:
1. Which is the best time of the year to sell a home?
2. Which neighborhood has the highest selling prices?
3. Does the age of the house affect the sale price?

To answer these questions, two separate datasets were used to aid in visualizing the answers to the aforementioned questions. The first dataset consisted of the “clean” data, with the actual prices, and the second dataset consisted of the values obtained from the machine learning model’s output. 

![Best Time of the Year to Sell](https://user-images.githubusercontent.com/111096246/217127448-69431d03-7ec4-4184-8641-324d52a5ede0.PNG)

By taking note of the first image, hosting the clean data, one can observe how there are consistent peaks during summer time every year. It can concluded that the months of June and July are most popular for house selling, except in 2010 when May had more sales. 

![Best Time of the Year to Sell](https://user-images.githubusercontent.com/111096246/217127538-0955c115-2526-4588-b626-cc887c474031.PNG)

The second image, which presents the predicted values data, one has to inspect how dense the lines are for each month. The denser the line, the more sales are conducted in that month. As can be observed from the second image, May through to July are the densest of lines out of all the months.

By comparing the results from both sets of graphs, it can concluded that the predicted values matched those of the actual dataset and painted the same image together. Although we now know when is the best time to sell, another key component to selling a house is figuring out where to sell.

![Higher Selling Prices per Neighborhood](https://user-images.githubusercontent.com/111096246/217127593-0379044a-6820-4d61-b0a5-38964b173880.PNG)

The first image, with the clean dataset,  one has to note which of the neighborhoods, essentially, reaches the highest point. This can lead to pointing out that Northridge is the neighborhood with the highest selling homes. Northridge Heights is the second highest selling neighborhood, and one observation to make is how much more populated the Northridge Heights neighborhood is for selling homes.

![Higher Selling Prices per Neighborhood](https://user-images.githubusercontent.com/111096246/217127611-5bf89a01-47ae-49ed-ad52-23a96d8bedee.PNG)

The Second image, with the predicted values, tells a different story. Disregarding the outlier in Edwards, Northridge Heights is actually the neighborhood with the highest selling homes. Many other neighborhoods have predicted sale prices similar to those of Northridge Heights, yet do not reach the maximum sale prices that Northridge Heights was able to obtain.

Although both graphs do not agree on which is the neighborhood with the highest selling price, they both do nod at Northridge Heights as being an up and coming neighborhood with future development leading to success. After figuring out when and where are the best times, and places, to sell a home, another pivotal question remains: How does the age of the house affect the final sale price?

![Year_Built_Sale_price](https://user-images.githubusercontent.com/111096246/217127662-aa622c36-b89c-4604-923c-4867f0d160c3.PNG)

The clean data graph shows an upward trend of prices as the years go on. In other words, the younger the house is, the higher the sale price. This is a straightforward graph that does not need further inspecting.

![Year_Built_Sale_price](https://user-images.githubusercontent.com/111096246/217127681-4fc142d8-9041-4f67-a871-c54170bafb49.PNG)

The graph with the predicted values shows the same thing as the actual data. Although the trend line shares the same direction, the trend line is ever so slightly steeper than the clean data’s trend line. This signifies that the price hike, eventually, will be much more noticeable in the predicted data’s graph than the clean data’s.

In conclusion, it has been identified that the best time of the year to sell a home in Ames City, USA, is during June and July. The best neighborhood was not identified, as both graphs pointed to two different neighborhoods. One designated Northridge as the highest selling neighborhood, yet the other graph favored with Northridge Heights. It may be disheartening that the two graphs did not agree with one another, yet the clean data’s graph showed that Northridge Heights had a higher number of sales, indicating further growth in the area. Lastly, it has been identified that the age of the house does have a relationship with the sale price of a home. The younger the house is, or the newer the build, the higher the sale price.

## Tableau Interactive Dashboard

Part of the project was to create an interactive element with the aid of Tableau. Using the predicted values generated by the machine learning model, the data was able to be visualized in order to aid the user to inspect the predicted house prices based on whatever filters the user may, or may not, have entered. The graph will update in real time to whatever queries the user enters, and display what house sales match the selected criteria. Below is a link to the dashboard for you, the reader’s, convenience.

Link to dashboard: https://public.tableau.com/app/profile/tim1971/viz/Final_Dashbaord/Dashboard1?publish=yes

## Project Status

### Segment One - ‘Sketch It Out’

Up to now the team has divided and conquered various elements of the project to get it going. Segment One, ‘Sketch It Out’, consisted of the following tasks:
- Creating the GitHub repository and all the necessary branches
- Creating an ERD (Entity Relationship Diagram)
- Creating a mock-up of the database in pgAdmin4 using an SQL script.
- Listed the list of technologies to be used and required at first, and continuously update as the project evolves.
- Updating the README.md with updates from work completed and breakdowns of the overview, purpose of the project, data description, database, and the list of technologies, as mentioned above.
- Creating the presentation that will summarize the project.

![image](https://user-images.githubusercontent.com/110554264/216375544-233a4cf8-9a9e-4ca4-ab5f-012af76d6033.png)


All the required deliverables were completed and submitted on time.

### Segment Two - ‘Build and Assemble’

For the second deliverable the requirements change from the administrative side of the project to the data wrangling, programming, and visualization side of things. Segment Two, ‘Build and Assemble’ consists of the following tasks:
- Cleaning the data and uploading to GitHub.
- Creating an ERD (Entity Relationship Diagram)
- Creating the database using the SQL script from Segment One.
- Visualize the data – Tell a story. This is done within Tableau in order to generate data visualizations that may reveal trends that may not be apparent until seen in graph form. These visualizations will be used in the presentation in order to complement points and ideas.
- Build two or three models, and refine the analysis. Two models have been created thus far, one being a Random Forest model and the other is a Multiple Linear Regression. Further information can be found in the ‘Analysis on the Machine Learning Model and Visualization’ section.
- Updating the README.md with updates from work completed and breakdowns of the data exploration and analysis on model & visualization.
- Generate a draft version of the HTML page.

![segment2](https://user-images.githubusercontent.com/111096246/217127238-7156ba07-d50f-4c34-87ac-a8465e7d2bff.PNG)

### Segment Three – ‘Put It All Together’

For the third deliverable the work done so far culminates with the results and the proceeding analysis. Segment Three, ‘Put It All Together’ consists of the following tasks:
- Running Test Data in Model
- Build Visualization From the Model’s Output
- Verify Database Creation
- Updating the README.md
- Conducting Self Assessments
- Presenting the Project

![segment3](https://user-images.githubusercontent.com/111096246/217127338-0ce2147f-4624-4381-99f5-2a760c11dafa.PNG)
