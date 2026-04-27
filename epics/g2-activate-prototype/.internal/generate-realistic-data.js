/**
 * G2 Activate Prototype - Realistic Data Generator
 *
 * Generates 50-100 realistic companies based on:
 * - Real company names from G2's database
 * - BuyerCaddy tech stack enrichment patterns
 * - Realistic buyer intent signals
 * - Industry-appropriate firmographics
 *
 * Usage: node generate-realistic-data.js > ../prototype-state-generated.js
 */

// Real companies from database export
const REAL_COMPANIES = [
  { name: 'MileIQ', domain: 'mileiq.com', employeeRange: '[1,11)', status: 'acquired' },
  { name: 'Hellweg Die Profi-Baumärkte', domain: 'hellweg.de', employeeRange: '[1001,5001)', status: 'operating' },
  { name: 'FresnoCo Schools', domain: 'fcoe.org', employeeRange: '[1001,5001)', status: 'operating' },
  { name: 'SwipeClock', domain: 'swipeclock.com', employeeRange: '[51,101)', status: 'acquired' },
  { name: 'Cerner', domain: 'cerner.com', employeeRange: '[10001,)', status: 'operating' },
  { name: 'Media Booth', domain: 'mediabooth.com.au', employeeRange: '[11,51)', status: 'operating' },
  { name: 'Infogain', domain: 'infogain.com', employeeRange: '[1001,5001)', status: 'operating' },
  { name: 'Fueled', domain: 'fueled.be', employeeRange: '[51,101)', status: 'operating' },
  { name: 'BIM360', domain: 'bim360.com', employeeRange: '[101,251)', status: 'operating' },
  { name: 'IFX Networks', domain: 'ifxcorp.com', employeeRange: '[501,1001)', status: 'operating' },
  { name: 'JM Financial Services', domain: 'jmfinancialservices.in', employeeRange: '[251,501)', status: 'operating' },
  { name: 'Europe Express', domain: 'europeexpress.com', employeeRange: '[101,251)', status: 'operating' },
  { name: 'Law Ruler', domain: 'lawruler.com', employeeRange: '[11,51)', status: 'operating' },
  { name: 'GBST', domain: 'gbst.com', employeeRange: '[501,1001)', status: 'acquired' },
  { name: 'iCan Benefit Group', domain: 'icanbenefit.com', employeeRange: '[101,251)', status: 'operating' },
  { name: 'Island Club', domain: 'islandclub.com', employeeRange: '[51,101)', status: 'operating' },
  { name: 'MaxCDN', domain: 'maxcdn.com', employeeRange: '[51,101)', status: 'closed' },
  { name: '5p Consulting', domain: '5pconsulting.biz', employeeRange: '[11,51)', status: 'operating' },
  { name: 'Channel Factory', domain: 'channelfactory.com', employeeRange: '[101,251)', status: 'operating' },
  { name: 'Lipman Hearne', domain: 'lipmanhearne.com', employeeRange: '[101,251)', status: 'operating' },
  { name: 'BestReviews', domain: 'bestreviews.com', employeeRange: '[51,101)', status: 'acquired' },
  { name: 'Ext JS', domain: 'sencha.com', employeeRange: '[101,251)', status: 'operating' },
  { name: 'Donatos Pizza', domain: 'donatos.com', employeeRange: '[5001,10001)', status: 'acquired' },
  { name: 'Gemini Mobile', domain: 'geminimobile.com', employeeRange: '[51,101)', status: 'operating' },
  { name: 'CampusU', domain: 'campusu.com', employeeRange: '[11,51)', status: 'operating' },
];

