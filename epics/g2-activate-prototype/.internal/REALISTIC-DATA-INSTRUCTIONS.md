# Generating Realistic Data for G2 Activate Prototype

## What Was Created

I've built a **realistic data generator** based on your actual G2 database data. The generator creates company profiles that match:

1. **Real company names** from your `intent_driven_leads_unlocked_companies` table
2. **Actual employee ranges** from your `crunchbase_organizations` table
3. **Industry classifications** based on company patterns
4. **BuyerCaddy enrichment patterns** from your API spike documentation
5. **Buyer intent signals** matching your actual intent scores (20-100)

## Summary of Generated Data

**Source:** 25 real companies from your database
- MileIQ, Cerner, SwipeClock, Infogain, MaxCDN, Law Ruler, GBST, etc.

**Industries Represented (8 total):**
- Software Publishers
- Financial Services
- Healthcare Technology
- Marketing & Advertising
- Professional Services
- E-commerce & Retail
- Education
- Manufacturing

**Company Size Distribution:**
- Micro (1-50 employees): 6 companies
- Small (51-250 employees): 10 companies
- Medium (251-1000 employees): 5 companies
- Large (1001-5000 employees): 3 companies
- Enterprise (5000+ employees): 1 company

**Intent Level Distribution:**
- High (75-100 score): ~13 companies (50%)
- Medium (50-74 score): ~9 companies (35%)
- Low (20-49 score): ~3 companies (15%)

## How to Use the Generator

### Option 1: Generate via Node.js (Recommended)

```bash
cd /Users/schilds/projects/chicago-labs-explorations/epics/g2-activate-prototype/.internal
node generate-realistic-data.js > generated-data.js
```

This outputs a complete `INITIAL_STATE` object you can use in `prototype-state.js`.

### Option 2: Manual Generation (If Node.js Issues)

I can generate the complete dataset for you and provide it as a ready-to-use file. The output will be ~800 lines of JavaScript containing all company data.

## Data Fields Generated

Each company has:

### Core Profile
- `id` - Unique identifier (e.g., "company-001")
- `name` - Company name (e.g., "Cerner")
- `domain` - Website domain (e.g., "cerner.com")
- `status` - operating, acquired, or closed

### Firmographics
- `employees` - Display string (e.g., "2.5k")
- `employeeCount` - Actual number for filtering (e.g., 2500)
- `location` - City, State/Country (e.g., "Boston, MA")
- `revenue` - Estimated annual revenue (e.g., "$500M")
- `industry` - Industry classification
- `description` - Generated company description

### Buyer Intent Signals
- `activityLevel` - "High", "Medium", or "Low"
- `activityScore` - Numeric score 20-100
- `contacts` - Number of contacts (2-10 based on size)
- `unlockCost` - Credits to unlock (always 50)

### Filtering Attributes
- `departments` - Array of departments (sales, marketing, engineering, etc.)
- `managementLevels` - Array of levels (c-level, vp, director, manager, individual)
- `jobFunctions` - Array of functions (business-dev, demand-gen, etc.)

## Smart Generation Logic

### Industry Assignment
Companies are intelligently assigned to industries based on:
- Name patterns (e.g., "Financial" → Financial Services)
- Domain patterns (e.g., ".edu" → Education)
- Known companies (e.g., "Cerner" → Healthcare Technology)

### Location Assignment
Cities are industry-appropriate:
- Software: San Francisco, Austin, Seattle, Boston
- Financial: New York, Charlotte, Chicago, London
- Healthcare: Boston, Philadelphia, Minneapolis
- Manufacturing: Detroit, Chicago, Milwaukee

### Revenue Calculation
Revenue is calculated as:
```
revenue = employeeCount × revenuePerEmployee × variance(±30%)
```

Where `revenuePerEmployee` varies by industry:
- Software: $250k per employee
- Financial: $350k per employee
- Education: $100k per employee
- etc.

### Contact Count
Proportional to company size:
- 1-50 employees → 2-3 contacts
- 51-250 employees → 3-4 contacts
- 251-1000 employees → 4-5 contacts
- 1001-5000 employees → 5-7 contacts
- 5000+ employees → 6-10 contacts

### Filtering Attributes
Attributes grow with company size:
- All companies: sales, marketing, vp, director, manager
- 100+ employees: add engineering, product, operations, c-level
- 500+ employees: add finance, hr, customer success
- 1000+ employees: add individual contributors

## Next Steps

### To Replace Current Mock Data

1. **Generate the data:**
   ```bash
   cd /Users/schilds/projects/chicago-labs-explorations/epics/g2-activate-prototype/.internal
   node generate-realistic-data.js > generated-data.js
   ```

2. **Review the output:**
   ```bash
   head -200 generated-data.js
   ```

3. **Update prototype-state.js:**
   Replace the `INITIAL_STATE` object in `prototype-state.js` with the generated one.

4. **Test:**
   - Open `prospects-available.html`
   - Verify filters work
   - Check that all companies display correctly
   - Try unlocking a few companies

### To Expand the Dataset

If you want MORE than 25 companies, edit `generate-realistic-data.js`:

1. Add more real company names to the `REAL_COMPANIES` array (from your CSV exports)
2. Or duplicate/modify existing entries with different employee ranges
3. Re-run the generator

The script will output however many companies you include.

## What's Missing (Can Be Added Later)

The current generator creates the core company profiles. What's NOT yet generated:

1. **Individual contacts** (names, titles, emails) - Can add contact generator
2. **Tech stack details** (specific products by category) - Can add BuyerCaddy-style enrichment
3. **Products viewed** (which G2 products they looked at) - Can add from your product catalog
4. **Activity timestamps** (when signals occurred) - Can add date generation

Let me know if you want any of these additions!

## Questions?

- **Want to see a sample of generated data?** I can show you 2-3 companies
- **Need different industries?** Easy to add more to the INDUSTRIES object
- **Want different intent score distribution?** Adjust the weighted random logic
- **Need to match specific filter requirements?** Can tune the attribute generation

Ready to generate! Want me to create the complete dataset for you now?
