/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the 'silver' layer. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ====================================================================
-- Checking 'silver.crm_cust_info'
-- ====================================================================
-- Check for Nulls or Duplicates in Primary Key
-- Expectation: No Result

SELECT	cst_id,
		COUNT(*) AS 'Count'
FROM [DataWarehouse].[bronze].[crm_cust_info]
GROUP BY cst_id
HAVING COUNT(*) >1 
OR cst_id IS NULL

-- Check for Unwanted Spaces
-- Expectation: No Results
