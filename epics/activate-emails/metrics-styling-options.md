# Metrics Styling Options

## Option 1: Subtle Background Boxes
Clean, separated boxes with light backgrounds for each metric group.

```html
<table cellpadding="8" cellspacing="4" border="0" style="margin: 0 0 12px 0;">
  <tr>
    <td style="background-color: #F8F8F8; border-radius: 6px; padding: 8px 12px; font-size: 14px; color: #555555;">
      <strong style="font-size: 18px; color: #333333;">15</strong> Small Business
    </td>
    <td style="background-color: #F8F8F8; border-radius: 6px; padding: 8px 12px; font-size: 14px; color: #555555;">
      <strong style="font-size: 18px; color: #333333;">23</strong> Mid-Market
    </td>
    <td style="background-color: #F8F8F8; border-radius: 6px; padding: 8px 12px; font-size: 14px; color: #555555;">
      <strong style="font-size: 18px; color: #333333;">12</strong> Enterprise
    </td>
  </tr>
</table>
<p style="margin: 0; font-size: 14px; color: #555555;">
  Top locations: <strong>San Francisco, New York, Austin</strong>
</p>
```

**Visual:** Three light gray boxes side-by-side, each with a larger number and smaller label.

---

## Option 2: Number-First Vertical Stack
Modern approach with large numbers stacked above labels.

```html
<table cellpadding="0" cellspacing="0" border="0" style="margin: 0 0 16px 0;">
  <tr>
    <td align="center" style="padding: 0 16px 0 0;">
      <div style="font-size: 24px; font-weight: bold; color: #5746B2; line-height: 1.2; margin: 0 0 4px 0;">15</div>
      <div style="font-size: 12px; color: #888888; line-height: 1.2;">Small Business</div>
    </td>
    <td align="center" style="padding: 0 16px;">
      <div style="font-size: 24px; font-weight: bold; color: #5746B2; line-height: 1.2; margin: 0 0 4px 0;">23</div>
      <div style="font-size: 12px; color: #888888; line-height: 1.2;">Mid-Market</div>
    </td>
    <td align="center" style="padding: 0 0 0 16px;">
      <div style="font-size: 24px; font-weight: bold; color: #5746B2; line-height: 1.2; margin: 0 0 4px 0;">12</div>
      <div style="font-size: 12px; color: #888888; line-height: 1.2;">Enterprise</div>
    </td>
  </tr>
</table>
<p style="margin: 0; font-size: 14px; color: #555555;">
  Top locations: <strong>San Francisco, New York, Austin</strong>
</p>
```

**Visual:** Large purple numbers centered above smaller gray labels, creating a dashboard-like feel.

---

## Option 3: Inline Pills with Dividers
Compact, tag-like pills with clean dividers between metrics.

```html
<p style="margin: 0 0 12px 0; font-size: 14px; color: #555555; line-height: 1.8;">
  <span style="display: inline-block; background-color: #F0EDF9; color: #5746B2; padding: 4px 10px; border-radius: 12px; margin-right: 6px; white-space: nowrap;">
    <strong>15</strong> Small Business
  </span>
  <span style="display: inline-block; background-color: #F0EDF9; color: #5746B2; padding: 4px 10px; border-radius: 12px; margin-right: 6px; white-space: nowrap;">
    <strong>23</strong> Mid-Market
  </span>
  <span style="display: inline-block; background-color: #F0EDF9; color: #5746B2; padding: 4px 10px; border-radius: 12px; white-space: nowrap;">
    <strong>12</strong> Enterprise
  </span>
</p>
<p style="margin: 0; font-size: 14px; color: #555555;">
  Top locations: <strong>San Francisco, New York, Austin</strong>
</p>
```

**Visual:** Light purple pill-shaped tags with the brand color, inline and compact like GitHub labels.

---

## Recommendation

**Option 2** (Number-First Vertical Stack) is the most modern and scannable, with the purple accent reinforcing the brand. **Option 3** (Inline Pills) is the most compact and trendy. **Option 1** (Background Boxes) is the safest for maximum email client compatibility.
