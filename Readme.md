##### ******** Dashboard Link ********
https://www.novypro.com/project/revenue-insights-dashboard-2

### About Dataset :
This project analyzes a hotel revenue dataset containing 134,591 rows of data. The dataset includes key attributes such as hotel name, booking date, and booking status. The aim of this analysis is to gain insights into hotel revenue trends and booking patterns.

### Objective :
The primary objective of this project is to build end-to-end data solution by an ETL (Extract, Transform, Load) pipeline using AWS services. The key steps include:
#### Flowchart :

<p align="center"><img src='https://i.postimg.cc/qM7M4Kg2/Flowchart.png'><p align="center">

##### Extract:
- From the local storage the hotel revenue dataset with 134,591 rows of data(e.g., CSV file, database) is stored using AWS S3.
##### Transform:
- Process and transform the raw data is done in AWS Athena to derive meaningful insights.
- Apply necessary data cleaning, aggregation, and enrichment steps.Prepare the data for analysis and visualization.

<p align="center"><img src='https://i.postimg.cc/N0v3fyQg/Athena-Transform.png'><p align="center">

##### Load:
- Store the transformed data in a data warehouse on AWS Redshift for efficient storage and retrieval.

<p align="center"><img src='https://i.postimg.cc/sgjnnpfG/Redshift-Analytics.png'><p align="center">

##### Connect to Power BI:
- Establish a connection between the data warehouse and Power BI for seamless data visualization.
- Leverage Power BI's capabilities to create interactive and insightful visualizations based on the hotel revenue dataset.


### Data Modelling:

<p align="center"><img src='https://i.postimg.cc/LscrF5HP/Data-model.png'><p align="center">

### Dashboard:

<p align="center"><img src='https://i.postimg.cc/W4K8wQLn/HD.png'><p align="center">  
