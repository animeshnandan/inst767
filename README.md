**Project Overview**

This project is designed to develop predictive models and analytical resources by harnessing data on gas prices, crude oil prices, and the stock values of major oil and gas companies. The companies in focus include Chevron Corporation (CVX), Royal Dutch Shell (SHEL), ExxonMobil Corporation (XOM), and BP plc (BP). The project is structured into four distinct stages: data ingestion, transformation, storage, and analysis. Each stage plays a crucial role in turning raw data into insightful, actionable intelligence that helps in predicting market trends and formulating strategic advice.

**Data Sources**

The data for this project is retrieved from three main sources:
1.	Gas Prices: Daily gas price data.
2.	Crude Oil Prices: Daily crude oil price data.
3.	Stock Values: Daily stock prices of CVX, SHEL, XOM, and BP.

**System Architecture**

**Ingest**

The data ingestion process is handled via Python scripts using standard libraries to make API calls. These scripts are deployed on Google Cloud using Cloud Functions, every 30 minutes using Cloud Scheduler, with data being temporarily stored in Cloud Storage buckets in JSON format before transformation.

![cloud functions (1)](https://github.com/animeshnandan/inst767/assets/83339335/f29d7188-1939-4151-b431-55009a98aa5d)

![cloud scheduler for cloud functions](https://github.com/animeshnandan/inst767/assets/83339335/31b3adbb-406a-455b-9201-09a22d37db06)

![cloud storage buckets 1](https://github.com/animeshnandan/inst767/assets/83339335/96b6aecb-e100-4782-9972-79ac77daf836)

![cloud storage buckets 2](https://github.com/animeshnandan/inst767/assets/83339335/9636167e-cb4d-4dfb-8d2a-eb157c31f3fe)

![cloud stoarge buckets 3](https://github.com/animeshnandan/inst767/assets/83339335/5907945a-54e6-4971-85f9-f08158346861)

**Transformation**

Data transformation is conducted using PySpark on Google Cloud's DataProc service, where we have employed cloud scheduler and dataproc workflows which trigger the creation of a compute engine which runs the jobs for all 4 stocks along with crude oil and natural gas. This stage aligns the data from their sources into a unified data model that supports our analytical objectives. Transformations are scheduled to run in accordance with the data ingest timings.

![cloud storage bucket storing pyspark files](https://github.com/animeshnandan/inst767/assets/83339335/f2013552-97d4-4056-9753-7b655ed4f6ea)

![cloud scheduler triggering dataproc workflow](https://github.com/animeshnandan/inst767/assets/83339335/c169a110-92ff-42c9-85c1-6575e70080da)

![dataproc compute engine](https://github.com/animeshnandan/inst767/assets/83339335/8590f488-33c8-4ae5-8f05-3016668191c1)

![dataproc jobs](https://github.com/animeshnandan/inst767/assets/83339335/45c1ecf0-238f-4c95-969a-8162e5b00d7c)

**Storage**

The transformed data is stored in Google Cloud's BigQuery, which provides a robust platform for large-scale data analytics using SQL. We have created 2 separate datasets to store the data. ‘crudedataset’ contains tables storing the crude oil price and natural gas price. Whereas ‘stock_767’ stores the open, close, high, low & volume for the 4 stocks which we are dealing with. The schema has been defined for all the tables to ensure that the datatype is correct, so that queries run properly.

![bigquery bp stock schema](https://github.com/animeshnandan/inst767/assets/83339335/13794035-07bb-455d-a274-fd77fff1d966)

![bigquery chevron stock schema](https://github.com/animeshnandan/inst767/assets/83339335/3b4fe36f-3d60-4c58-bf7b-e72352840318)

![bigquery crude price preview](https://github.com/animeshnandan/inst767/assets/83339335/49ac4bfd-6bd4-43ea-a2ae-d17f4ba0a786)

![bigquery exxon stock preview](https://github.com/animeshnandan/inst767/assets/83339335/e25c7976-3f0d-4b19-ade3-4b0001bdb046)

![bigquery natural gas preview](https://github.com/animeshnandan/inst767/assets/83339335/5c6bcfeb-419f-49bc-8f35-87d702fac68a)

![bigquery shell stock preview](https://github.com/animeshnandan/inst767/assets/83339335/962e3cfb-3052-441c-8a42-c26759320122)

**Analysis**

While in-depth analysis is not the core focus of this project, the data model allows for basic queries that can answer specific questions related to the impact of oil prices on stock values and more. Example SQL queries are provided below to demonstrate this capability:

a.	Is there a correlation between crude oil prices and the stock prices of these companies?

![bigquery correlation](https://github.com/animeshnandan/inst767/assets/83339335/3e07a29c-5606-4be1-a9c3-5eb22876c953)

b.	Determine if there are consistent patterns of volume preceding or following price changes.

![consistent patterns of volume](https://github.com/animeshnandan/inst767/assets/83339335/0fde6653-a1d9-435c-a8ed-5154846f022d)

c.	Assess the liquidity of a stock by looking at the average volume. Higher volumes generally mean better liquidity, making it easier to execute trades without affecting the price too much.

![assessing the liquidity](https://github.com/animeshnandan/inst767/assets/83339335/56759692-6530-46d5-bb24-a72d21cbca26)
