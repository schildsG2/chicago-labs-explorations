# G2 Activate Prototype — Developer Guide

## Overview

This prototype demonstrates the G2 Activate product experience with **real state management** and **multi-page persistence**. Users can unlock prospects, see credit deductions, and maintain state across pages—no cookies, no server required.

---

## Quick Start

### 1. Using Page Templates

Two base templates are provided for rapid page creation:

- **`pages/template-activation.html`** — For Activation tab pages (Emails/LinkedIn Ads)
- **`pages/template-prospects.html`** — For Prospects tab pages (Available/Unlocked)

**To create a new page:**

1. Copy the appropriate template
2. Rename to your page name (e.g., `activation-emails.html`)
3. Update the marked sections (`UPDATE:` comments)
4. Add page-specific styles in the `PAGE-SPECIFIC STYLES` section
5. Add page content in the `PAGE CONTENT` section

---

## State Management System

### Overview

The prototype uses **localStorage** for cross-page state persistence. Each user's browser maintains isolated state—no cookies, no authentication required. Perfect for multi-user testing without conflicts.

### Including State Management

State management is already included in both templates:

```html
<!-- State Management -->
<script src="../prototype-state.js"></script>
```

### Credit Display (Auto-Updates)

Credits display automatically in the header via the `data-credits` attribute:

```html
<div class="credits-display">
  Credits: <span class="credits-value" data-credits>150</span>
</div>
```

The `G2ActivateState.updateCreditDisplay()` function automatically finds and updates all elements with `data-credits`.

---

## State API Reference

### Getting State

```javascript
// Get full state object
const state = G2ActivateState.get();
console.log(state.credits); // 150
console.log(state.unlockedCompanies); // []

// Get specific values
const credits = G2ActivateState.getCredits();
const available = G2ActivateState.getAvailableCompanies();
const unlocked = G2ActivateState.getUnlockedCompanies();
const plan = G2ActivateState.getPlan();
```

### Unlocking Companies

```javascript
// Unlock a company (deducts credits, moves to unlocked)
const result = G2ActivateState.unlockCompany('predictive-001', 10);

if (result.success) {
  console.log(result.message); // "Predictive unlocked!"
  console.log(result.credits); // 140
  console.log(result.company); // { id: 'predictive-001', name: 'Predictive', ... }
} else {
  console.log(result.message); // "Insufficient credits"
}
```

### Managing Credits

```javascript
// Add credits
G2ActivateState.addCredits(100);

// Update credit displays across page
G2ActivateState.updateCreditDisplay();
```

### Listening to State Changes

```javascript
// Listen for state changes from other pages
window.addEventListener('g2ActivateStateChange', (event) => {
  const newState = event.detail;
  console.log('State updated:', newState);
  
  // Update UI based on new state
  updateCompanyList();
});
```

---

## Page Structure Pattern

### Template Anatomy

```html
<!DOCTYPE html>
<html>
<head>
  <title>[Page Name] — G2 Activate</title>
  <link rel="stylesheet" href="../../../shared/tokens/elevate.css">
  <link rel="stylesheet" href="../../../shared/components/elevate.css">
  <link rel="stylesheet" href="../../../shared/icons/icons.css">
  <style>
    /* Base styles (provided) */
    /* PAGE-SPECIFIC STYLES (add yours here) */
  </style>
</head>
<body>

<!-- MyG2 Global Header (same across all pages) -->
<header class="myg2-header">...</header>

<!-- Page Content -->
<div elv>
  
  <!-- Page Header (includes breadcrumbs, title, status, primary tabs) -->
  <div class="page-header">...</div>
  
  <!-- Content Area -->
  <div class="content-area">
    
    <!-- Secondary Tabs -->
    <nav class="secondary-tabs">...</nav>
    
    <!-- Section Header -->
    <div style="margin-top: 24px;">
      <h2 class="section-title">[Your Title]</h2>
      <p class="section-description">[Your description]</p>
    </div>
    
    <!-- YOUR PAGE CONTENT HERE -->
    
  </div>
  
</div>

<!-- State Management -->
<script src="../prototype-state.js"></script>

</body>
</html>
```

---

## Navigation Structure

### Primary Tabs (Main Navigation)

- **Prospects** — View available and unlocked companies
  - Available (default)
  - Unlocked
  
- **Activation** — Export prospects to activation channels
  - Emails
  - LinkedIn Ads

### Linking Between Pages

Primary tab navigation:

```html
<nav class="primary-tabs">
  <a href="prospects-available.html" class="primary-tab active">Prospects</a>
  <a href="activation-linkedin-ads.html" class="primary-tab">Activation</a>
</nav>
```

Secondary tab navigation (Prospects):

```html
<nav class="secondary-tabs">
  <a href="prospects-available.html" class="secondary-tab active">Available</a>
  <a href="prospects-unlocked.html" class="secondary-tab">Unlocked</a>
</nav>
```

Secondary tab navigation (Activation):

```html
<nav class="secondary-tabs">
  <a href="activation-emails.html" class="secondary-tab active">Emails</a>
  <a href="activation-linkedin-ads.html" class="secondary-tab">LinkedIn Ads</a>
</nav>
```

