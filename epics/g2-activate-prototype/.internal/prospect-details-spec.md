# Prospect Details Page — Architectural Specification

**Version:** 1.0  
**Date:** April 21, 2026  
**Status:** Ready for Implementation

---

## 1. Overview

### 1.1 Purpose
The Prospect Details page displays comprehensive information about a single prospect company, including company metadata, contacts, and technology stack. It implements a **two-stage unlock pattern**:
- **Stage 1** (from table): Unlocks company info + contacts (10 credits)
- **Stage 2** (from details page): Unlocks tech stack data (10 credits)

### 1.2 Context
- **Parent Page:** `prospects-available.html` (table with unlock flow)
- **URL Pattern:** `prospect-details.html?id=company-id`
- **Navigation:** Back button → returns to available prospects table
- **Template Base:** `pages/template-prospects.html`

### 1.3 Key Visual States
- **State 1: Locked Tech Stack** (Figma 4485:98858)
  - Company info card visible
  - 3 contact cards visible with copy email buttons
  - Tech stack section showing "Unlock for 10 credits" button
  
- **State 2: Unlocked Tech Stack** (Figma 4485:99243)
  - Same company info and contacts
  - Tech stack grid showing 6 categories with products
  - Each product shows verification date and check icon

---

## 2. Page Architecture

### 2.1 HTML Structure

```
<body>
  <header class="myg2-header">
    <!-- Global MyG2 header (consistent across prototype) -->
  </header>

  <div elv>
    <div class="page-header">
      <nav class="breadcrumbs">
        <!-- Home → Buyer Activity → G2 Activate → Unlocked Prospects -->
      </nav>
      
      <div class="back-button-row">
        <a href="prospects-available.html" class="back-link">
          ← Unlocked Prospects
        </a>
      </div>
      
      <div class="page-title-row">
        <h1 class="page-title">[Company Name]</h1>
      </div>
    </div>

    <div class="content-area">
      
      <!-- Company Info Card -->
      <section class="company-info-card">
        <div class="company-header">
          <h2 class="company-name">Company Name</h2>
          <a href="#" class="visit-website-link">Visit website ↗</a>
        </div>
        <div class="company-metadata">
          <div class="metadata-row">
            <div class="activity-badge">
              📊 High Activity (99) · Mar 2026
            </div>
          </div>
          <div class="metadata-grid">
            <div class="metadata-item">
              <div class="metadata-label">Company Size</div>
              <div class="metadata-value">25.9k</div>
            </div>
            <div class="metadata-item">
              <div class="metadata-label">Est. Annual Revenue</div>
              <div class="metadata-value">$27B</div>
            </div>
            <div class="metadata-item">
              <div class="metadata-label">Headquarters Location</div>
              <div class="metadata-value">City, State</div>
            </div>
          </div>
          <div class="description-section">
            <h3 class="description-title">Description</h3>
            <p class="description-text">[Company description...]</p>
          </div>
          <div class="products-viewed-section">
            <h3 class="products-title">Products Viewed</h3>
            <div class="product-tags">
              <span class="product-tag">📈 Product Name</span>
              <span class="product-tag">✨ Product Name</span>
            </div>
          </div>
        </div>
      </section>

      <!-- Contacts Section -->
      <section class="contacts-section">
        <div class="section-header">
          <h2 class="section-title">Nutrien Contacts (3)</h2>
          <div class="section-actions">
            <button class="btn btn--primary">Download CSV ↓</button>
            <button class="btn btn--secondary">🎨 Generate Emails</button>
          </div>
        </div>
        
        <div class="contacts-grid">
          <!-- 3 contact cards in 3-column grid -->
          <article class="contact-card" data-contact-id="[id]">
            <div class="contact-avatar">
              <!-- Colored circle with initials -->
            </div>
            <div class="contact-info">
              <h3 class="contact-name">Name</h3>
              <p class="contact-email">email@company.com</p>
              <p class="contact-title">Job Title</p>
              <div class="contact-matches">
                <span class="match-tag">Department</span>
                <span class="match-tag">Level</span>
              </div>
            </div>
            <button class="copy-email-btn" data-email="[email]">
              📋 Copy Email
            </button>
          </article>
        </div>
      </section>

      <!-- Tech Stack Section (Conditional) -->
      <section class="tech-stack-section" data-tech-stack-state="locked|unlocked">
        
        <!-- Locked State -->
        <div class="tech-stack-locked" data-state="locked">
          <div class="section-header">
            <div>
              <h2 class="section-title">Nutrien Tech Stack (16)</h2>
              <p class="section-subtitle">Verified Dec 2025</p>
              <p class="section-description">
                Products in active use at this company, detected from public signals.
                Unlocked tech stacks will automatically enrich generated emails.
              </p>
              <p class="powered-by">Powered by 🎯 BuyerCaddy</p>
            </div>
          </div>
          <button class="btn btn--primary btn--lg unlock-tech-stack-btn">
            Unlock for 10 credits
          </button>
        </div>

        <!-- Unlocked State -->
        <div class="tech-stack-unlocked" data-state="unlocked">
          <div class="section-header">
            <div>
              <h2 class="section-title">Nutrien Tech Stack (16)</h2>
              <p class="section-subtitle">Unlocked Apr 7, 2026</p>
            </div>
          </div>
          
          <div class="tech-stack-grid">
            <!-- 6 categories in 2-column grid -->
            <div class="category-section">
              <h3 class="category-title">CRM (2)</h3>
              <ul class="product-list">
                <li class="product-item">
                  <span class="product-icon">✓</span>
                  <span class="product-name">Salesforce Sales Cloud</span>
                  <span class="verified-date">✓ Verified Dec 2025</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>

    </div>
  </div>

  <script src="../prototype-state.js"></script>
  <script src="./prospect-details.js"></script>
</body>
```

