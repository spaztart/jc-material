# Safety Companion Components

A collection of custom web components built with Material Web and RGA design tokens for the Safety Companion application.

## Overview

These components follow Material Design 3 principles and use the RGA design system tokens. All components are built as native Web Components (Custom Elements) and can be used in any web application without framework dependencies.

## Components

### sc-salutation

Dedicated text element used for greetings or welcome messaging. Appears only on the homepage or welcome screen.

**Features:**
- **Two-line layout** - Greeting on first line, name on second line
- **Dynamic greetings** - Supports "Good morning", "Good afternoon", "Welcome back", etc.
- **Custom name** - Displays user's full name
- **Typographically distinct** - Large, prominent text for page anchoring
- **Non-interactive** - Pure display component
- **RGA design tokens** - Uses on-surface color

**Usage:**

```html
<!-- Default -->
<sc-salutation></sc-salutation>

<!-- Custom greeting -->
<sc-salutation greeting="Good morning" name="John Smith"></sc-salutation>

<!-- Welcome message -->
<sc-salutation greeting="Welcome back" name="Jane Doe"></sc-salutation>
```

**Attributes:**

| Attribute | Type | Default | Description |
|-----------|------|---------|-------------|
| `greeting` | string | `"Good afternoon"` | Greeting text (e.g., "Good morning", "Welcome back") |
| `name` | string | `"Evangelina Schwarzenegger"` | User's full name to display |