---

## Example: Building the Available Prospects Page

### 1. Copy Template

```bash
cp pages/template-prospects.html pages/prospects-available.html
```

### 2. Update Metadata

```html
<title>Available Prospects — G2 Activate</title>
```

### 3. Update Active States

```html
<!-- Primary tabs: Prospects is active -->
<a href="prospects-available.html" class="primary-tab active">Prospects</a>

<!-- Secondary tabs: Available is active -->
<a href="prospects-available.html" class="secondary-tab active">Available</a>
```

### 4. Add Section Header

```html
<h2 class="section-title">Available Prospects</h2>
<p class="section-description">High-intent companies ready to unlock. Each company costs 10 credits.</p>
```

### 5. Build Company List

```html
<div class="company-list">
  <!-- Companies will be rendered here -->
</div>

<script>
// Render available companies
const state = G2ActivateState.get();
const companies = state.availableCompanies;

const listHtml = companies.map(company => `
  <div class="company-card">
    <h3>${company.name}</h3>
    <p>${company.activityLevel} Activity</p>
    <p>${company.employees} employees</p>
    <button onclick="handleUnlock('${company.id}')">
      Unlock (${company.unlockCost} credits)
    </button>
  </div>
`).join('');

document.querySelector('.company-list').innerHTML = listHtml;

// Handle unlock
function handleUnlock(companyId) {
  const result = G2ActivateState.unlockCompany(companyId, 10);
  
  if (result.success) {
    alert(result.message);
    location.reload(); // Refresh to show updated list
  } else {
    alert(result.message);
  }
}
</script>
```

---

## Mock Data Reference

### Initial State Structure

```javascript
{
  credits: 150,
  plan: {
    type: 'G2 Activate Pro',
    status: 'active',
    price: 499,
    monthlyCredits: 5000,
    renewDate: '2026-05-15'
  },
  unlockedCompanies: [],
  availableCompanies: [
    {
      id: 'predictive-001',
      name: 'Predictive',
      activityLevel: 'High',
      employees: '750 – 1,000',
      location: 'Port Saint Lucie, FL',
      revenue: '$21,400,000',
      contacts: 3,
      unlockCost: 10
    },
    // ... 4 more companies
  ]
}
```

### After Unlocking a Company

```javascript
{
  credits: 140, // Deducted
  unlockedCompanies: [
    {
      id: 'predictive-001',
      name: 'Predictive',
      activityLevel: 'High',
      employees: '750 – 1,000',
      location: 'Port Saint Lucie, FL',
      revenue: '$21,400,000',
      contacts: 3,
      unlockCost: 10,
      unlockedDate: '2026-04-21T18:30:00.000Z' // Added
    }
  ],
  availableCompanies: [
    // Removed 'predictive-001', now has 4 companies
  ]
}
```

---

## Testing & Demo Reset

### Testing Multi-User Scenarios

Since state is browser-local (localStorage), each user gets isolated state:

- **Same browser, same user** — State persists across tabs
- **Different browsers** — Separate state
- **Incognito mode** — Fresh state per window

### Resetting Demo Data

**Keyboard shortcut:** `Shift + R`

Resets:
- Credits back to 150
- Unlocked companies cleared
- Available companies restored to 5
- Page auto-reloads

Alternatively, call in console:

```javascript
G2ActivateState.reset();
```

---

## Checklist: Creating a New Page

- [ ] Copy appropriate template (`template-activation.html` or `template-prospects.html`)
- [ ] Rename file to match page name
- [ ] Update `<title>` in `<head>`
- [ ] Update active states on primary tabs
- [ ] Update active states on secondary tabs
- [ ] Update section title and description
- [ ] Add page-specific styles in `PAGE-SPECIFIC STYLES` section
- [ ] Add page content in `PAGE CONTENT` section
- [ ] Test state integration (credit display, unlock flows, etc.)
- [ ] Test navigation to/from other pages
- [ ] Test with Shift+R reset

---

## Files Reference

### Core Files

- `prototype-state.js` — State management system (localStorage)
- `pages/template-activation.html` — Base template for Activation pages
- `pages/template-prospects.html` — Base template for Prospects pages
- `PROTOTYPE-README.md` — This file

### Completed Pages

- `pages/activation-linkedin-ads.html` — LinkedIn Ads activation page (reference implementation)

### Pending Pages

- [ ] `pages/activation-emails.html`
- [ ] `pages/prospects-available.html` (unlock workflow)
- [ ] `pages/prospects-unlocked.html`
- [ ] `pages/manage-plan-active.html`
- [ ] `pages/purchase-credits.html`

---

## Questions?

- **State not persisting?** Check that `<script src="../prototype-state.js"></script>` is included
- **Credits not updating?** Ensure element has `data-credits` attribute
- **Navigation broken?** Check file paths in `href` attributes
- **Need new mock data?** Edit `INITIAL_STATE` in `prototype-state.js`

---

**Ready to build!** Copy a template and start prototyping. 🚀