### 2.2 CSS Class Naming Conventions

**Pattern:** Follow established Elevate-inspired BEM-like naming:
- **Blocks:** `.company-info-card`, `.contacts-section`, `.tech-stack-section`
- **Elements:** `.section-title`, `.contact-name`, `.product-item`
- **Modifiers:** `.btn--primary`, `.intent-badge--high`, `[data-state="locked"]`

**Key Classes:**
```css
/* Company Info */
.company-info-card
.company-header, .company-name, .visit-website-link
.company-metadata, .metadata-grid, .metadata-item
.metadata-label, .metadata-value
.activity-badge
.description-section, .products-viewed-section
.product-tag

/* Contacts */
.contacts-section, .contacts-grid
.contact-card
.contact-avatar, .contact-info
.contact-name, .contact-email, .contact-title
.contact-matches, .match-tag
.copy-email-btn

/* Tech Stack */
.tech-stack-section
.tech-stack-locked, .tech-stack-unlocked
.unlock-tech-stack-btn
.tech-stack-grid, .category-section
.category-title, .product-list, .product-item
.product-icon, .product-name, .verified-date

/* Utility */
.section-header, .section-title, .section-subtitle
.section-description, .section-actions
.back-button-row, .back-link
```

---

## 3. Data Structure

### 3.1 Enhanced Company Object

Extend the existing company structure in `prototype-state.js` with:

```javascript
{
  // Existing fields
  id: 'predictive-001',
  name: 'Predictive',
  activityLevel: 'High',
  employees: '750 – 1,000',
  location: 'Port Saint Lucie, FL',
  revenue: '$21,400,000',
  contacts: 3,
  unlockCost: 10,
  
  // NEW: Detailed fields for details page
  website: 'https://predictive.com',
  activityScore: 99,
  activityMonth: 'Mar 2026',
  description: 'Company description text...',
  industry: 'Software & SaaS',
  
  // NEW: Unlock state tracking
  contactsUnlocked: true,  // Set when company unlocked from table
  techStackUnlocked: false, // Set when tech stack unlocked from details
  
  // NEW: Contact details
  contactList: [
    {
      id: 'c001',
      name: 'Lilly Piel',
      email: 'l.piel@company.com',
      title: 'Chief Operating Officer',
      department: 'Department',
      seniority: 'Level',
      avatarColor: '#7C7FF2' // Purple, blue, or coral
    },
    {
      id: 'c002',
      name: 'John Doe',
      email: 'j.doe@company.com',
      title: 'Manager, Communications & Reporting',
      department: 'Department',
      seniority: 'Level',
      avatarColor: '#4A9FF5'
    },
    {
      id: 'c003',
      name: 'Jane Smith',
      email: 'j.smith@company.com',
      title: 'Chief Executive Officer & Founder',
      department: 'Department',
      seniority: 'Level',
      avatarColor: '#FF8374'
    }
  ],
  
  // NEW: Products viewed
  productsViewed: [
    { name: 'Demandbase One', icon: '📈' },
    { name: '6sense Revenue Marketing', icon: '✨' }
  ],
  
  // NEW: Tech stack data (only visible after unlock)
  techStack: {
    totalProducts: 16,
    verifiedDate: 'Dec 2025',
    unlockedDate: null, // Set when unlocked
    categories: {
      'CRM': [
        { name: 'Salesforce Sales Cloud', verifiedDate: 'Dec 2025' },
        { name: 'HubSpot CRM', verifiedDate: 'Dec 2025' }
      ],
      'Sales Engagement': [
        { name: 'Outreach', verifiedDate: 'Dec 2025' },
        { name: 'SalesLoft', verifiedDate: 'Dec 2025' }
      ],
      'Sales Intelligence': [
        { name: 'Gong', verifiedDate: 'Dec 2025' },
        { name: 'Chorus', verifiedDate: 'Dec 2025' }
      ],
      'Marketing Automation': [
        { name: 'Marketo Engage', verifiedDate: 'Dec 2025' }
      ],
      'Data Integration': [
        { name: 'Snowflake', verifiedDate: 'Dec 2025' },
        { name: 'Fivetran', verifiedDate: 'Dec 2025' },
        { name: 'Domo', verifiedDate: 'Dec 2025' },
        { name: 'Zapier', verifiedDate: 'Dec 2025' },
        { name: 'Celigo', verifiedDate: 'Dec 2025' }
      ],
      'BI & Analytics': [
        { name: 'Tableau', verifiedDate: 'Dec 2025' },
        { name: 'Looker', verifiedDate: 'Dec 2025' }
      ]
    }
  }
}
```

