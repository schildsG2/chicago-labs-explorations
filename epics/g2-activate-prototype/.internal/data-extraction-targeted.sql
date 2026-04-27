-- G2 Activate Prototype - Targeted Data Extraction
-- Based on available tables in your database

-- ============================================================
-- STEP 1: Explore Key Tables Structure
-- ============================================================

-- 1A. Companies table structure
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'companies'
ORDER BY ordinal_position;

-- 1B. Organizations table structure
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'organizations'
ORDER BY ordinal_position;

-- 1C. Crunchbase organizations (firmographic data)
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'crunchbase_organizations'
ORDER BY ordinal_position;

-- 1D. Bombora surging companies (intent signals)
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'bombora_surging_companies'
ORDER BY ordinal_position;

-- 1E. High intent leads
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'high_intent_leads'
ORDER BY ordinal_position;

-- ============================================================
-- STEP 2: Sample Data from Key Tables
-- ============================================================

-- 2A. Sample companies
SELECT *
FROM companies
LIMIT 5;

-- 2B. Sample organizations
SELECT *
FROM organizations
LIMIT 5;

-- 2C. Sample Crunchbase data (firmographics)
SELECT *
FROM crunchbase_organizations
LIMIT 5;

-- 2D. Sample Bombora surging companies (intent)
SELECT *
FROM bombora_surging_companies
WHERE updated_at >= CURRENT_DATE - INTERVAL '30 days'
LIMIT 10;

-- 2E. Sample high intent leads
SELECT *
FROM high_intent_leads
LIMIT 10;

-- ============================================================
-- STEP 3: Understand Relationships
-- ============================================================

-- 3A. Check if companies/organizations are linked
SELECT
  c.id as company_id,
  c.name as company_name,
  o.id as org_id,
  o.name as org_name
FROM companies c
LEFT JOIN organizations o ON c.id = o.company_id  -- Adjust join condition
LIMIT 5;

-- 3B. Check Bombora → Company relationship
SELECT
  b.*,
  c.name as company_name
FROM bombora_surging_companies b
LEFT JOIN companies c ON b.company_id = c.id  -- Adjust join condition
LIMIT 5;

-- ============================================================
-- STEP 4: Check G2 Activate Product Tables
-- ============================================================

-- 4A. Intent driven leads structure
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'intent_driven_leads_unlocked_companies'
ORDER BY ordinal_position;

-- 4B. Sample unlocked companies (to see actual product data structure)
SELECT *
FROM intent_driven_leads_unlocked_companies
LIMIT 10;

-- ============================================================
-- STEP 5: Count Available Data
-- ============================================================

-- How many companies have intent signals in last 30 days?
SELECT COUNT(DISTINCT company_id) as companies_with_intent
FROM bombora_surging_companies
WHERE updated_at >= CURRENT_DATE - INTERVAL '30 days';

-- How many high intent leads?
SELECT COUNT(*) as high_intent_count
FROM high_intent_leads;

-- ============================================================
-- STEP 6: Tech Stack Data
-- ============================================================

-- Tech stack structure
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'buyer_caddy_tech_stack_products'
ORDER BY ordinal_position;

-- Sample tech stack data
SELECT *
FROM buyer_caddy_tech_stack_products
LIMIT 10;

-- ============================================================
-- INSTRUCTIONS FOR SAM
-- ============================================================
-- Run queries in this order:
-- 1. STEP 1 - See what columns are available in each table
-- 2. STEP 2 - Look at actual sample data
-- 3. STEP 3 - Understand how tables connect
-- 4. STEP 4 - See what the actual G2 Activate product uses
-- 5. Export results and share them
--
-- What I need:
-- - Column names from key tables (especially companies, bombora_surging_companies)
-- - Sample rows (2-3 rows from each table)
-- - Any foreign key relationships you notice
--
-- Then I'll write the perfect extraction query!
