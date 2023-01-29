# House-Pricing

## Overview of the Project

The aim of the project is to create a machine learning model that can predict the prices of houses in Ames City, Iowa, USA. 
An interactive website for the sellers will be created, where they can simultaneously filter for multiple search criteria by entering all, 
or some of the variables in the dataset as an input.

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
	* AWS, Machine Learning
- Presentation of Data Visualization
	* HTML, Javascript, CSS
- Calling a Model
	* Flask

## Analysis on the Machine Learning Model and Visualization

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


## Project Status

### Segment One, ‘Sketch It Out’

Up to now the team has divided and conquered various elements of the project to get it going. Segment One, ‘Sketch It Out’, consisted of the following tasks:
- Creating the GitHub repository and all the necessary branches
- Creating an ERD (Entity Relationship Diagram)
- Creating a mock-up of the database in pgAdmin4 using an SQL script.
- Listed the list of technologies to be used and required at first, and continuously update as the project evolves.
- Updating the README.md with updates from work completed and breakdowns of the overview, purpose of the project, data description, database, and the list of technologies, as mentioned above.
- Creating the presentation that will summarize the project.

<img width="639" alt="Screen Shot 2023-01-22 at 2 02 22 PM" src="https://user-images.githubusercontent.com/104400293/213945060-a1704d85-1a00-4f00-9f3b-68b6b00fb3dc.png">
All the required deliverables were completed and submitted on time.

### Segment Two, ‘Build and Assemble’

For the second deliverable the requirements change from the administrative side of the project to the data wrangling, programming, and visualization side of things. Segment Two, ‘Build and Assemble’ consists of the following tasks:
- Cleaning the data and uploading to GitHub.
- Creating an ERD (Entity Relationship Diagram)
- Creating the database using the SQL script from Segment One.
- Visualize the data – Tell a story. This is done within Tableau in order to generate data visualizations that may reveal trends that may not be apparent until seen in graph form. These visualizations will be used in the presentation in order to complement points and ideas.
- Build two or three models, and refine the analysis. Two models have been created thus far, one being a Random Forest model and the other is a Multiple Linear Regression. Further information can be found in the ‘Analysis on the Machine Learning Model and Visualization’ section.
- Updating the README.md with updates from work completed and breakdowns of the data exploration and analysis on model & visualization.
- Generate a draft version of the HTML page.

![segment_two](https://user-images.githubusercontent.com/111096246/215358724-13aaa75e-1bc8-4fec-979f-cde5aada12dd.PNG)
Work is still underway to meet the requirements for Segment Two. This page will be updated once the second set of deliverables have been submitted.