### 3.2 State Management Extensions

Add to `prototype-state.js`:

```javascript
/**
 * Unlock tech stack for a company
 * @param {string} companyId 
 * @param {number} cost - Default 10 credits
 * @returns {object} Result with success status
 */
function unlockTechStack(companyId, cost = 10) {
  const state = get();
  
  // Check if enough credits
  if (state.credits < cost) {
    return {
      success: false,
      message: 'Insufficient credits',
      credits: state.credits
    };
  }
  
  // Find company in unlocked list
  const company = state.unlockedCompanies.find(c => c.id === companyId);
  if (!company) {
    return {
      success: false,
      message: 'Company not found in unlocked list'
    };
  }
  
  // Check if already unlocked
  if (company.techStackUnlocked) {
    return {
      success: false,
      message: 'Tech stack already unlocked'
    };
  }
  
  // Deduct credits
  state.credits -= cost;
  
  // Update company
  company.techStackUnlocked = true;
  company.techStack.unlockedDate = new Date().toISOString();
  
  // Save
  save(state);
  
  return {
    success: true,
    message: 'Tech stack unlocked!',
    credits: state.credits
  };
}

/**
 * Get company details by ID
 * Checks both available and unlocked lists
 */
function getCompanyById(companyId) {
  const state = get();
  
  // Check unlocked first
  const unlocked = state.unlockedCompanies.find(c => c.id === companyId);
  if (unlocked) return unlocked;
  
  // Check available
  const available = state.availableCompanies.find(c => c.id === companyId);
  return available || null;
}
```

---

## 4. JavaScript Module: prospect-details.js

### 4.1 Module Structure