// Industry classifications with associated tech stacks
const INDUSTRIES = {
  'Software Publishers': {
    techStack: ['Salesforce Sales Cloud', 'HubSpot CRM', 'Slack', 'Jira', 'GitHub', 'Zoom', 'Google Workspace'],
    cities: ['San Francisco, CA', 'Austin, TX', 'Seattle, WA', 'Boston, MA', 'New York, NY']
  },
  'Financial Services': {
    techStack: ['Salesforce Financial Services Cloud', 'Tableau', 'ServiceNow', 'Microsoft 365', 'Workday'],
    cities: ['New York, NY', 'Charlotte, NC', 'Chicago, IL', 'San Francisco, CA', 'London, UK']
  },
  'Healthcare Technology': {
    techStack: ['Epic', 'Cerner', 'Salesforce Health Cloud', 'Zoom', 'Microsoft Teams', 'Tableau'],
    cities: ['Boston, MA', 'Philadelphia, PA', 'Minneapolis, MN', 'Nashville, TN']
  },
  'Marketing & Advertising': {
    techStack: ['HubSpot Marketing Hub', 'Marketo', 'Salesforce Marketing Cloud', 'Google Analytics', 'Adobe Creative Cloud'],
    cities: ['New York, NY', 'Los Angeles, CA', 'Chicago, IL', 'Austin, TX']
  },
  'Professional Services': {
    techStack: ['Salesforce', 'NetSuite', 'Workday', 'Zoom', 'Microsoft 365', 'Slack'],
    cities: ['New York, NY', 'Chicago, IL', 'Dallas, TX', 'Atlanta, GA', 'Toronto, Canada']
  },
  'E-commerce & Retail': {
    techStack: ['Shopify', 'Salesforce Commerce Cloud', 'Google Analytics', 'Mailchimp', 'Zendesk'],
    cities: ['Seattle, WA', 'New York, NY', 'San Francisco, CA', 'Austin, TX']
  },
  'Education': {
    techStack: ['Canvas LMS', 'Blackboard', 'Zoom', 'Google Workspace', 'Microsoft Teams'],
    cities: ['Boston, MA', 'Austin, TX', 'Raleigh, NC', 'Phoenix, AZ']
  },
  'Manufacturing': {
    techStack: ['SAP', 'Oracle ERP', 'Salesforce', 'Tableau', 'AutoCAD'],
    cities: ['Detroit, MI', 'Chicago, IL', 'Milwaukee, WI', 'Pittsburgh, PA']
  }
};

// Parse employee range to actual count
function parseEmployeeRange(range) {
  if (!range) return 50;

  const match = range.match(/\[(\d+),(\d+)?\)/);
  if (!match) return 50;

  const min = parseInt(match[1]);
  const max = match[2] ? parseInt(match[2]) : min * 10;

  // Return midpoint
  return Math.floor((min + max) / 2);
}

// Generate revenue based on employee count and industry
function generateRevenue(employeeCount, industry) {
  const revenuePerEmployee = {
    'Software Publishers': 250000,
    'Financial Services': 350000,
    'Healthcare Technology': 200000,
    'Marketing & Advertising': 180000,
    'Professional Services': 150000,
    'E-commerce & Retail': 300000,
    'Education': 100000,
    'Manufacturing': 220000
  };

  const perEmployee = revenuePerEmployee[industry] || 200000;
  const baseRevenue = employeeCount * perEmployee;

  // Add some variance (+/- 30%)
  const variance = 0.3;
  const multiplier = 1 + (Math.random() * variance * 2 - variance);
  const revenue = Math.floor(baseRevenue * multiplier);

  // Format as currency
  if (revenue >= 1000000000) {
    return `$${(revenue / 1000000000).toFixed(1)}B`;
  } else if (revenue >= 1000000) {
    return `$${Math.floor(revenue / 1000000)}M`;
  } else {
    return `$${Math.floor(revenue / 1000)}K`;
  }
}

// Format employee count for display
function formatEmployeeCount(count) {
  if (count >= 10000) return `${Math.floor(count / 1000)}k`;
  if (count >= 1000) return `${(count / 1000).toFixed(1)}k`;
  return count.toString();
}

// Assign industry based on company name/domain patterns
function assignIndustry(companyName, domain) {
  const name = companyName.toLowerCase();
  const dom = domain.toLowerCase();

  if (name.includes('tech') || name.includes('software') || dom.includes('github') || dom.includes('atlassian')) {
    return 'Software Publishers';
  }
  if (name.includes('financial') || name.includes('bank') || name.includes('capital')) {
    return 'Financial Services';
  }
  if (name.includes('health') || name.includes('medical') || name.includes('cerner')) {
    return 'Healthcare Technology';
  }
  if (name.includes('marketing') || name.includes('media') || name.includes('advertising')) {
    return 'Marketing & Advertising';
  }
  if (name.includes('consult') || name.includes('services')) {
    return 'Professional Services';
  }
  if (name.includes('shop') || name.includes('retail') || name.includes('commerce')) {
    return 'E-commerce & Retail';
  }
  if (name.includes('school') || name.includes('university') || name.includes('edu') || name.includes('campus')) {
    return 'Education';
  }
  if (name.includes('manufact') || name.includes('industrial')) {
    return 'Manufacturing';
  }

  // Default assignment based on size
  const industries = Object.keys(INDUSTRIES);
  return industries[Math.floor(Math.random() * industries.length)];
}

// Generate contact count based on company size
function generateContactCount(employeeCount) {
  if (employeeCount > 5000) return Math.floor(Math.random() * 5) + 6; // 6-10
  if (employeeCount > 1000) return Math.floor(Math.random() * 3) + 5; // 5-7
  if (employeeCount > 250) return Math.floor(Math.random() * 2) + 4; // 4-5
  if (employeeCount > 50) return 3;
  return Math.floor(Math.random() * 2) + 2; // 2-3
}

