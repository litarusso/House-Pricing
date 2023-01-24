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

## Project Status

The team is working on the 2nd deliverable which is to clean dataset, visualize data, and build the model. 
Details of the project schedule can be found below:

<img width="639" alt="Screen Shot 2023-01-22 at 2 02 22 PM" src="https://user-images.githubusercontent.com/104400293/213945060-a1704d85-1a00-4f00-9f3b-68b6b00fb3dc.png">

The train dataset was cleaned and filtered for useful criteria,
and saved as csv and xlsx files. Then, based on the updated data, an ERD (Entity Relationship Diagram) and a script 
were created in PostgreSQL, and committed to GitHub. Then, the Readme file and PowerPoint presentation 
were created accordingly.