```javascript
/**
 * Prospect Details Page Controller
 * Handles URL params, state hydration, and interactions
 */
(function() {
  'use strict';
  
  // ============================================
  // 1. INITIALIZATION
  // ============================================
  
  let currentCompany = null;
  
  function init() {
    const companyId = getCompanyIdFromUrl();
    if (!companyId) {
      showError('No company ID provided');
      return;
    }
    
    currentCompany = G2ActivateState.getCompanyById(companyId);
    if (!currentCompany) {
      showError('Company not found');
      return;
    }
    
    renderPage();
    attachEventListeners();
  }
  
  // ============================================
  // 2. URL PARAMETER HANDLING
  // ============================================
  
  function getCompanyIdFromUrl() {
    const params = new URLSearchParams(window.location.search);
    return params.get('id');
  }
  
  // ============================================
  // 3. PAGE RENDERING
  // ============================================
  
  function renderPage() {
    renderCompanyInfo();
    renderContacts();
    renderTechStackState();
  }
  
  function renderCompanyInfo() {
    // Update page title
    document.querySelector('.page-title').textContent = 
      `Prospect Details: ${currentCompany.name}`;
    
    // Render company card
    const card = document.querySelector('.company-info-card');
    card.innerHTML = `
      <div class="company-header">
        <h2 class="company-name">${currentCompany.name}</h2>
        <a href="${currentCompany.website}" 
           class="visit-website-link" 
           target="_blank">Visit website ↗</a>
      </div>
      <div class="company-metadata">
        <div class="metadata-row">
          <div class="activity-badge">
            📊 ${currentCompany.activityLevel} Activity (${currentCompany.activityScore}) · ${currentCompany.activityMonth}
          </div>
        </div>
        <div class="metadata-grid">
          <div class="metadata-item">
            <div class="metadata-label">Company Size</div>
            <div class="metadata-value">${currentCompany.employees}</div>
          </div>
          <div class="metadata-item">
            <div class="metadata-label">Est. Annual Revenue</div>
            <div class="metadata-value">${currentCompany.revenue}</div>
          </div>
          <div class="metadata-item">
            <div class="metadata-label">Headquarters Location</div>
            <div class="metadata-value">${currentCompany.location}</div>
          </div>
        </div>
        <div class="description-section">
          <h3 class="description-title">Description</h3>
          <p class="description-text">${currentCompany.description}</p>
        </div>
        <div class="products-viewed-section">
          <h3 class="products-title">Products Viewed</h3>
          <div class="product-tags">
            ${currentCompany.productsViewed.map(p => 
              `<span class="product-tag">${p.icon} ${p.name}</span>`
            ).join('')}
          </div>
        </div>
      </div>
    `;
  }
  
  function renderContacts() {
    const grid = document.querySelector('.contacts-grid');
    
    grid.innerHTML = currentCompany.contactList.map(contact => `
      <article class="contact-card" data-contact-id="${contact.id}">
        <div class="contact-avatar" style="background-color: ${contact.avatarColor}">
          ${getInitials(contact.name)}
        </div>
        <div class="contact-info">
          <h3 class="contact-name">${contact.name}</h3>
          <p class="contact-email">${contact.email}</p>
          <p class="contact-title">${contact.title}</p>
          <div class="contact-matches">
            <span class="match-tag">${contact.department}</span>
            <span class="match-tag">${contact.seniority}</span>
          </div>
        </div>
        <button class="copy-email-btn" data-email="${contact.email}">
          📋 Copy Email
        </button>
      </article>
    `).join('');
  }
  
  function renderTechStackState() {
    const section = document.querySelector('.tech-stack-section');
    const lockedDiv = section.querySelector('.tech-stack-locked');
    const unlockedDiv = section.querySelector('.tech-stack-unlocked');
    
    if (currentCompany.techStackUnlocked) {
      // Show unlocked state
      lockedDiv.style.display = 'none';
      unlockedDiv.style.display = 'block';
      section.setAttribute('data-tech-stack-state', 'unlocked');
      
      renderTechStackGrid();
    } else {
      // Show locked state
      lockedDiv.style.display = 'block';
      unlockedDiv.style.display = 'none';
      section.setAttribute('data-tech-stack-state', 'locked');
    }
  }
  
  function renderTechStackGrid() {
    const grid = document.querySelector('.tech-stack-grid');
    const categories = currentCompany.techStack.categories;
    
    grid.innerHTML = Object.entries(categories).map(([category, products]) => `
      <div class="category-section">
        <h3 class="category-title">${category} (${products.length})</h3>
        <ul class="product-list">
          ${products.map(product => `
            <li class="product-item">
              <span class="product-icon">✓</span>
              <span class="product-name">${product.name}</span>
              <span class="verified-date">✓ Verified ${product.verifiedDate}</span>
            </li>
          `).join('')}
        </ul>
      </div>
    `).join('');
  }
  
  // ============================================
  // 4. EVENT HANDLERS
  // ============================================
  
  function attachEventListeners() {
    // Tech stack unlock button
    const unlockBtn = document.querySelector('.unlock-tech-stack-btn');
    if (unlockBtn) {
      unlockBtn.addEventListener('click', handleTechStackUnlock);
    }
    
    // Copy email buttons
    document.addEventListener('click', (e) => {
      if (e.target.matches('.copy-email-btn') || 
          e.target.closest('.copy-email-btn')) {
        const btn = e.target.closest('.copy-email-btn');
        handleCopyEmail(btn.dataset.email);
      }
    });
  }
  
  function handleTechStackUnlock() {
    const result = G2ActivateState.unlockTechStack(currentCompany.id, 10);
    
    if (result.success) {
      // Update local reference
      currentCompany = G2ActivateState.getCompanyById(currentCompany.id);
      
      // Re-render tech stack section
      renderTechStackState();
      
      // Update credits display
      G2ActivateState.updateCreditDisplay();
      
      // Show success feedback
      showToast('Tech stack unlocked!', 'success');
    } else {
      showToast(result.message, 'error');
    }
  }
  
  function handleCopyEmail(email) {
    navigator.clipboard.writeText(email).then(() => {
      showToast('Email copied to clipboard', 'success');
    }).catch(err => {
      console.error('Failed to copy:', err);
      showToast('Failed to copy email', 'error');
    });
  }
  
  // ============================================
  // 5. UTILITIES
  // ============================================
  
  function getInitials(name) {
    return name.split(' ')
      .map(part => part[0])
      .join('')
      .toUpperCase();
  }
  
  function showToast(message, type = 'info') {
    // Simple toast notification
    const toast = document.createElement('div');
    toast.className = `toast toast--${type}`;
    toast.textContent = message;
    document.body.appendChild(toast);
    
    setTimeout(() => {
      toast.classList.add('toast--show');
    }, 10);
    
    setTimeout(() => {
      toast.classList.remove('toast--show');
      setTimeout(() => toast.remove(), 300);
    }, 3000);
  }
  
  function showError(message) {
    const contentArea = document.querySelector('.content-area');
    contentArea.innerHTML = `
      <div class="error-state">
        <h2>Error</h2>
        <p>${message}</p>
        <a href="prospects-available.html" class="btn btn--primary">
          ← Back to Available Prospects
        </a>
      </div>
    `;
  }
  
  // ============================================
  // 6. INITIALIZATION
  // ============================================
  
  document.addEventListener('DOMContentLoaded', init);
  
})();
```

---

## 5. Interaction Patterns

### 5.1 Navigation Flow

