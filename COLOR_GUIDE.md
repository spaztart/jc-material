# Color System Guide - Pegasus Flutter

## Two Color Systems

### 1. Material 3 Colors (Theme Colors)

**Access via:** `Theme.of(context).colorScheme`

These are standard Material Design 3 colors that automatically adapt to light/dark mode.

#### Primary Colors

```dart
colorScheme.primary              // Primary brand color (purple)
colorScheme.onPrimary            // Text on primary
colorScheme.primaryContainer     // Light primary background
colorScheme.onPrimaryContainer   // Text on primary container
```

#### Secondary Colors

```dart
colorScheme.secondary
colorScheme.onSecondary
colorScheme.secondaryContainer
colorScheme.onSecondaryContainer
```

#### Tertiary Colors

```dart
colorScheme.tertiary
colorScheme.onTertiary
colorScheme.tertiaryContainer
colorScheme.onTertiaryContainer
```

#### Error Colors

```dart
colorScheme.error
colorScheme.onError
colorScheme.errorContainer       // Light error background
colorScheme.onErrorContainer     // Text on error container
```

#### Surface Hierarchy (6 levels - for backgrounds and elevation)

```dart
colorScheme.surface                   // Base surface
colorScheme.surfaceContainerLowest   // Lightest container (white-ish)
colorScheme.surfaceContainerLow      // Very light
colorScheme.surfaceContainer         // Medium
colorScheme.surfaceContainerHigh     // Dark
colorScheme.surfaceContainerHighest  // Darkest container
colorScheme.onSurface                // Text on surface
colorScheme.onSurfaceVariant         // Secondary text on surface
```

#### Outlines & Borders

```dart
colorScheme.outline              // Primary borders
colorScheme.outlineVariant       // Secondary borders
```

#### Inverse Colors

```dart
colorScheme.inverseSurface       // For dark-on-light or light-on-dark
colorScheme.onInverseSurface
colorScheme.inversePrimary
```

#### Utility

```dart
colorScheme.shadow
colorScheme.scrim
colorScheme.surfaceTint
```

---

### 2. Extended Colors (McAfee Custom)

**Access via:** `context.extendedColors`

These are McAfee-specific brand and semantic colors.

#### Brand

```dart
extendedColors.mcafeeRed         // McAfee brand red
```

#### Positive/Success (Green)

```dart
extendedColors.positive           // Dark green #136B55 (light) / #88D6BB (dark)
extendedColors.onPositive         // White text on positive
extendedColors.positiveContainer  // Light mint background #EBFFF8
extendedColors.onPositiveContainer // Dark text on positive container
```

#### Warning (Orange)

```dart
extendedColors.warning            // Orange #855317 (light) / #FBB974 (dark)
extendedColors.onWarning          // White text on warning
extendedColors.warningContainer   // Light orange background #FFDCBC
extendedColors.onWarningContainer // Dark text on warning container
```

---

## When to Use Which System?

### Use `colorScheme` for:

- ✅ **Structure & Hierarchy**: backgrounds, surfaces, elevation levels
- ✅ **Layout Elements**: borders, dividers, outlines
- ✅ **Standard UI States**: primary actions, focus states
- ✅ **Creating Variants**: Use the surface container scale for visual hierarchy
- ✅ **Text Colors**: `onSurface`, `onPrimary`, etc.

**Examples:**

```dart
// Card variants using surface hierarchy
CardVariant.outlined:  colorScheme.surfaceContainerLowest   // Lightest
CardVariant.elevated:  colorScheme.surfaceContainerHigh     // Medium + shadow
CardVariant.filled:    colorScheme.surfaceContainerHighest  // Darkest

// Side sheet variants
SideSheetVariant.light: colorScheme.surfaceContainerLowest
SideSheetVariant.dark:  colorScheme.surfaceContainerHigh
```

### Use `extendedColors` for:

- ✅ **Semantic Meanings**: success, warning states
- ✅ **McAfee Branding**: brand-specific colors
- ✅ **Specific Color Needs**: When you need exact colors with meaning

**Examples:**

```dart
// Semantic chip states
ChipKind.safe:      extendedColors.positive / onPositive
ChipKind.resolved:  extendedColors.positiveContainer / positive
ChipKind.warning:   extendedColors.warningContainer / warning
```

---

## Decision Tree

