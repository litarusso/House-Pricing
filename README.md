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
(https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/data?select=train.csv), and was composed 
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

In the first stage of the project, the tasks of the project were planned and shared among the team members as shown below:

<img width="639" alt="Screen Shot 2023-01-22 at 2 02 22 PM" src="https://user-images.githubusercontent.com/104400293/213935337-f9b0f7ac-cefd-4865-a646-c5ddb3d6e8aa.png">

The train dataset was cleaned and filtered for useful criteria,
and saved as csv and xlsx files. Then, based on the updated data, an ERD (Entity Relationship Diagram) and a script 
were created in PostgreSQL, and committed to GitHub. Then, the Readme file and PowerPoint presentation 
were created accordingly.