```
1. User clicks company name in Available Prospects table
   → Navigate to prospect-details.html?id=company-id

2. Page loads → Check URL param → Fetch company from state
   → If not found: Show error
   → If found but contactsUnlocked=false: Redirect to table
   → If found and contactsUnlocked=true: Render page

3. User clicks "Back" or "← Unlocked Prospects"
   → Navigate to prospects-available.html
```

### 5.2 Tech Stack Unlock Flow

```
1. User sees locked tech stack section
   → Button: "Unlock for 10 credits"

2. User clicks button
   → Check credits (≥10?)
     YES → Deduct 10 credits
           → Set techStackUnlocked = true
           → Set unlockedDate
           → Re-render section (show grid)
           → Update credit display in header
           → Show toast: "Tech stack unlocked!"
     NO  → Show toast: "Insufficient credits"

3. Tech stack grid appears
   → 6 categories in 2-column grid
   → Each product shows ✓ icon + name + verified date
```

### 5.3 Copy Email Interaction

```
1. User clicks "📋 Copy Email" button on contact card
   → Copy email to clipboard using Clipboard API
   → Show toast: "Email copied to clipboard"
   → Button visual feedback (optional micro-interaction)
```

### 5.4 State Synchronization

```
1. Tech stack unlock occurs
   → G2ActivateState.unlockTechStack() saves to localStorage
   → Dispatches 'g2ActivateStateChange' event
   → Any listening pages update their UI

2. If user has multiple tabs open
   → Unlock in Tab A triggers event
   → Tab B listens and updates credit display
   → Maintains consistency across tabs
```

---

## 6. CSS Layout Specifications

### 6.1 Responsive Grid Patterns

**Contacts Grid:**
```css
.contacts-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 16px;
}

@media (max-width: 1200px) {
  .contacts-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 768px) {
  .contacts-grid {
    grid-template-columns: 1fr;
  }
}
```

**Tech Stack Grid:**
```css
.tech-stack-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 24px;
}

@media (max-width: 768px) {
  .tech-stack-grid {
    grid-template-columns: 1fr;
  }
}
```

### 6.2 Card Styling

**Company Info Card:**
```css
.company-info-card {
  background: white;
  border: 0.5px solid var(--border-light);
  border-radius: 12px;
  padding: 24px;
  box-shadow: 0px 0px 1px 0px rgba(32,31,35,0.32), 
              0px 4px 4px 0px rgba(32,31,35,0.04);
}
```

**Contact Card:**
```css
.contact-card {
  background: white;
  border: 0.5px solid var(--border-light);
  border-radius: 12px;
  padding: 20px;
  display: flex;
  flex-direction: column;
  gap: 12px;
  box-shadow: 0px 0px 1px 0px rgba(32,31,35,0.32), 
              0px 4px 4px 0px rgba(32,31,35,0.04);
}

.contact-card:hover {
  border-color: var(--border-medium);
  box-shadow: 0px 2px 8px rgba(32,31,35,0.12);
}
```

### 6.3 Tech Stack States

**Locked State:**
```css
.tech-stack-locked {
  background: white;
  border: 0.5px solid var(--border-light);
  border-radius: 12px;
  padding: 40px;
  text-align: center;
}

.unlock-tech-stack-btn {
  margin-top: 24px;
}
```

**Unlocked State:**
```css
.tech-stack-unlocked {
  background: white;
  border: 0.5px solid var(--border-light);
  border-radius: 12px;
  padding: 24px;
}

.product-list {
  list-style: none;
  padding: 0;
  margin: 12px 0 0;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.product-item {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 12px;
  background: var(--bg-neutral-5);
  border-radius: 6px;
  font-size: 14px;
  line-height: 20px;
}

.product-icon {
  color: var(--text-success);
  font-size: 16px;
}

.verified-date {
  margin-left: auto;
  color: var(--text-subtle);
  font-size: 12px;
}
```

---

## 7. Technical Considerations

### 7.1 Performance

**Rendering Strategy:**
- Use template literals for fast DOM generation
- Minimize DOM queries by caching selectors
- Delegate event listeners (use event delegation for copy buttons)
- No heavy animations (keep interactions snappy)

**State Access:**
- Cache `currentCompany` reference after initial load
- Only re-fetch when unlock operations occur
- Use `data-` attributes to store IDs rather than re-querying state

### 7.2 Error Handling

**Scenarios:**
1. **No company ID in URL**
   - Show error: "No company ID provided"
   - Provide link back to prospects table

2. **Company not found**
   - Show error: "Company not found"
   - User may have reset demo data (Shift+R)
   - Provide link back to prospects table

3. **Company not unlocked** (contactsUnlocked = false)
   - Redirect to `prospects-available.html` with message
   - User should unlock from table first