// Generate intent score (1-100) and map to level
function generateIntentSignal() {
  // Weighted distribution: more High than Low
  const rand = Math.random();
  let score;

  if (rand < 0.5) {
    // 50% High (80-100)
    score = Math.floor(Math.random() * 21) + 80;
  } else if (rand < 0.85) {
    // 35% Medium (50-79)
    score = Math.floor(Math.random() * 30) + 50;
  } else {
    // 15% Low (20-49)
    score = Math.floor(Math.random() * 30) + 20;
  }

  let level;
  if (score >= 75) level = 'High';
  else if (score >= 50) level = 'Medium';
  else level = 'Low';

  return { score, level };
}

// Generate filtering attributes based on industry
function generateFilteringAttributes(industry, employeeCount) {
  const departments = [];
  const managementLevels = [];
  const jobFunctions = [];

  // Always have sales and marketing
  departments.push('sales', 'marketing');
  managementLevels.push('vp', 'director', 'manager');
  jobFunctions.push('business-dev', 'demand-gen');

  // Add based on size
  if (employeeCount > 100) {
    departments.push('engineering', 'product', 'operations');
    managementLevels.push('c-level');
    jobFunctions.push('product-mgmt', 'software-eng');
  }

  if (employeeCount > 500) {
    departments.push('finance', 'hr', 'cs');
    jobFunctions.push('account-exec', 'customer-support', 'data-analytics');
  }

  if (employeeCount > 1000) {
    managementLevels.push('individual');
  }

  return { departments, managementLevels, jobFunctions };
}

// Generate company description
function generateDescription(name, industry, employeeCount, location) {
  const templates = [
    `${name} is a ${industry.toLowerCase()} company providing innovative solutions to businesses worldwide. With ${formatEmployeeCount(employeeCount)} employees across multiple locations, the company serves clients with cutting-edge technology and expert consultation.`,
    `Based in ${location}, ${name} specializes in ${industry.toLowerCase()} solutions for mid-market and enterprise clients. The company's ${formatEmployeeCount(employeeCount)}-person team delivers scalable platforms and services to drive business growth.`,
    `${name} is a leading provider in the ${industry.toLowerCase()} space, offering comprehensive solutions for modern enterprises. Headquartered in ${location}, the company has grown to ${formatEmployeeCount(employeeCount)} employees serving customers globally.`
  ];

  return templates[Math.floor(Math.random() * templates.length)];
}

// Generate the complete dataset
function generateCompanies() {
  const companies = [];
  let idCounter = 1;

  REAL_COMPANIES.forEach(company => {
    const employeeCount = parseEmployeeRange(company.employeeRange);
    const industry = assignIndustry(company.name, company.domain);
    const industryData = INDUSTRIES[industry];
    const location = industryData.cities[Math.floor(Math.random() * industryData.cities.length)];
    const intent = generateIntentSignal();
    const contactCount = generateContactCount(employeeCount);
    const filteringAttrs = generateFilteringAttributes(industry, employeeCount);

    companies.push({
      id: `company-${idCounter.toString().padStart(3, '0')}`,
      name: company.name,
      activityLevel: intent.level,
      activityScore: intent.score,
      employees: formatEmployeeCount(employeeCount),
      employeeCount: employeeCount,
      location: location,
      revenue: generateRevenue(employeeCount, industry),
      contacts: contactCount,
      unlockCost: 50,
      industry: industry,
      description: generateDescription(company.name, industry, employeeCount, location),
      domain: company.domain,
      status: company.status,
      departments: filteringAttrs.departments,
      managementLevels: filteringAttrs.managementLevels,
      jobFunctions: filteringAttrs.jobFunctions
    });

    idCounter++;
  });

  return companies;
}

// Generate the output
const companies = generateCompanies();

console.log(`/**
 * G2 Activate Prototype - Generated State with Realistic Data
 * Generated: ${new Date().toISOString()}
 * Companies: ${companies.length}
 */

const INITIAL_STATE = {
  credits: 150,
  plan: {
    type: 'G2 Activate Pro',
    status: 'inactive',
    price: 499,
    monthlyCredits: 5000,
    renewDate: '2026-05-15'
  },
  unlockedCompanies: [],
  availableCompanies: ${JSON.stringify(companies, null, 2)}
};

// Export for use in prototype-state.js
if (typeof module !== 'undefined' && module.exports) {
  module.exports = { INITIAL_STATE };
}
`);

console.error(`✓ Generated ${companies.length} realistic companies`);
console.error(`✓ Industries: ${Object.keys(INDUSTRIES).length}`);
console.error(`✓ Size range: ${Math.min(...companies.map(c => c.employeeCount))} - ${Math.max(...companies.map(c => c.employeeCount))} employees`);
console.error(`✓ Intent distribution: ${companies.filter(c => c.activityLevel === 'High').length} High, ${companies.filter(c => c.activityLevel === 'Medium').length} Medium, ${companies.filter(c => c.activityLevel === 'Low').length} Low`);
