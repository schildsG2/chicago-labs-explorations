# Next Steps: Capturing ElevenLabs Visual Examples

This document provides actionable next steps to obtain actual UI screenshots that were not available through web research alone.

---

## Immediate Actions (No Account Required)

### 1. App Store Screenshots

Visit these pages and capture all available screenshots showing the UI:

**iOS - Main App:**
- URL: https://apps.apple.com/us/app/elevenlabs-ai-voice-generator/id6743162587
- Look for: Credit balance display, subscription prompts, voice generation interface
- Screenshot tool: Browser screenshot extension

**iOS - Reader App:**
- URL: https://apps.apple.com/us/app/elevenreader-read-text-aloud/id6479373050
- Look for: Credit usage indicators, premium upgrade prompts
- Screenshot tool: Browser screenshot extension

**Android - Google Play:**
- URL: https://elevenlabs.io/mobile (redirects to Play Store)
- Look for: Similar credit/subscription UI on Android
- Note any platform differences in pricing presentation

### 2. Public Demo/Showcase Pages

**ElevenLabs UI Showcase:**
- URL: https://ui.elevenlabs.io/
- Component library with live demos
- May show credit/usage UI components

**Project Showcase:**
- URL: https://showcase.elevenlabs.io/
- Featured projects and demos
- May contain UI previews

---

## Free Account Actions (No Payment Required)

### 3. Sign Up for Free Tier

1. Visit: https://elevenlabs.io/
2. Sign up for free account (10,000 credits/month)
3. Capture these screens:

**Onboarding Flow:**
- [ ] Welcome screen
- [ ] Initial credit grant notification
- [ ] Dashboard first-view
- [ ] Pricing tier explanation

**Dashboard Views:**
- [ ] Main dashboard with credit balance indicator
- [ ] Character/credit quota display
- [ ] Usage tracking interface
- [ ] Free plan limitations messaging

**Navigation:**
- [ ] Sidebar navigation (full menu)
- [ ] Profile menu (top-right)
- [ ] Subscription page (via Profile → Subscription)

**Developers Tab:**
- [ ] Sidebar → Developers → Usage tab
- [ ] Credit breakdown by voice/product
- [ ] Day/week/month view toggles
- [ ] CSV export interface

### 4. Trigger Upgrade Prompts

**Test approaching limits:**
- [ ] Use credits until ~90% consumed
- [ ] Capture warning messages/prompts
- [ ] Document when upgrade suggestions appear

**Hit quota limit:**
- [ ] Exhaust all 10,000 free credits
- [ ] Capture "out of credits" experience
- [ ] Document upgrade pathways offered

**Explore upgrade options:**
- [ ] Click any "Upgrade" buttons
- [ ] Capture plan comparison modal/page
- [ ] Screenshot checkout flow (stop before payment)

---

## Paid Account Actions (Requires Payment)

### 5. Subscribe to Starter Plan ($5/month)

**Cancel anytime, but capture:**
- [ ] Checkout/payment flow
- [ ] Payment method selection screen
- [ ] Confirmation screen
- [ ] Email receipt/invoice

**Post-subscription dashboard:**
- [ ] Updated credit quota display (30,000 credits)
- [ ] "Commercial rights" indicator/badge
- [ ] Invoice history page
- [ ] Billing settings interface

**Usage-based billing:**
- [ ] Navigate to subscription settings
- [ ] Locate usage-based billing toggle
- [ ] Capture enable/disable interface
- [ ] Screenshot explanation/help text

### 6. Test Upgrade Flow

**Starter → Creator upgrade:**
- [ ] Click upgrade button
- [ ] Capture plan comparison shown during upgrade
- [ ] Screenshot prorated billing explanation
- [ ] Document credit carry-forward messaging

**Monitor first billing cycle:**
- [ ] Credit reset notification
- [ ] Monthly renewal confirmation
- [ ] Invoice delivery
- [ ] Credit rollover (if unused credits remain)

---

## Research & Documentation Actions

### 7. YouTube Tutorial Hunting

Search queries to try:
- "elevenlabs tutorial 2026"
- "elevenlabs pricing explained"
- "elevenlabs dashboard tour"
- "how to use elevenlabs"
- "elevenlabs review walkthrough"

**Look for:**
- Screen recordings showing actual UI
- Dashboard walkthroughs
- Subscription management demos
- Credit usage demonstrations

**Tools:**
- Pause videos at key UI moments
- Screenshot using video player tools
- Note timestamp for reference

### 8. Product Hunt / Launch Posts

**Search:**
- Product Hunt: "elevenlabs" (launches often include screenshots)
- Hacker News: "elevenlabs" (users sometimes share UI)
- Reddit: r/artificial, r/MachineLearning (user discussions with screenshots)

### 9. Community & Social

**Twitter/X:**
- Search: "elevenlabs pricing" (users sharing subscription screenshots)
- Search: "elevenlabs dashboard" (UI shares)
- Look for verified ElevenLabs account posts

**Discord/Slack:**
- Find ElevenLabs community channels
- Ask members to share anonymized subscription screenshots
- Note: Get permission before using user-shared images

---

## Technical Capture Methods

### 10. Browser Developer Tools

If JavaScript-rendered content blocks WebFetch:

1. Visit https://elevenlabs.io/pricing in browser
2. Open DevTools (F12)
3. Wait for full page render
4. Network tab → clear → reload → capture all image URLs
5. Elements tab → screenshot full page (Firefox/Chrome extensions)
6. Save rendered HTML (not just source)

