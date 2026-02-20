# Development Guidelines for Figma Make

## **CRITICAL: Strict Technology Stack Requirements**

This repository uses a **specific, locked-down technology stack**. When Figma Make reads this repository, it **MUST** adhere to the following rules without exception.

---

## **Permitted Technologies ONLY**

### **1. Material Web Components**
- **ONLY** use Material Web (Material Design 3) components
- **NO** React, Vue, Angular, Svelte, or any other UI framework
- **NO** Tailwind CSS, Bootstrap, or any other CSS framework
- All components must be **native Web Components** (Custom Elements)

### **2. Icons**
- **ONLY** use Material Symbols Outlined font
- Import via: `https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200`
- **NO** other icon libraries (Font Awesome, Heroicons, etc.)

### **3. Design Tokens**
- **ONLY** use the RGA design tokens defined in `/material-tokens.css`
- **MUST** reference CSS custom properties from the token file
- **NO** hardcoded colors, spacing, or typography values
- **NO** external design systems or token libraries

### **4. Custom Components**
- **ONLY** use the Safety Companion (sc-*) components in `/components/`
- Use components **exactly as they are** - do not modify or extend them
- **NO** creating new variants unless explicitly requested by the user
- **NO** changing component APIs, attributes, or events

---

## **Strict Implementation Rules**

### **Component Usage**
1. **Use existing components as-is**
   - Do not modify component structure
   - Do not change component styling
   - Do not alter component behavior
   - Do not add new features unless user explicitly requests

2. **Available Safety Companion Components:**
   - `sc-top-navbar` - Top navigation bar
   - `sc-chat-bubble` - Chat message bubbles (Send/Reply)
   - `sc-chip` - Status chips with multiple states
   - `sc-label-carousel` - Horizontal scrollable filter chips
   - `sc-progress-indicator` - Loading spinner
   - `sc-button-list` - Action button rows
   - `sc-feedback` - Thumbs up/down feedback
   - `sc-salutation` - Greeting text
   - `sc-side-sheet` - Sidebar navigation
   - `sc-horizontal-card` - Status/issue cards
   - `sc-bottom-text-input` - Chat input field

3. **Component Integration:**
   - Import components via `<script type="module" src="./components/[component-name].js"></script>`
   - Use standard HTML custom element syntax: `<sc-component-name></sc-component-name>`
   - Configure via HTML attributes only
   - Listen to custom events as documented in `/components/README.md`

### **Styling Rules**
1. **ONLY** use CSS custom properties from `/material-tokens.css`
2. **NO** inline styles with hardcoded values
3. **NO** external CSS frameworks or libraries
4. **NO** CSS-in-JS solutions
5. Follow existing component patterns for new styles

### **Code Patterns**
1. **Native Web Components:**
   ```javascript
   export class ComponentName extends HTMLElement {
     constructor() {
       super();
       this.attachShadow({ mode: 'open' });
     }
     // ... rest of implementation
   }
   customElements.define('component-name', ComponentName);
   ```

2. **Token Usage:**
   ```css
   color: var(--md-sys-color-primary);
   font-family: var(--md-sys-typescale-body-medium-font);
   ```

3. **Material Symbols:**
   ```html
   <span class="material-symbols-outlined">icon_name</span>
   ```

---

## **Forbidden Actions**

### **NEVER:**
- Convert to React, Vue, Angular, or any framework
- Use Tailwind CSS, Bootstrap, or any CSS framework
- Install npm packages for UI components or styling
- Modify existing component implementations without user direction
- Add TypeScript unless explicitly requested
- Use external icon libraries
- Hardcode design values (colors, spacing, fonts)
- Create new component variants without user approval
- Change component APIs or event signatures
- Use CSS frameworks or preprocessors (SASS, LESS, etc.)
- Implement responsive utilities from frameworks
- Add animation libraries
- Use state management libraries (Redux, Zustand, etc.)

---

## **When User Requests Changes**

### **Permitted Modifications:**
1. **User explicitly requests** a change to a component
2. **User asks** to create a new component following existing patterns
3. **User specifies** new attributes or events for components
4. **User provides** new design tokens to add

### **Required Confirmation:**
Before making any of these changes, confirm:
- The change aligns with Material Web principles
- The change uses only permitted technologies
- The change follows existing code patterns
- The change uses RGA design tokens

---

## **File Structure**

```
/components/          # Safety Companion components (sc-*)
/assets/             # SVG assets (logos, icons)
/material-tokens.css # RGA design tokens (ONLY source of truth)
/demo.html           # Component demonstrations
/README.md           # Project documentation
```

---

## **Design Token Reference**

All design values **MUST** come from `/material-tokens.css`:

- **Colors:** `--md-sys-color-*`
- **Typography:** `--md-sys-typescale-*`
- **Spacing:** Use standard CSS values, but prefer token-based sizing
- **Elevation:** `--md-sys-elevation-*`

---

## **Summary**

**Figma Make MUST:**
✅ Use Material Web components only  
✅ Use Material Symbols Outlined icons only  
✅ Use RGA design tokens from `/material-tokens.css`  
✅ Use existing sc-* components as-is  
✅ Follow native Web Component patterns  
✅ Respect component APIs and events  

**Figma Make MUST NOT:**
❌ Use React, Vue, or any framework  
❌ Use Tailwind, Bootstrap, or any CSS framework  
❌ Modify components without user direction  
❌ Add external libraries or dependencies  
❌ Hardcode design values  
❌ Create new component variants without approval  

---

## **Enforcement**

These guidelines are **non-negotiable**. Any code generation that violates these rules should be rejected and regenerated following the correct patterns.

If uncertain about a requirement, **default to using existing components and tokens exactly as they are** rather than creating new solutions.
