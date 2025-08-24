/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================

CREATE VIEW gold.dim_product AS
	SELECT
		ROW_NUMBER () OVER (ORDER BY pi.prd_start_dt, pi.prd_key) AS product_key,
		pi.prd_id AS product_id,
		pi.prd_key AS product_number,
		pi.prd_nm AS product_name,
		pi.cat_id AS catergory_id,
		cat.CAT AS Category,
		cat.SUBCAT AS subcatergory,
		cat.MAINTENANCE AS maintenance,	
		pi.prd_cost AS cost,
		pi.prd_line AS product_line,
		pi.prd_start_dt AS start_date
	FROM [silver].[crm_prd_info] pi
	LEFT JOIN [silver].[erp_PX_CAT_G1V2] cat
	ON pi.cat_id = cat.ID
	WHERE prd_end_dt IS NULL -- Filter out all historical data

  
-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================

 CREATE VIEW gold.dim_customers AS
	SELECT
		ROW_NUMBER () OVER ( ORDER BY cst_id) AS customer_key,
		ci.cst_id AS customer_id,
		ci.cst_key AS customer_number,
		ci.cst_firstname AS first_name,
		ci.cst_lastname AS last_name,
		ci.cst_marital_status AS marital_status,
		CASE WHEN ci.cst_gndr != 'N/A' THEN ci.cst_gndr -- CRM is the Master for the gender info
		ELSE COALESCE(az.GEN, 'N/A')
		END AS gender,
		az.BDATE AS birthdate,
		loc.CNTRY AS country,
		ci.cst_create_date AS create_date
	FROM [silver].[crm_cust_info] ci
	LEFT JOIN [silver].[erp_CUST_AZ12] az
	ON		ci.cst_key = az.CID 
	LEFT JOIN [silver].[erp_LOC_A101] loc
	ON		ci.cst_key = loc.CID 

-- =============================================================================
-- Create Fact Table: gold.fact_sales
-- =============================================================================

CREATE VIEW gold.Fact_Sales	AS
	SELECT 
		sls.sls_ord_num AS order_number,
		pd.product_key,
		cs.customer_key,
		sls.sls_order_dt AS order_date,
		sls.sls_ship_dt AS shipping_date,
		sls.sls_due_dt AS due_date,
		sls.sls_sales AS sales_amount,
		sls.sls_quantity AS quantity,
		sls.sls_price AS price
	FROM [silver].[crm_sales_details] sls
	LEFT JOIN gold.dim_product pd
	ON sls.sls_prd_key = pd.product_number
	LEFT JOIN gold.dim_customers cs
	ON sls.sls_cust_id = cs.customer_id
