/* PROJECT DESCRIPTION
This project wants to understand how people of different ages, genders, and financial goals invest their money, that is to analyze individual investment behaviors and preferences
We'll use data about what people like to invest in (like stocks, bonds, and savings accounts) to find out if there are any patterns. 
This information can help financial advisors and companies create better investment products.
*/

-- Descriptive Statistics
SELECT 
    COUNT(*) AS total_records,
    AVG(age) AS avg_age,
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    AVG(mutual_funds) AS avg_mutual_funds,
    AVG(equity_market) AS avg_equity_market,
    AVG(debentures) AS avg_debentures,
    AVG(government_bonds) AS avg_government_bonds,
    AVG(fixed_deposits) AS avg_fixed_deposits,
    AVG(ppf) AS avg_ppf,
    AVG(gold) AS avg_gold
FROM finance.finance_data_staging;

-- Demographic Analysis 
-- Distribution of investors by gender
SELECT gender, COUNT(*) AS num_investors
FROM finance.finance_data_staging
GROUP BY gender;

-- Age distribution
SELECT age, COUNT(*) AS num_investors
FROM finance.finance_data_staging
GROUP BY age
ORDER BY age;

-- Investment Preferences
-- Popular investment avenues
SELECT investment_avenues, COUNT(*) AS num_investors
FROM finance.finance_data_staging
WHERE investment_avenues = 'YES'
GROUP BY investment_avenues
ORDER BY num_investors DESC;

-- Average investment levels across different products
SELECT 
    AVG(mutual_funds) AS avg_mutual_funds, 
    AVG(equity_market) AS avg_equity_market, 
    AVG(debentures) AS avg_debentures,
    AVG(government_bonds) AS avg_government_bonds,
    AVG(fixed_deposits) AS avg_fixed_deposits,
    AVG(ppf) AS avg_ppf,
    AVG(gold) AS avg_gold
FROM finance.finance_data_staging;

-- Analyzing Risk and Returns
-- Return expectations by investment duration
SELECT duration, expect, COUNT(*) AS num_investors
FROM finance.finance_data_staging
GROUP BY duration, expect
ORDER BY num_investors DESC;

-- Frequency of investment monitoring vs. return expectations
SELECT invest_monitor, expect, COUNT(*) AS num_investors
FROM finance.finance_data_staging
GROUP BY invest_monitor, expect
ORDER BY num_investors DESC;

-- Savings Objectives and Investment Reasons
-- Distribution of savings objectives
SELECT `What are your savings objectives?` AS savings_objectives, COUNT(*) AS num_investors
FROM finance.finance_data_staging
GROUP BY `What are your savings objectives?`
ORDER BY num_investors DESC;

-- Reasons for investing in equity
SELECT reason_equity, COUNT(*) AS num_equity_investors
FROM finance.finance_data_staging
GROUP BY reason_equity
ORDER BY num_equity_investors DESC;

-- Reasons for investing in bonds
SELECT reason_bonds, COUNT(*) AS num_bond_investors
FROM finance.finance_data_staging
GROUP BY reason_bonds
ORDER BY num_bond_investors DESC;

-- Analyzing Sources of Information
-- Sources of financial information
SELECT source, COUNT(*) AS num_investors
FROM finance.finance_data_staging
GROUP BY source
ORDER BY num_investors DESC;

-- Correlations and Trends
-- Correlation between age and riskier investments (equity)
SELECT age, AVG(equity_market) AS avg_equity_investment
FROM finance.finance_data_staging
GROUP BY age
ORDER BY age;


-- 1. Analysis of Demographic Trends
-- Age distribution to understand the most common age groups among investors
SELECT age, COUNT(*) AS num_investors
FROM finance.finance_data_staging
GROUP BY age
ORDER BY age;

-- Gender distribution to see the split between male and female investors
SELECT gender, COUNT(*) AS num_investors
FROM finance.finance_data_staging
GROUP BY gender
ORDER BY num_investors DESC;

-- 2. Analysis of Investment Preferences
-- Count of investors who have chosen each investment avenue
SELECT investment_avenues, COUNT(*) AS num_investors
FROM finance.finance_data_staging
WHERE investment_avenues = 'YES'
GROUP BY investment_avenues
ORDER BY num_investors DESC;

-- average level of investment in different avenues
SELECT 
    AVG(mutual_funds) AS avg_mutual_funds, 
    AVG(equity_market) AS avg_equity_market, 
    AVG(debentures) AS avg_debentures,
    AVG(government_bonds) AS avg_government_bonds,
    AVG(fixed_deposits) AS avg_fixed_deposits,
    AVG(ppf) AS avg_ppf,
    AVG(gold) AS avg_gold
FROM finance.finance_data_staging;

-- 3. Risk and Return Analysis
-- Return expectations for each investment duration category
SELECT duration, expect, COUNT(*) AS num_investors
FROM finance.finance_data_staging
GROUP BY duration, expect
ORDER BY num_investors DESC;

-- Frequency of investment monitoring and corresponding return expectations
SELECT invest_monitor, expect, COUNT(*) AS num_investors
FROM finance.finance_data_staging
GROUP BY invest_monitor, expect
ORDER BY num_investors DESC;

-- 4. Savings Objectives and Reasons for Investment
-- Identify the most common savings objectives
SELECT `What are your savings objectives?` AS savings_objectives, COUNT(*) AS num_investors
FROM finance.finance_data_staging
GROUP BY `What are your savings objectives?`
ORDER BY num_investors DESC;

-- Analyzing why investors choose equity as an investment option
SELECT reason_equity, COUNT(*) AS num_equity_investors
FROM finance.finance_data_staging
GROUP BY reason_equity
ORDER BY num_equity_investors DESC;


-- Analyzing why investors choose bonds as an investment option
SELECT reason_bonds, COUNT(*) AS num_bond_investors
FROM finance.finance_data_staging
GROUP BY reason_bonds
ORDER BY num_bond_investors DESC;


















