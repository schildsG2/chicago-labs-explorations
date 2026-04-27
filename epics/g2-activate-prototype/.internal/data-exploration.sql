-- G2 Activate Prototype - Data Exploration Queries
-- Run these in your SQL client (Metabase, DataGrip, etc.) to understand the schema

-- ============================================================
-- STEP 1: Find Relevant Tables (PostgreSQL)
-- ============================================================

-- Find buyer intent related tables
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND (
    table_name LIKE '%buyer%'
    OR table_name LIKE '%intent%'
    OR table_name LIKE '%signal%'
    OR table_name LIKE '%activity%'
  )
ORDER BY table_name;

-- Find company related tables
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND (
    table_name LIKE '%company%'
    OR table_name LIKE '%companies%'
    OR table_name LIKE '%organization%'
    OR table_name LIKE '%parent%'
  )
ORDER BY table_name;

-- Find G2 Activate specific tables (if they exist)
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND (
    table_name LIKE '%activate%'
    OR table_name LIKE '%prospect%'
  )
ORDER BY table_name;

-- ============================================================
-- STEP 2: Explore Table Structure (PostgreSQL)
-- ============================================================
-- Once you find the table names above, replace 'table_name' below
-- with the actual table names

-- Example: Describe the buyer intent table
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'buyer_intent_signals'  -- Replace with actual table name
ORDER BY ordinal_position;

-- Example: Describe the company table
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'companies'  -- Replace with actual table name
ORDER BY ordinal_position;

-- Or use PostgreSQL's \d command if in psql:
-- \d table_name

-- ============================================================
-- STEP 3: Sample Data from Each Table
-- ============================================================
-- Look at sample records to understand the data

-- Sample from buyer intent table
SELECT *
FROM buyer_intent_signals  -- Replace with actual table name
LIMIT 5;

-- Sample from company table
SELECT *
FROM companies  -- Replace with actual table name
LIMIT 5;

-- ============================================================
-- STEP 4: Understand Relationships
-- ============================================================
-- Find how tables are connected

-- Check foreign keys in buyer intent table
SELECT
  COLUMN_NAME,
  CONSTRAINT_NAME,
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'buyer_intent_signals'  -- Replace with actual table name
  AND REFERENCED_TABLE_NAME IS NOT NULL;

-- ============================================================
-- STEP 5: Check Data Availability
-- ============================================================
-- See how much data exists and date ranges

-- Count of companies with buyer intent signals
SELECT COUNT(DISTINCT company_id)
FROM buyer_intent_signals  -- Replace with actual table name
WHERE created_at >= DATE_SUB(NOW(), INTERVAL 90 DAY);

-- Date range of available data
SELECT
  MIN(created_at) as earliest_signal,
  MAX(created_at) as latest_signal,
  COUNT(*) as total_signals
FROM buyer_intent_signals;  -- Replace with actual table name

-- ============================================================
-- STEP 6: Explore Activity Patterns
-- ============================================================
-- Understand what constitutes "high activity"

-- Activity distribution by company (last 30 days)
SELECT
  company_id,
  COUNT(*) as signal_count,
  COUNT(DISTINCT user_id) as unique_contacts,
  MAX(created_at) as last_activity
FROM buyer_intent_signals  -- Replace with actual table name
WHERE created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
GROUP BY company_id
ORDER BY signal_count DESC
LIMIT 20;

-- ============================================================
-- STEP 7: Check Available Company Fields
-- ============================================================
-- See what firmographic data exists

-- Sample company profile data
SELECT
  company_id,
  company_name,
  city,
  country,
  country_code,
  description,
  employee_count,
  industry,
  annual_revenue
FROM companies  -- Replace with actual table name
WHERE company_name IS NOT NULL
LIMIT 10;

-- ============================================================
-- STEP 8: Check for Contact/User Data
-- ============================================================
-- See if contact information is available

-- Sample contact data structure
SELECT *
FROM users  -- Or contacts, or whatever the table is called
LIMIT 5;

-- Contacts grouped by company
SELECT
  company_id,
  COUNT(DISTINCT user_id) as contact_count,
  COUNT(DISTINCT department) as unique_departments,
  COUNT(DISTINCT seniority_level) as unique_levels
FROM users  -- Replace with actual table name
WHERE company_id IS NOT NULL
GROUP BY company_id
HAVING contact_count > 0
LIMIT 10;

-- ============================================================
-- NOTES FOR SAM
-- ============================================================
-- As you run these queries:
-- 1. Copy the actual table names you find
-- 2. Note which fields exist (especially for filtering)
-- 3. Check if there are any views or materialized views already
--    created for G2 Activate product
-- 4. Look for fields like: department, job_function, seniority_level
--    management_level, job_title, etc.
--
-- Once you have this info, paste back:
-- - Table names found
-- - Key fields available
-- - Sample row structure
--
-- Then I'll write the perfect extraction query!
