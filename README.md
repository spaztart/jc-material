# McAfee Design Tokens (MVP)

Material 3 + McAfee Brand Token Infrastructure

## 🎯 Overview

This is an MVP token system that combines **Material 3's design system** with **McAfee brand overrides**. It uses a layered architecture compatible with **Token Studio** (Figma plugin) and **Style Dictionary** for multi-platform builds.

## 📁 Structure

```
tokens/
├── core/
│   ├── brand.json           # Foundation: McAfee brand colors
│   └── m3-semantic.json     # Material 3 semantic tokens
├── themes/
│   ├── light.json           # Light theme configuration
│   └── dark.json            # Dark theme configuration
├── components/
│   ├── button.json          # Button overrides (black primary)
│   ├── form.json            # Checkbox/radio (blue selected)
│   └── card.json            # Card variants (white/gray/gradients)
├── $themes.json             # Token Studio theme config
└── $metadata.json           # Token set order
```

## 🎨 Token Layers

### 1. **Foundation Layer** (`core/brand.json`)
Raw brand color primitives:
- `brand.red` → `#C01818` (McAfee red)
- `brand.blue` → `#0077CD` (McAfee blue)
- `brand.black` → `#000000` (Primary actions)
- `neutral.{0-1000}` → Gray scale
- `gradient.*` → Expressive gradients for cards

### 2. **Semantic Layer** (`core/m3-semantic.json`)
Material 3 system tokens that reference M3 palettes:
- `m3.sys.light.*` → Light theme semantic tokens
- `m3.sys.dark.*` → Dark theme semantic tokens
- `m3.ref.palette.*` → Tonal palettes (0-100)

### 3. **Component Layer** (`components/*.json`)
Brand-specific overrides:
- **Buttons**: Black primary (not M3 primary color)
- **Checkboxes/Radio**: Blue selected state
- **Cards**: Multiple variants (default, subtle, elevated, expressive)

## 🔧 McAfee Brand Overrides

| Component | M3 Default | McAfee Override |
|-----------|-----------|-----------------|
| Primary Button | `m3.sys.primary` | `brand.black` |
| Checkbox Selected | `m3.sys.primary` | `brand.blue` |
| Radio Selected | `m3.sys.primary` | `brand.blue` |
| Card Default | `m3.sys.surface` | `brand.white` |
| Card Expressive | N/A | `gradient.*` |

## 🚀 Usage

### Install Dependencies
```bash
npm install
```

### Build Tokens
```bash
npm run build
```

Outputs:
- `build/css/variables.css` → CSS custom properties
- `build/scss/_variables.scss` → SCSS variables
- `build/js/tokens.js` → JavaScript ES6 module
- `build/js/tokens.d.ts` → TypeScript declarations

### Watch Mode
```bash
npm run build:watch
```

## 🎭 Token Studio Integration

1. Open Figma with Token Studio plugin
2. Load tokens from `tokens/` directory
3. Select theme: Light or Dark
4. Token sets are automatically loaded in order:
   - `core/brand` → Foundation colors
   - `core/m3-semantic` → M3 system
   - `themes/{light|dark}` → Theme-specific
   - `components/*` → Component overrides

## 📦 Card Variants

```json
card.default          → White background
card.subtle           → Light gray (neutral.50)
card.elevated         → White with shadow
card.expressive.*     → Gradient backgrounds:
  - blue-purple       → Purple gradient
  - ocean             → Blue gradient
  - sunset            → Red gradient
  - slate             → Gray gradient
```

## 🎨 Example Usage

### CSS
```css
.button-primary {
  background: var(--button-primary-background); /* black */
  color: var(--button-primary-text); /* white */
}

.checkbox:checked {
  background: var(--checkbox-selected-background); /* blue */
}

.card-expressive {
  background: var(--card-expressive-ocean-background); /* gradient */
}
```

### Token References
Tokens use `{}` syntax for references:
```json
{
  "button": {
    "primary": {
      "background": {
        "$value": "{brand.black}"  // References brand.json
      }
    }
  }
}
```

## 🔄 Extending the System

### Add New Brand Color
Edit `tokens/core/brand.json`:
```json
{
  "brand": {
    "green": {
      "$value": "#00FF00"
    }
  }
}
```

### Add New Component
Create `tokens/components/yourcomponent.json`:
```json
{
  "yourcomponent": {
    "property": {
      "$value": "{brand.blue}"
    }
  }
}
```

Update `tokens/$metadata.json` to include the new set.

## 📚 Resources

- [Material 3 Design](https://m3.material.io/)
- [Token Studio Plugin](https://tokens.studio/)
- [Style Dictionary](https://amzn.github.io/style-dictionary/)

## 🎯 Next Steps

- [ ] Add spacing/sizing tokens
- [ ] Add typography tokens
- [ ] Add elevation/shadow system
- [ ] Add animation/motion tokens
- [ ] Create component documentation
- [ ] Add real McAfee brand colors
- [ ] Set up CI/CD for token builds
