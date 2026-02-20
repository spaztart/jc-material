# jc-material

Material Design 3 implementation with custom design tokens from Figma.

## Overview

This project integrates Material Web components with custom design tokens exported from Figma. The tokens are stored in the `tokens/` folder and mapped to Material Web's CSS custom properties.

## Setup

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Include the token CSS file in your HTML:**
   ```html
   <link rel="stylesheet" href="material-tokens.css">
   ```

3. **Import Material Web components:**
   ```html
   <script type="module">
     import '@material/web/button/filled-button.js';
     // ... other components
   </script>
   ```

## Token Structure

### Tokens Folder
- `tokens/material/` - Base Material Design tokens (reference palette, typography, spacing)
  - `default.json` - Default theme tokens
  - `rga.json` - RGA variant tokens
- `tokens/modes/` - Theme mode variations
  - `default/` - Default theme modes (light, dark, contrast variants)
  - `rga/` - RGA theme modes

### Generated CSS
The `material-tokens.css` file contains all design tokens mapped to Material Web CSS custom properties:
- **Reference Palette**: `--md-ref-palette-*`
- **System Colors**: `--md-sys-color-*`
- **Typography**: `--md-sys-typescale-*`
- **Spacing**: `--md-sys-spacing-*`
- **State Layers**: `--md-sys-state-*`

## Usage

### Using Material Web Components
Material Web components automatically consume the CSS custom properties defined in `material-tokens.css`:

```html
<md-filled-button>Click me</md-filled-button>
<md-outlined-text-field label="Enter text"></md-outlined-text-field>
```

### Using Tokens in Custom CSS
You can reference the tokens in your own styles:

```css
.my-component {
  background-color: var(--md-sys-color-primary);
  color: var(--md-sys-color-on-primary);
  font-family: var(--md-sys-typescale-body-large-font);
  padding: var(--md-sys-spacing-400);
}
```

## Development

### Viewing the Demo
Open `index.html` in a browser to see Material Web components styled with your custom tokens.

### Updating Tokens
1. Export tokens from Figma to the `tokens/` folder
2. Regenerate `material-tokens.css` to reflect the updated values
3. The Material Web components will automatically use the new token values

## Token Categories

### Colors
- **Primary**: Main brand color
- **Secondary**: Supporting color
- **Tertiary**: Accent color
- **Error**: Error states
- **Surface**: Background surfaces
- **Outline**: Borders and dividers

### Typography
- **Display**: Large, impactful text (large, medium, small)
- **Headline**: Section headers (large, medium, small)
- **Title**: Subsection titles (large, medium, small)
- **Body**: Main content text (large, medium, small)
- **Label**: UI labels (large, medium, small)

### Spacing
Consistent spacing scale from 100 (4px) to 1200 (48px)