4. **Insufficient credits for tech stack**
   - Show toast: "Insufficient credits"
   - Keep button enabled (don't grey out)
   - User may purchase more credits

5. **Clipboard API fails**
   - Show toast: "Failed to copy email"
   - Fallback: Show email in alert/prompt

### 7.3 Browser Compatibility

**Targets:**
- Modern browsers (Chrome 90+, Firefox 88+, Safari 14+)
- No IE11 support required

**APIs Used:**
- `URLSearchParams` (widely supported)
- `Clipboard API` (fallback needed)
- `localStorage` (universally supported)
- CSS Grid (IE11+ with prefixes, but not targeting IE11)

### 7.4 Accessibility

**ARIA Attributes:**
```html
<section class="contacts-section" aria-labelledby="contacts-heading">
  <h2 id="contacts-heading" class="section-title">Company Contacts (3)</h2>
  ...
</section>

<button class="copy-email-btn" 
        aria-label="Copy email address to clipboard">
  📋 Copy Email
</button>

<a href="prospects-available.html" 
   class="back-link"
   aria-label="Go back to available prospects list">
  ← Unlocked Prospects
</a>
```

**Keyboard Navigation:**
- All buttons must be keyboard-accessible
- Tab order: Back button → Download CSV → Generate Emails → Copy Email (×3) → Unlock Tech Stack
- Enter/Space to activate buttons
- Focus indicators (use Elevate focus styles)

**Screen Readers:**
- Semantic HTML (`<article>` for contact cards, `<section>` for major areas)
- Heading hierarchy (H1 → H2 → H3)
- Alternative text for icons (use `aria-label` on icon spans)
- Toast announcements (use `role="status"` for live regions)

---

## 8. Mock Data Requirements

### 8.1 Enhancements to prototype-state.js

**Add detailed data to existing company objects:**

```javascript
// In INITIAL_STATE.availableCompanies, expand each company:
{
  id: 'predictive-001',
  name: 'Predictive',
  activityLevel: 'High',
  employees: '750 – 1,000',
  location: 'Port Saint Lucie, FL',
  revenue: '$21,400,000',
  contacts: 3,
  unlockCost: 10,
  
  // ADD THESE:
  website: 'https://predictive.com',
  activityScore: 99,
  activityMonth: 'Mar 2026',
  description: 'Predictive is a retail supplier of agricultural products and services in North and South America, and a global wholesale producer and marketer of all three major agricultural nutrients, and the supplier of speciality fertilizers in North America. Predictive is headquartered in Saskatoon, Canada.',
  industry: 'Agriculture',
  
  contactsUnlocked: false,
  techStackUnlocked: false,
  
  contactList: [
    {
      id: 'c001',
      name: 'Lilly Piel',
      email: 'l.piel@predictive.com',
      title: 'Chief Operating Officer',
      department: 'Department',
      seniority: 'Level',
      avatarColor: '#7C7FF2'
    },
    {
      id: 'c002',
      name: 'John Doe',
      email: 'j.doe@predictive.com',
      title: 'Officer & Deputy Chief Executive Officer',
      department: 'Department',
      seniority: 'Level',
      avatarColor: '#4A9FF5'
    },
    {
      id: 'c003',
      name: 'Jane Smith',
      email: 'j.smith@predictive.com',
      title: 'Chief Executive Officer & Founder',
      department: 'Department',
      seniority: 'Level',
      avatarColor: '#FF8374'
    }
  ],
  
  productsViewed: [
    { name: 'Demandbase One', icon: '📈' },
    { name: '6sense Revenue Marketing', icon: '✨' }
  ],
  
  techStack: {
    totalProducts: 16,
    verifiedDate: 'Dec 2025',
    unlockedDate: null,
    categories: {
      'CRM': [
        { name: 'Salesforce Sales Cloud', verifiedDate: 'Dec 2025' },
        { name: 'HubSpot CRM', verifiedDate: 'Dec 2025' }
      ],
      'Sales Engagement': [
        { name: 'Outreach', verifiedDate: 'Dec 2025' },
        { name: 'SalesLoft', verifiedDate: 'Dec 2025' }
      ],
      'Sales Intelligence': [
        { name: 'Gong', verifiedDate: 'Dec 2025' },
        { name: 'Chorus', verifiedDate: 'Dec 2025' }
      ],
      'Marketing Automation': [
        { name: 'Marketo Engage', verifiedDate: 'Dec 2025' }
      ],
      'Data Integration': [
        { name: 'Snowflake', verifiedDate: 'Dec 2025' },
        { name: 'Fivetran', verifiedDate: 'Dec 2025' },
        { name: 'Domo', verifiedDate: 'Dec 2025' },
        { name: 'Zapier', verifiedDate: 'Dec 2025' },
        { name: 'Celigo', verifiedDate: 'Dec 2025' }
      ],
      'BI & Analytics': [
        { name: 'Tableau', verifiedDate: 'Dec 2025' },
        { name: 'Looker', verifiedDate: 'Dec 2025' }
      ]
    }
  }
}
```

**Replicate this structure for all 5 companies** (vary contact names, emails, product mixes).

### 8.2 State Mutation on Unlock

When company is unlocked from table:
```javascript
// In unlockCompany():
company.contactsUnlocked = true; // ADD THIS LINE
```

When tech stack is unlocked:
```javascript
// In unlockTechStack():
company.techStackUnlocked = true;
company.techStack.unlockedDate = new Date().toISOString();
```

---

## 9. File Dependencies

**Required Files:**
- `../../../shared/elevate-lite/tokens/elevate.css` — Design tokens
- `../../../shared/elevate-lite/components/elevate.css` — Component styles
- `../../../shared/elevate-lite/icons/icons.css` — Icon library
- `../../../shared/elevate-lite/assets/logos/g2-logo-rorange.svg` — G2 logo
- `../prototype-state.js` — State management (enhanced)
- `./prospect-details.js` — Page controller (new)

**Related Pages:**
- `prospects-available.html` — Parent page (table)
- `prospects-unlocked.html` — Sibling page (unlocked list)
- `activation-linkedin-ads.html` — Activation flow reference

---

## 10. Testing Checklist

### 10.1 Functional Tests

- [ ] **URL parameter handling**
  - Valid company ID loads page correctly
  - Missing company ID shows error
  - Invalid company ID shows error
  - Unrecognized company ID shows error

- [ ] **Company info rendering**
  - Company name appears in title and card
  - All metadata fields populated
  - Activity badge shows correct level
  - Products viewed render with icons
  - "Visit website" link opens in new tab

- [ ] **Contacts rendering**
  - 3 contact cards display in grid
  - Avatar colors match data
  - Initials extracted correctly
  - Email addresses visible
  - Department/seniority tags render

- [ ] **Copy email functionality**
  - Click copies email to clipboard
  - Toast confirmation appears
  - Works for all 3 contacts

- [ ] **Tech stack locked state**
  - Section shows locked when techStackUnlocked = false
  - Unlock button visible
  - Credit cost displayed (10)
  - Description text present

- [ ] **Tech stack unlock flow**
  - Button deducts 10 credits
  - Credit display updates immediately
  - Locked state switches to unlocked state
  - Grid renders with 6 categories
  - Products show check icons and dates
  - Success toast appears

- [ ] **Insufficient credits**
  - Error toast appears
  - State does not change
  - Button remains enabled

- [ ] **Back navigation**
  - "← Unlocked Prospects" link returns to table
  - Back button in MyG2 header works
  - Browser back button works

### 10.2 Visual Tests

- [ ] **Layout**
  - Company card full-width
  - Contacts grid 3-column
  - Tech stack grid 2-column
  - Proper spacing between sections

- [ ] **Responsive**
  - Contacts 2-column on tablet
  - Contacts 1-column on mobile
  - Tech stack 1-column on mobile

- [ ] **Hover states**
  - Contact cards lift on hover
  - Copy email buttons highlight
  - Links change color on hover

- [ ] **Focus states**
  - Keyboard navigation works
  - Focus indicators visible (Elevate style)
  - Tab order logical

### 10.3 State Persistence Tests

- [ ] **Multi-tab scenario**
  - Open page in Tab A
  - Unlock tech stack
  - Open same company in Tab B
  - Verify tech stack shows unlocked state

- [ ] **Page reload**
  - Unlock tech stack
  - Refresh page (F5)
  - Verify tech stack remains unlocked
  - Verify credits still deducted

- [ ] **Demo reset**
  - Unlock tech stack
  - Press Shift+R
  - Verify tech stack returns to locked state
  - Verify credits reset to 150

### 10.4 Edge Cases

- [ ] Company unlocked but no contacts data → graceful degradation
- [ ] Tech stack categories empty → show category with "(0)"
- [ ] Very long company name → wraps or truncates
- [ ] Very long product name → wraps or truncates
- [ ] Clipboard API unsupported → fallback or error message

---

## 11. Implementation Priority

### Phase 1: Core Structure (Day 1)
1. ✅ Create `prospect-details.html` from template
2. ✅ Build static company info card
3. ✅ Build static contacts grid
4. ✅ Build locked tech stack section
5. ✅ Style all components (match Figma)

### Phase 2: State Integration (Day 2)
6. ✅ Enhance `prototype-state.js` with detailed data
7. ✅ Add `unlockTechStack()` function
8. ✅ Add `getCompanyById()` function
9. ✅ Create `prospect-details.js` module
10. ✅ Implement URL parameter reading
11. ✅ Hydrate page from state

### Phase 3: Interactions (Day 2-3)
12. ✅ Implement tech stack unlock button
13. ✅ Implement copy email buttons
14. ✅ Implement toast notifications
15. ✅ Update credit display on unlock
16. ✅ Test multi-tab synchronization

### Phase 4: Polish (Day 3)
17. ✅ Add hover/focus states
18. ✅ Add transitions/animations (subtle)
19. ✅ Test responsive layouts
20. ✅ Test keyboard navigation
21. ✅ Add ARIA attributes
22. ✅ Cross-browser testing

---

## 12. Success Criteria

**Functional:**
- ✅ Page loads correctly with URL parameter
- ✅ Company data renders from state
- ✅ Tech stack unlock deducts 10 credits
- ✅ Unlocked state persists across page reloads
- ✅ Copy email buttons copy to clipboard
- ✅ Back navigation returns to table

**Visual:**
- ✅ Matches Figma design 95%+ fidelity
- ✅ Uses Elevate tokens consistently
- ✅ Responsive on desktop/tablet/mobile
- ✅ Smooth transitions and hover states

**Technical:**
- ✅ No console errors
- ✅ Clean, readable code
- ✅ Modular JavaScript (no global pollution)
- ✅ Accessible (keyboard, screen reader friendly)
- ✅ Fast rendering (<100ms for state hydration)

---

## 13. Handoff Notes for Implementation Agent

**Key Decisions Made:**
1. **Two-stage unlock**: Company unlock (table) + tech stack unlock (details page)
2. **URL-based navigation**: `?id=company-id` for bookmarkability
3. **State-first rendering**: All data comes from `G2ActivateState`, not hardcoded
4. **Toast notifications**: Simple, non-intrusive feedback
5. **Clipboard API**: Modern approach, fallback optional for MVP

**Watch Out For:**
- Ensure `contactsUnlocked` is set to `true` when company is unlocked from table (modify `unlockCompany()` in `prototype-state.js`)
- Avatar colors should use the 3-color palette: purple (#7C7FF2), blue (#4A9FF5), coral (#FF8374)
- Product icons in tech stack use checkmarks (✓), not emoji checkboxes
- Verified dates format: "Verified Dec 2025" (no year if current year)

**Files to Create:**
1. `/pages/prospect-details.html` — Main page (copy from `template-prospects.html`)
2. `/pages/prospect-details.js` — Controller module (new file)

**Files to Modify:**
1. `/prototype-state.js` — Add detailed company data, `unlockTechStack()`, `getCompanyById()`
2. `/pages/prospects-available.html` — Add link to details page on company name

**Assets Needed:**
- All exist in `/shared/` (icons, logos, tokens)
- No new assets required

**Estimated Complexity:**
- **HTML/CSS**: Medium (structured layout, 2 conditional states)
- **JavaScript**: Medium (URL params, state management, DOM manipulation)
- **Overall**: 6-8 hours for experienced developer

---

## Appendix A: Figma Design Reference

**File:** figma.com/design/7tZuGDPePNGXddvLMr3gqb  
**Main Node:** 4485:98572 (Prospect Details and Technology Stack)

**Key Frames:**
- **4485:98858** — Locked state (tech stack shows unlock button)
- **4485:99243** — Unlocked state (tech stack shows product grid)

**Visual Hierarchy:**
1. Page title: "Prospect Details: [Company Name]"
2. Company info card (metadata grid + description + products viewed)
3. Contacts section (3 cards in grid)
4. Tech stack section (conditional: locked button OR product grid)

**Color Palette (from Figma):**
- Avatar purple: #7C7FF2
- Avatar blue: #4A9FF5
- Avatar coral: #FF8374
- Success green: #0f5249 (for check icons)
- Verified badge background: #d0f6f1

**Typography:**
- Page title: 28px, 800 weight (elv-text-default)
- Section titles: 21px, 800 weight
- Body text: 16px, 400 weight
- Metadata labels: 14px, 600 weight
- Product names: 14px, 500 weight

---

## Appendix B: Code Snippets

### Toast Component CSS
```css
.toast {
  position: fixed;
  bottom: 24px;
  right: 24px;
  background: var(--bg-neutral-100);
  color: white;
  padding: 12px 20px;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 600;
  box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
  opacity: 0;
  transform: translateY(10px);
  transition: all 300ms ease;
  z-index: 10000;
}

.toast--show {
  opacity: 1;
  transform: translateY(0);
}

.toast--success {
  background: var(--bg-success);
}

.toast--error {
  background: var(--bg-destructive);
}
```

### Clipboard Fallback
```javascript
function copyToClipboard(text) {
  if (navigator.clipboard && navigator.clipboard.writeText) {
    return navigator.clipboard.writeText(text);
  } else {
    // Fallback for older browsers
    const textarea = document.createElement('textarea');
    textarea.value = text;
    textarea.style.position = 'fixed';
    textarea.style.opacity = '0';
    document.body.appendChild(textarea);
    textarea.select();
    const success = document.execCommand('copy');
    document.body.removeChild(textarea);
    return success ? Promise.resolve() : Promise.reject();
  }
}
```

---

**End of Specification**

This document provides complete architectural guidance for implementing the Prospect Details page. All data structures, interaction patterns, and visual specifications are defined. Ready for implementation.