**Typography:**
- **Font**: Poppins
- **Size**: 22px
- **Line height**: 28px
- **Letter spacing**: -0.5px
- **Greeting**: Regular weight (400)
- **Name**: Medium weight (500)
- **Color**: on-surface (#1C1B1D)

**Use Cases:**
- Homepage welcome message
- Dashboard greeting
- Profile page header
- Time-based greetings (morning, afternoon, evening)

---

### sc-feedback

Provides lightweight, inline post-interaction feedback. Functions like ChatGPT's "Was this helpful?" module.

**Features:**
- **Three states** - Default, Positive (thumbs up), Negative (thumbs down)
- **Single-select** - Only one option can be selected at a time
- **Toggle behavior** - Click again to deselect
- **Material icons** - Thumbs up/down with filled state
- **Custom text** - Configurable feedback prompt
- **RGA design tokens** - Uses outline and primary colors

**Usage:**

```html
<!-- Default -->
<sc-feedback></sc-feedback>

<!-- Custom text -->
<sc-feedback text="Did this answer your question?"></sc-feedback>

<!-- With chat bubble -->
<sc-chat-bubble chat="Reply" message="Here's the answer..."></sc-chat-bubble>
<sc-feedback></sc-feedback>
```

**Attributes:**

| Attribute | Type | Default | Description |
|-----------|------|---------|-------------|
| `text` | string | `"Was this helpful?"` | Feedback prompt text |
| `state` | string | `"default"` | Current state: "default", "positive", or "negative" |

**Events:**

| Event | Description | Detail |
|-------|-------------|--------|
| `feedback-change` | Fired when feedback state changes | `{ state: "default" \| "positive" \| "negative" }` |

**Example with event listener:**

```javascript
const feedback = document.querySelector('sc-feedback');

feedback.addEventListener('feedback-change', (e) => {
  console.log('Feedback state:', e.detail.state);
  // Send feedback to analytics or backend
});
```

**Visual States:**
- **Default**: Both icons outlined in outline color
- **Positive**: Thumbs up filled with primary color
- **Negative**: Thumbs down filled with primary color
- **Hover**: Icon scales up slightly (1.1x)
- **Active**: Icon scales down on click (0.95x)

---

### sc-button-list

Row or group of compact action buttons displayed at the end of a prompt. Suggests next steps the user can take, similar to ChatGPT's suggested action chips.

**Features:**
- **Two border styles** - Default (no border) and Border (primary color border)
- **Leading reply icon** - Rotated 180° reply arrow
- **Trailing external link icon** - Open in new indicator
- **Custom text** - Configurable button label
- **Interactive** - Clickable with hover and active states
- **RGA design tokens** - Uses primary color for text and border

**Usage:**

```html
<!-- Default (no border) -->
<sc-button-list></sc-button-list>

<!-- With border -->
<sc-button-list border="border"></sc-button-list>

<!-- Custom text -->
<sc-button-list link-text="Learn more"></sc-button-list>

<!-- Without icons -->
<sc-button-list show-icon="false" show-trailing-icon="false" link-text="Text only"></sc-button-list>
```

**Attributes:**

| Attribute | Type | Default | Description |
|-----------|------|---------|-------------|
| `border` | string | `"default"` | Border style: "default" or "border" |
| `link-text` | string | `"Link text"` | Button label text |
| `show-icon` | boolean | `true` | Show or hide leading reply icon |
| `show-text` | boolean | `true` | Show or hide button text |
| `show-trailing-icon` | boolean | `true` | Show or hide trailing external link icon |

**Events:**

| Event | Description |
|-------|-------------|
| `click` | Fired when the button is clicked |

**Example with event listener:**

```javascript
const button = document.querySelector('sc-button-list');

button.addEventListener('click', () => {
  console.log('Button clicked');
  // Trigger navigation or action
});
```

**Visual States:**
- **Default**: No border, 5px rounded corners
- **Border**: Primary color border, 12px rounded corners
- **Hover**: Surface-container background
- **Active**: Scale down effect

---

### sc-progress-indicator

Loading animation used to show active processing. Behaves similarly to ChatGPT typing/loading indicator.

**Features:**
- **Circular progress ring** - Red progress indicator (0-100%)
- **Animated thinking bubbles** - Pulsing dots that indicate active processing
- **McAfee logo** - Centered brand icon within the progress circle
- **Custom loading text** - Configurable message below the indicator
- **Smooth transitions** - Progress updates animate smoothly
- **RGA design tokens** - Uses error color for progress ring

**Usage:**

```html
<!-- Basic usage -->
<sc-progress-indicator value="60"></sc-progress-indicator>

<!-- Different progress values -->
<sc-progress-indicator value="0"></sc-progress-indicator>
<sc-progress-indicator value="20"></sc-progress-indicator>
<sc-progress-indicator value="100"></sc-progress-indicator>

<!-- Custom loading text -->
<sc-progress-indicator value="40" loading-text="Processing your request..."></sc-progress-indicator>

<!-- Without logo -->
<sc-progress-indicator value="60" show-logo="false"></sc-progress-indicator>

<!-- Without thinking bubbles -->
<sc-progress-indicator value="80" show-loading-bubbles="false"></sc-progress-indicator>
```

**Attributes:**

| Attribute | Type | Default | Description |
|-----------|------|---------|-------------|
| `value` | number | `0` | Progress value (0, 20, 40, 60, 80, 100) |
| `loading-text` | string | `"On it! Just a moment..."` | Text to display below the progress indicator |
| `show-loading-bubbles` | boolean | `true` | Show or hide animated thinking bubbles |
| `show-loading-text` | boolean | `true` | Show or hide loading text |
| `show-logo` | boolean | `true` | Show or hide McAfee logo in center |

**Visual Elements:**
- **Progress ring**: Red (`--md-sys-color-error`) circular progress indicator
- **Track**: Light gray (`--md-sys-color-surface-variant`) background circle
- **Thinking bubbles**: Animated pulsing dots with staggered timing
- **Logo**: McAfee brand icon centered in the circle
- **Text**: Body-medium typography with on-surface-variant color

---

### sc-label-carousel

Horizontal scrollable container of filter chips. Filter chips use tags or descriptive words to filter content.

**Features:**
- **Horizontal scrolling** - Smooth overflow with hidden scrollbar
- **Selectable chips** - Click to toggle selection state
- **Custom labels** - JSON array or comma-separated string
- **Selection tracking** - Emits events with selected indices and labels
- **RGA design tokens** - Uses tertiary-container for selected, outline-variant for deselected
- **Responsive** - Adapts to container width

**Usage:**

```html
<!-- Default (8 "Label" items) -->
<sc-label-carousel></sc-label-carousel>

<!-- Custom labels (JSON array) -->
<sc-label-carousel labels='["All", "Security", "Privacy", "Updates"]'></sc-label-carousel>

<!-- Custom labels (comma-separated) -->
<sc-label-carousel labels="Home, Work, Personal, Family"></sc-label-carousel>
```

**Attributes:**

| Attribute | Type | Default | Description |
|-----------|------|---------|-------------|
| `labels` | string \| array | 8 "Label" items | JSON array or comma-separated string of label texts |

**Events:**

| Event | Description | Detail |
|-------|-------------|--------|
| `selection-change` | Fired when chip selection changes | `{ selected: number[], labels: string[] }` |

**Example with event listener:**

```javascript
const carousel = document.querySelector('sc-label-carousel');

carousel.addEventListener('selection-change', (e) => {
  console.log('Selected indices:', e.detail.selected);
  console.log('Selected labels:', e.detail.labels);
});
```

**Visual States:**
- **Deselected**: Transparent background with outline-variant border
- **Selected**: Tertiary-container background, no border
- **Hover**: Slight opacity change
- **Active**: Scale down effect on click

---

### sc-chip

Compact, at-a-glance status indicator. Primarily used within cards to communicate high-level states.

**Features:**
- **7 state variants** - Safe, In progress, Resolved, Recommended, Critical, Dismissed, Completed
- Optional leading icon (Material Symbols)
- Optional trailing close icon (clickable)
- Custom labels
- Uses RGA design tokens for colors
- Non-interactive (except close icon)

**Usage:**

```html
<!-- Basic usage -->
<sc-chip state="Safe"></sc-chip>

<!-- Different states -->
<sc-chip state="Critical"></sc-chip>
<sc-chip state="In progress"></sc-chip>
<sc-chip state="Completed"></sc-chip>

<!-- Custom label -->
<sc-chip state="Safe" label="All Clear"></sc-chip>

<!-- Without icons -->
<sc-chip state="Safe" show-icon="false"></sc-chip>
<sc-chip state="Critical" show-trailing-icon="false"></sc-chip>
```

**Attributes:**

| Attribute | Type | Default | Description |
|-----------|------|---------|-------------|
| `state` | string | `"Safe"` | State variant: "Safe", "In progress", "Resolved", "Recommended", "Critical", "Dismissed", "Completed" |
| `label` | string | state value | Custom label text to display |
| `show-icon` | boolean | `true` | Show or hide the leading icon |
| `show-trailing-icon` | boolean | `true` | Show or hide the trailing close icon |

**Events:**

| Event | Description |
|-------|-------------|
| `close` | Fired when the trailing close icon is clicked |

**State Colors:**

- **Safe**: positive (teal) background
- **In progress**: tertiary-container (light purple) background
- **Resolved**: positive-container (cyan) background
- **Recommended**: warning-container (orange) background
- **Critical**: error (red) background
- **Dismissed**: surface-container-high (gray) background
- **Completed**: positive-container (cyan) background

---

### sc-chat-bubble

Standard message container used in conversational flows. Mirrors the interaction and visual behavior of ChatGPT's chat bubbles.

**Features:**
- **Send variant** - User messages anchored to the right with tertiary color
- **Reply variant** - Assistant messages anchored to the left with neutral background
- Supports multi-line text and wrapped content
- Responsive width (max 80% of container)
- Uses RGA design tokens

**Usage:**

```html
<!-- User message (Send) -->
<sc-chat-bubble chat="Send" message="Hello! How can I help?"></sc-chat-bubble>

<!-- Assistant message (Reply) -->
<sc-chat-bubble chat="Reply" message="I'm here to help!"></sc-chat-bubble>

<!-- Multi-line content -->
<sc-chat-bubble chat="Reply" message="Line 1
Line 2
Line 3"></sc-chat-bubble>
```

**Attributes:**

| Attribute | Type | Default | Description |
|-----------|------|---------|-------------|
| `chat` | string | `"Send"` | Variant type: "Send" (user) or "Reply" (assistant) |
| `message` | string | `"Text input"` | Message content to display in the bubble |

**Visual Characteristics:**

- **Send**: Right-aligned, tertiary background, rounded with small bottom-right corner
- **Reply**: Left-aligned, surface-container-high background, rounded with small bottom-left corner
- Both use body-medium typography from RGA tokens

---

### sc-top-navbar

Primary, fixed top navigation element used across the app. It anchors global navigation controls and remains visible as users move through the experience.

**Features:**
- Menu button on the left (opens side sheet navigation)
- Centered logo for brand visibility
- Notification button on the right with optional badge
- Responsive and accessible
- Uses RGA design tokens

**Usage:**

```html
<!-- Basic usage -->
<sc-top-navbar></sc-top-navbar>

<!-- With notification badge (red dot) -->
<sc-top-navbar notification-count="true"></sc-top-navbar>

<!-- Without logo -->
<sc-top-navbar show-logo="false"></sc-top-navbar>
```

**Attributes:**

| Attribute | Type | Default | Description |
|-----------|------|---------|-------------|
| `show-logo` | boolean | `true` | Show or hide the centered McAfee logo |
| `show-notification` | boolean | `true` | Show or hide the notification button |
| `notification-count` | string | `""` | Shows red dot badge when set to any truthy value |

**Events:**

| Event | Description |
|-------|-------------|
| `menu-click` | Fired when the menu button is clicked |
| `notification-click` | Fired when the notification button is clicked |

**Example with event listeners:**

```javascript
const navbar = document.querySelector('sc-top-navbar');

navbar.addEventListener('menu-click', () => {
  console.log('Menu button clicked');
  // Open side sheet navigation
});

navbar.addEventListener('notification-click', () => {
  console.log('Notification button clicked');
  // Show notifications panel
});
```

## Installation

1. Import the component in your HTML:

```html
<script type="module" src="./components/sc-top-navbar.js"></script>
```

2. Make sure Material tokens CSS is loaded:

```html
<link rel="stylesheet" href="./material-tokens.css">
```

3. Include Material Symbols font:

```html
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">
```

## Development

### Running the Demo

To view the component demos:

```bash
npm run dev
```

Then navigate to `http://localhost:5173/components/demo.html`

### Design Tokens

All components use CSS custom properties from the RGA design system:

- Colors: `--md-sys-color-*`
- Typography: `--md-sys-typescale-*`
- Spacing: `--md-sys-spacing-*`
- State layers: `--md-sys-state-*`

### Component Structure

Each component:
- Uses Shadow DOM for style encapsulation
- Follows Web Components standards
- Implements accessibility best practices
- Uses only Material Web components and RGA tokens
- No external UI frameworks (React, Vue, etc.)

## Design System

Components are based on the Safety Companion design system in Figma:
- [Safety Companion Components](https://www.figma.com/design/8viR4xHqfdYR9T1mQblAwN/Safety-Companion-Components)

## Browser Support

These components work in all modern browsers that support:
- Custom Elements v1
- Shadow DOM v1
- ES Modules

## Contributing

When creating new components:

1. Use only Material Web components and RGA design tokens
2. Follow the existing component structure
3. Include comprehensive documentation
4. Add demo examples
5. Ensure accessibility compliance
6. Test across different browsers

## License

[Add your license here]
