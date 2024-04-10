# fracking-research
Home for data, code, and other information related to my DA senior capstone project.

# Introduction

## description:
This project aims to investigate regional similarities between between characteristics of natural gas fracking wells in the United States. Data was acquired from FracFocus.org.

## author: Phoebe Martin
### affiliation: Denison University Class of 2024
### contact: martin_p1@denison.edu

# Purpose
This is a descriptive analysis project to uncover any patterns in characteristics of wells that have disclosed to the FracFocus database.

# Data
- <b>FracFocus Disclosures Registry</b>: 
Each row in this dataset contains information about a single chemical used in the hydraulic fracturing fluid at a given well. This data set is not included in this repository due to its very large size.
	Key variables:
	- DisclosureId (original): the unique identifier number 
	- jobYear (derived): the year in which the job being disclosed about took place
	- APINumber (original): the unique identifier associated with each well
	- state (original): state in which well is located
	- county (original): county in which well is located
	- op (original): company that operates well
	- WellName (original): name of well
	- Latitude (original): location of well
	- Longitude (original): location of well
	- depth (original): depth of well
	- waterVol (original): volume in gallons of water used to create job's carrier fluid
	- nonWaterVol (original): volume in gallons of nonwater additives (chemicals, media, etc.) used to create job's carrier fluid
	- CASNumber (original): identification number of chemical ingredient used in nonwater additive 
	- Purpose (original): reported purpose of ingredient in fluid additive mixture
	- PercentHFJob (original): percentage (by mass) of ingredient in fluid additive mixture
	- MassIngredient (original): mass in pounds of ingredient used in job
	- region (derived): division of United States in which well is located, based on divisions defined by the U.S. Census Bureau. Derived from state column
	- purpCat (derived): major category of additive purpose, derived manually from purpose column according to researcher's discretion.
- <b>Purpose Categorization Reference Tool (purpp.csv)</b>
	- current: unique values in Purpose column, lowercased and with whitespace removed
	- replaceWith: category of additive purpose, used to create purpCat column in registry data set.

# Code
Files are available in code folder in this repository. Files are separated by task.
- data_processing.ipynb
	This is a Jupyter Notebook wherein I concatenated all 14 FracFocus registry csv files. I then selected only the columns which were relevant to my analysis and exported the trimmed table as a csv.
- water_tidying.ipynb
	This is a Jupyter Notebook wherein I tidied the data in waterSource.csv to be more readily analyzed and synthesized with other datasets.
- registry_analysis.ipynb
	- This is the Jupyter Notebook file where I conducted all my data exploration and analysis.
- visualizations.R
	- This is the R file where I made the majority of my visualizations including all the visualizations featured in the final paper.

# Software:
Software used for analysis:
- Python 3.0
- VSCode for coding, analysis, visualization
Packages required to run code:
- Python: pandas, numpy, matplotlib, scipy, pandasql, statsmodels
- R: ggplot2, tidyr, scales

# Workflow
1. Open GitHub desktop.
2. Pull once at beginning of work session.
3. Commit (at least once per session).
4. At the end of work session, push ALL commits from local to main.