```
I need a color for...

├─ STRUCTURE/HIERARCHY/LAYOUT?
│  ├─ Background levels → colorScheme.surface[Container]...
│  ├─ Borders/outlines → colorScheme.outline / outlineVariant
│  ├─ Text on surfaces → colorScheme.onSurface / onSurfaceVariant
│  └─ Interactive states → colorScheme.primary / primaryContainer
│
├─ SEMANTIC MEANING?
│  ├─ Success/Safe → extendedColors.positive
│  ├─ Warning → extendedColors.warning
│  ├─ Error/Danger → colorScheme.error (Material has this built-in)
│  └─ Brand → extendedColors.mcafeeRed
│
└─ TEXT COLOR?
   ├─ On semantic backgrounds → extendedColors.on[Color]
   └─ On structural surfaces → colorScheme.on[Surface]
```

---

## Additional Resources

### Spacing/Corner Tokens

**Access via:** `context.spacingTokens`

```dart
spacingTokens.cornerNone
spacingTokens.cornerExtraSmall
spacingTokens.cornerSmall
spacingTokens.cornerMedium
spacingTokens.cornerLarge
spacingTokens.cornerLargeIncreased
spacingTokens.cornerExtraLarge
spacingTokens.cornerExtraLargeIncreased
spacingTokens.cornerExtraExtraLarge
```

### Tonal Palettes

**Access via:** `context.tonalPalettes`

Each palette has tones: 0, 5, 10, 15, 20, 25, 30, 35, 40, 50, 60, 70, 80, 90, 95, 98, 99, 100

```dart
tonalPalettes.primary.tone40       // Auto light/dark adaptive
tonalPalettes.secondary.tone60
tonalPalettes.tertiary.tone80
tonalPalettes.error.tone50
tonalPalettes.neutral.tone90
tonalPalettes.neutralVariant.tone30
```

### Elevations/Shadows

**Access via:** `context.elevations`

```dart
elevations["1"]  // List<BoxShadow> for different elevation levels
elevations["2"]
elevations["3"]
elevations["5"]
```

### Typography

**Access via:** `context.typographyTokens`

```dart
typographyTokens.displayLarge
typographyTokens.headlineMedium
typographyTokens.titleLarge
typographyTokens.bodyMedium
typographyTokens.labelSmall
// ... and many more
```

---

## Key Principles

1. **Reuse, don't recreate**

   - Material 3 provides a complete hierarchy. Use it.
   - Only create new extended colors for specific brand/semantic meanings.

2. **Separation of concerns**

   - **Structure** (light/dark/medium backgrounds) → `colorScheme.surface...`
   - **Meaning** (success/warning/brand) → `context.extendedColors...`

3. **Automatic theming**

   - Both systems adapt to light/dark mode automatically
   - Avoid hardcoding colors like `Color(0xFF...)` unless absolutely necessary

4. **The "on" pattern**

   - Every background color has an "on" color for text
   - `surface` → `onSurface`
   - `positive` → `onPositive`
   - `primary` → `onPrimary`

5. **Opacity for states**
   - Disabled/dismissed states: use `.withOpacity(0.38)` on text
   - Hover/focus: Material handles automatically via state layers

---

## Pattern Examples from This Project

### Chips (Semantic + Structural)

```dart
// Semantic states
ChipKind.safe:       extendedColors.positive + onPositive
ChipKind.resolved:   extendedColors.positiveContainer + positive
ChipKind.warning:    extendedColors.warningContainer + warning
ChipKind.danger:     colorScheme.errorContainer + error

// Structural states
ChipKind.inProgress: colorScheme.surfaceContainerHigh + primary
ChipKind.dismissed:  colorScheme.surfaceContainerLowest + onSurface.withOpacity(0.38)
```

### Cards (Structural Only)

```dart
CardVariant.outlined:  colorScheme.surfaceContainerLowest   // White/lightest
CardVariant.elevated:  colorScheme.surfaceContainerHigh     // Medium + shadow
CardVariant.filled:    colorScheme.surfaceContainerHighest  // Darkest
```

---

## Quick Reference

```dart
// MOST COMMONLY USED

// Structure (colorScheme)
colorScheme.surface
colorScheme.surfaceContainerLowest   // Lightest (white-ish)
colorScheme.surfaceContainerHigh     // Medium-dark
colorScheme.surfaceContainerHighest  // Darkest
colorScheme.primary
colorScheme.outline
colorScheme.error

// Semantics (extendedColors)
extendedColors.positive              // Success green
extendedColors.positiveContainer     // Light success background
extendedColors.warning               // Warning orange
extendedColors.warningContainer      // Light warning background
extendedColors.mcafeeRed             // Brand color

// Text (always use "on" colors)
colorScheme.onSurface
colorScheme.onPrimary
extendedColors.onPositive
extendedColors.onWarning
```
