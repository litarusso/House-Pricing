# House-Pricing

## Overview of the Project

The aim of the project is to create a machine learning model that can predict the prices of the houses
in Ames City, Iowa, USA for the sellers, and create an interactive website for the users, where they can filter 
for multiple search criteria at the same time by entering all or some of the variables in the Dataset as an input.

## The Reasons of Choosing That Topic 

As many home owners look to sell their homes, they may wonder what factors determine 
what their home is worth. Using machine learning, and a determined set of variables, the algorithm will be able to pinpoint 
what key factors need to be taken into consideration to maximize the sale cost of their home.

Another reason to choose this topic is that this model can be adapted to any country and city in the 
world. Therefore, it is possible to realign and improve the model for future projects.


## Data Description

The original train.csv Dataset was retrieved from Kaggle website 
[https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/data?select=train.csv], and was composed 
of 81 columns and 1460 rows. In the first segment of the project, the Dataset was filtered for only useful fields and updated 
as 20 columns and 1236 rows as stated with their descriptions below:

- ID
- MS Zoning (Identifies the general zoning classification of the sale)
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

- HouseType: the list of types of houses, such as one storey house, two storey house, etc.
- GarageType: a list of types of garages, such as basement garage, detached-garage, etc.
- Neighbourhood: a list of neighborhoods in the City of Ames
- Lotshape: a list of lot shapes including regular, slightly irregular, moderately irregular, or regular
- Heating: a list of types of heating such as steam heat, gas heat, hot water heat, etc.
- HouseSaleHistory: a table includes house sales transactions in the City of Ames. This table only includes clean records which have been extracted from the original dataset.
- HouseSalePrediction: a table keep tracks all predictions made by the ML model when time allows us to do so.

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
- Geocoding 
	* Tableau
- Visualizing Database
	* ERD
- Creating Tables
	* PostgreSQL
- Training and Executing Machine Learning Model
	* AWS, Machine Learning
- Presentation of Data Visualization
	* HTML, Javascript, CSS
- Calling a Model
	* Flask

## Project Status

The team is working on the 2nd deliverable which is to clean dataset, visualize data, and build the model. 
Details of the project schedule can be found below:

<img width="639" alt="Screen Shot 2023-01-22 at 2 02 22 PM" src="https://user-images.githubusercontent.com/104400293/213945060-a1704d85-1a00-4f00-9f3b-68b6b00fb3dc.png">

The train dataset was cleaned and filtered for useful criteria,
and saved as csv and xlsx files. Then, based on the updated data, an ERD (Entity Relationship Diagram) and a script 
were created in PostgreSQL, and committed to GitHub. Then, the Readme file and PowerPoint presentation 
were created accordingly.