### 11. Playwright/Puppeteer Automation

For programmatic screenshot capture:

```javascript
// Example: Capture pricing page
const playwright = require('playwright');

(async () => {
  const browser = await playwright.chromium.launch();
  const page = await browser.newPage();
  
  await page.goto('https://elevenlabs.io/pricing');
  await page.waitForSelector('[data-testid="pricing-table"]'); // Adjust selector
  
  await page.screenshot({
    path: 'elevenlabs-pricing-page.png',
    fullPage: true
  });
  
  await browser.close();
})();
```

---

## Screenshot Organization

Save all captured images to:
`/Users/schilds/projects/bulk-purchase-explorations/screenshot-references/elevenlabs/`

### Naming Convention:

- `pricing-page-YYYY-MM-DD.png`
- `dashboard-main-YYYY-MM-DD.png`
- `dashboard-credits-balance-YYYY-MM-DD.png`
- `subscription-settings-YYYY-MM-DD.png`
- `checkout-flow-step1-YYYY-MM-DD.png`
- `usage-analytics-tab-YYYY-MM-DD.png`
- `upgrade-modal-YYYY-MM-DD.png`
- `out-of-credits-prompt-YYYY-MM-DD.png`
- `invoice-example-YYYY-MM-DD.png`
- `mobile-ios-credits-YYYY-MM-DD.png`
- `mobile-android-subscription-YYYY-MM-DD.png`

### Metadata File:

For each screenshot, create a companion `.txt` or note in README:
- Date captured
- Account tier used (free/starter/creator/etc.)
- Source URL
- Context (what action triggered this screen)
- Notable UI elements highlighted

---

## Priority Queue

**High Priority (Do First):**
1. ✅ App Store screenshots (iOS main app)
2. ✅ App Store screenshots (iOS reader app)
3. ⬜ Free account signup + dashboard capture
4. ⬜ Developers tab → Usage analytics
5. ⬜ Subscription page view (free tier)

**Medium Priority:**
6. ⬜ Starter plan checkout flow
7. ⬜ Usage-based billing toggle
8. ⬜ YouTube tutorial screenshots
9. ⬜ Playwright automated capture of pricing page

**Low Priority (Nice to Have):**
10. ⬜ Upgrade flow testing (Starter → Creator)
11. ⬜ Mobile app installed screenshots
12. ⬜ Invoice/billing history examples
13. ⬜ Community-sourced screenshots

---

## Legal & Ethical Considerations

- ✅ App Store screenshots are public marketing materials (OK to use)
- ✅ Free tier screenshots from your own account (OK to use)
- ✅ Public YouTube tutorials (OK with attribution)
- ⚠️ Paid tier screenshots - redact any personal info
- ⚠️ User-shared screenshots - get explicit permission
- ❌ Don't share API keys, payment details, or personal data
- ❌ Don't violate ElevenLabs ToS for research purposes

---

## Contact ElevenLabs Directly

If visual research materials are needed for competitive analysis:

**Option 1: Press/Media Kit Request**
- Email: press@elevenlabs.io or support@elevenlabs.io
- Request: "Press kit with UI screenshots for market research"
- Explain: Non-commercial research purpose

**Option 2: Partnership Inquiry**
- If building complementary product
- May receive detailed materials under NDA

**Option 3: Customer Success**
- If subscribed user
- Ask for onboarding materials/tutorials with screenshots

---

## Success Criteria

Research is complete when you have captured:
- ✅ Pricing page visual layout
- ✅ Credit balance display (desktop)
- ✅ Credit balance display (mobile)
- ✅ Subscription management interface
- ✅ Usage analytics dashboard
- ✅ Checkout/upgrade flow
- ✅ Out-of-credits experience
- ✅ Usage-based billing toggle
- ✅ Invoice/billing example
- ✅ Plan comparison table/modal

---

## Timeline Estimate

- **Day 1 (1 hour):** App store screenshots, public pages
- **Day 2 (2 hours):** Free account signup, dashboard exploration
- **Day 3 (1 hour):** Developers tab, usage analytics
- **Day 4 (2 hours):** Starter plan purchase, checkout capture
- **Day 5 (1 hour):** Usage-based billing, settings exploration
- **Day 6 (2 hours):** Video research, community sources
- **Day 7 (1 hour):** Organization, annotation, README updates

**Total:** ~10 hours of focused research

---

## Questions to Answer Through Visual Research

As you capture screenshots, document answers to:

1. **Where is credit balance shown?**
   - Header? Sidebar? Dashboard widget?
   - Always visible or requires navigation?

2. **How are limits communicated?**
   - Progress bar? Percentage? Plain number?
   - Warning thresholds (80%? 90%? 100%)?

3. **What triggers upgrade prompts?**
   - Proactive (on login)? Reactive (when limit hit)?
   - Interstitial modals? Banner notifications?

4. **How is usage-based billing presented?**
   - Simple toggle? Explanation modal?
   - Overage rate disclosure timing?

5. **What does checkout flow look like?**
   - Single page? Multi-step?
   - Payment methods shown?
   - Immediate activation or delayed?

6. **How are subscriptions visualized?**
   - Cards? Table? List?
   - Current plan highlighting?
   - Feature comparison inline?

---

Last updated: 2026-04-10
