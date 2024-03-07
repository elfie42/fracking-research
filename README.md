# fracking-research
Home for data, code, and other information related to my DA senior capstone project.

# Introduction

## description:
This project aims to investigate commonalities between characteristics of natural gas fracking wells in the United States. Data was acquired from FracFocus.org.

## author: Phoebe Martin
### affiliation: Denison University Class of 2024
### contact: martin_p1@denison.edu

# Purpose
This is a descriptive analysis project to uncover any patterns in characteristics of wells that have disclosed to the FracFocus database.

# Data
This project uses data from a few different sources:
- <b>FracFocus Disclosures Registry</b>
Each row in this dataset contains information about a single chemical used in the hydraulic fracturing fluid at a given well. Because of this, single wells in a single year may have more than one row associated with it.
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

# Code
Files are available in code folder in this repository. Files are separated by task. (WIP) at the end of the file name indicates that the task addressed in that file is still in progress.
- data_processing.ipynb (WIP)
	This is a Jupyter Notebook wherein I concatenated all 14 FracFocus registry csv files. I then selected only the columns which were relevant to my analysis and exported the trimmed table as a csv.
- water_tidying.ipynb (WIP)
	This is a Jupyter Notebook wherein I tidied the data in waterSource.csv to be more readily analyzed and synthesized with other datasets.

# Software:
Software used for analysis:
- Python 3.0
- Jupyter Lab for coding, analysis, visualization
Packages required to run code:
- pandas, numpy, scikit-learn, seaborn, matplotlib

# Workflow
1. Open GitHub desktop.
2. Pull once at beginning of work session.
3. Commit (at least once per session).
4. At the end of work session, push ALL commits from local to main.