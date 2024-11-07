-- Data Cleaning with SQL

-- "C:\Users\azung\Downloads\Finance_data.csv"

SELECT * 
FROM finance.finance_data;

-- Create a staging table to work on and clean the data
CREATE TABLE finance.finance_data_staging 
LIKE finance.finance_data;

-- Insert the original data into the staging table
INSERT INTO finance.finance_data_staging 
SELECT * FROM finance.finance_data;

-- Identify duplicates by adding a row number based on all columns
SELECT *,
    ROW_NUMBER() OVER (
        PARTITION BY gender, age, investment_avenues, mutual_funds, equity_market, debentures, 
                     government_bonds, fixed_deposits, ppf, gold, stock_marktet, factor, 
                     objective, purpose, duration, invest_monitor, expect, avenue, 
                     savings_objectives, reason_equity, reason_mutual, reason_bonds, 
                     reason_fd, source
    ) AS row_num
FROM finance.finance_data_staging;

-- Delete duplicates where the row number is greater than 1
WITH duplicates_cte AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY gender, age, investment_avenues, mutual_funds, equity_market, debentures, 
                         government_bonds, fixed_deposits, ppf, gold, stock_marktet, factor, 
                         objective, purpose, duration, invest_monitor, expect, avenue, 
                         savings_objectives, reason_equity, reason_mutual, reason_bonds, 
                         reason_fd, source
        ) AS row_num
    FROM finance.finance_data_staging
)
DELETE FROM finance.finance_data_staging
WHERE row_num > 1;

-- Convert 'investment_avenues' to uppercase for consistency
UPDATE finance.finance_data_staging
SET investment_avenues = UPPER(investment_avenues);

-- Standardize 'gender' to uppercase if needed
UPDATE finance.finance_data_staging
SET gender = UPPER(gender);

-- Set empty 'factor' values to NULL
UPDATE finance.finance_data_staging
SET factor = NULL
WHERE factor = '';

-- Populate missing data using a JOIN if possible
UPDATE finance.finance_data_staging t1
JOIN finance.finance_data_staging t2
ON t1.gender = t2.gender
SET t1.factor = t2.factor
WHERE t1.factor IS NULL
AND t2.factor IS NOT NULL;

-- Delete rows where essential fields like 'age' are NULL
DELETE FROM finance.finance_data_staging
WHERE age IS NULL;

-- Drop columns that are not needed for analysis, if any
ALTER TABLE finance.finance_data_staging
DROP COLUMN stock_marktet; 

-- Rename the original table for backup purposes
RENAME TABLE finance.finance_data TO finance.finance_data_backup, 
             finance.finance_data_staging TO finance.finance_data;
             
             












