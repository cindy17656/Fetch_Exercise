First task: Review Existing Unstructured Data and Diagram a New Structured Relational Data Model

  a) receipt_items table comes from 'rewardsReceiptItemList' in receipts.json 
  
  b) From my understanding, each brand could have multiple products, and barcode is the unique identifier for each product. Therefore, it would make more sense to change the name from brands to products with barcode as the primary key of the table
  
  c) In the future, if necessary, depending on how often we use brand info, we can reduce the data redundancy by changing products to contain only two columns (barcode, brand_id)
    and create a new table named brands with columns (brand_id/name/brandCode/category.....) and link the two tables with brand_id


Second: Write a query that directly answers a predetermined question from a business stakeholder

  a) I used Python to do preprocessing of the data. please see the code in 2.Data_Preprocessing.ipynb; for the output table, please see receipts.csv/products.csv/users.csv/receipt_items.csv
  
  b) Then I created tables using pgAdmin4 and imported the CSV file to the Postgres database. please see the code in 2.Table_Created&import_code.sql
  
  c) I chose to answer the first and second bullet point questions which are What are the top 5 brands by receipts scanned for a most recent month? and How does the ranking of the top 5 brands by receipts scanned for the recent month compare to the ranking for the previous month?
  
  d) please see my SQL code and output in 2.top_5_brand_code.sql; 2.top_5_brand_output_data.csv / 
  2.2previous_month_comparison.sql; 2.2 previou_comparison_output.csv

  e) for 2.2 output, because the receipt data, which includes brand information after joining, is only available from January 2021, we lack data for the preceding months, resulting in null outputs for those periods.
  

Third: Evaluate Data Quality Issues in the Data Provided

  a) Please see the detailed data quality issue I identified in 3.Communication Email for Data Quality Issue.pdf
  
  b) The SQL code and the sample of the data that have quality issues can be found in 3.Barcode_Quality_Issue_code.sql; 3.Barcode_Quality_Issue_Data.csv

