# Pegasus Flutter Design System - AI Design Skill

> **Purpose**: This document enables AI tools (Claude Code, Figma Make with GitHub Connector) to understand and generate UI screens using the Pegasus Flutter Design System components and tokens.

---

## Overview

**Pegasus Flutter** is a comprehensive Material 3 design system for building McAfee-branded applications. It provides reusable UI components, design tokens, themes, and typography for consistent cross-platform experiences (Web, iOS, Android).

**Package Import**:
```dart
import 'package:pegasus_flutter/pegasus_flutter.dart';
```

**App Wrapper** (required for all screens):
```dart
McApp(
  title: 'App Name',
  home: YourScreen(),
)
```

---

## Design Tokens

### Color System

The design system uses two complementary color systems that automatically adapt to light/dark mode:

#### Material 3 Colors (Structure & Layout)
Access via `Theme.of(context).colorScheme`:

| Token | Usage |
|-------|-------|
| `primary` | Primary brand color (purple) |
| `onPrimary` | Text on primary |
| `primaryContainer` | Light primary background |
| `secondary` | Secondary actions |
| `tertiary` | Accent elements |
| `error` | Error states |
| `surface` | Base surface/background |
| `surfaceContainerLowest` | Lightest container (white-ish) |
| `surfaceContainerLow` | Very light container |
| `surfaceContainer` | Medium container |
| `surfaceContainerHigh` | Dark container |
| `surfaceContainerHighest` | Darkest container |
| `onSurface` | Primary text on surfaces |
| `onSurfaceVariant` | Secondary text on surfaces |
| `outline` | Primary borders |
| `outlineVariant` | Secondary borders, dividers |
| `inverseSurface` | Inverted surface |
| `shadow` | Shadow color |
| `scrim` | Overlay/modal backgrounds |

#### Extended Colors (Semantic & Brand)
Access via `context.extendedColors`:

| Token | Usage | Light Mode | Dark Mode |
|-------|-------|------------|-----------|
| `mcafeeRed` | McAfee brand red | Brand red | Brand red |
| `positive` | Success states | #136B55 | #88D6BB |
| `onPositive` | Text on positive | White | Dark |
| `positiveContainer` | Success background | #EBFFF8 | Dark green |
| `warning` | Warning states | #855317 | #FBB974 |
| `onWarning` | Text on warning | White | Dark |
| `warningContainer` | Warning background | #FFDCBC | Dark orange |

### Color Usage Guidelines

```
Use colorScheme for:
├── Backgrounds/surfaces → colorScheme.surface[Container]...
├── Borders/outlines → colorScheme.outline / outlineVariant
├── Text on surfaces → colorScheme.onSurface / onSurfaceVariant
└── Interactive states → colorScheme.primary / primaryContainer

Use extendedColors for:
├── Success/Safe states → extendedColors.positive
├── Warning states → extendedColors.warning
├── Brand elements → extendedColors.mcafeeRed
└── Semantic meanings → appropriate semantic color
```

### Typography Tokens
Access via `context.typographyTokens`:

| Token | Usage |
|-------|-------|
| `displayLarge` | Hero text, display headings |
| `displayMedium` | Large display text |
| `displaySmall` | Small display text |
| `headlineLarge` | Page headings |
| `headlineMedium` | Section headings |
| `headlineSmall` | Sub-section headings |
| `titleLarge` | Card titles, prominent text |
| `titleMedium` | Medium titles |
| `titleSmall` | Small titles |
| `bodyLarge` | Primary body text |
| `bodyMedium` | Standard body text |
| `bodySmall` | Secondary body text |
| `labelLarge` | Button labels, prominent labels |
| `labelMedium` | Medium labels |
| `labelSmall` | Small labels, captions |

### Spacing Tokens
Access via `context.spacingTokens`:

| Token | Usage |
|-------|-------|
| `cornerNone` | No border radius |
| `cornerExtraSmall` | Very subtle rounding |
| `cornerSmall` | Small components |
| `cornerMedium` | Cards, containers |
| `cornerLarge` | Large cards, sheets |
| `cornerLargeIncreased` | Prominent elements |
| `cornerExtraLarge` | Buttons, pills |
| `cornerExtraLargeIncreased` | Full pills |
| `cornerExtraExtraLarge` | Maximum rounding |

### Elevation Tokens
Access via `context.elevations`:

| Token | Usage |
|-------|-------|
| `elevations["1"]` | Subtle elevation |
| `elevations["2"]` | Menus, popovers |
| `elevations["3"]` | Cards, dialogs |
| `elevations["5"]` | Prominent elements |

---

## Components Reference

### McApp
**Purpose**: App wrapper that configures Material 3 themes with McAfee tokens.

```dart
McApp(
  title: 'App Title',
  themeMode: ThemeMode.system, // .light, .dark, or .system
  home: YourScreen(),
)
```

---

### McAppBar
**Purpose**: Top app bar with McAfee branding.

```dart
McAppBar(
  leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
  trailing: IconButton(icon: Icon(Icons.search), onPressed: () {}),
)
```

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `leading` | Widget? | Left-side widget (typically menu icon) |
| `trailing` | Widget? | Right-side widget (typically action icons) |
| `leadingIconColor` | Color? | Custom color for leading icon |
| `trailingIconColor` | Color? | Custom color for trailing icon |

---

### McButton
**Purpose**: Text button for less-pronounced actions.

```dart
McButton(
  label: 'Learn More',
  onPressed: () {},
  startIcon: Icon(Icons.info),
  endIcon: Icon(Icons.arrow_forward),
)
```

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `label` | String | Button text (required) |
| `onPressed` | VoidCallback? | Tap callback |
| `startIcon` | Widget? | Icon before label |
| `endIcon` | Widget? | Icon after label |

---

### McCard
**Purpose**: Container card with multiple variants.

```dart
McCard(
  icon: Icon(Icons.security),
  title: 'Protection Status',
  subtitle: 'All systems secure',
  description: 'Last scan: 2 hours ago',
  variant: CardVariant.outlined,
  onTap: () {},
)
```

**Variants**:
| Variant | Background | Border | Elevation |
|---------|------------|--------|-----------|
| `outlined` | surfaceContainerLowest | outlineVariant | None |
| `filled` | surfaceContainerHighest | outlineVariant | None |
| `elevated` | surfaceContainerHigh | outlineVariant | Level 5 |

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `icon` | Widget? | Top icon |
| `customIcon` | Widget? | Custom top icon widget |
| `title` | String? | Primary title |
| `subtitle` | String? | Secondary text |
| `description` | String? | Tertiary description |
| `customContent` | Widget? | Fully custom content |
| `variant` | CardVariant | elevated, filled, outlined |
| `onTap` | VoidCallback? | Tap callback |
| `width` | double? | Card width (default: infinity) |

---

### McHorizontalCard
**Purpose**: Horizontal card layout with rich content.

```dart
McHorizontalCard(
  leadingIcon: Icon(Icons.wifi),
  title: 'Wi-Fi Network',
  subtitle: 'Home Network',
  description: 'Connected securely',
  chip: McChip(label: 'Active', kind: ChipKind.safe),
  trailingIcon: Icon(Icons.chevron_right),
  variant: CardVariant.outlined,
)
```

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `leadingIcon` | Widget? | Left icon |
| `chip` | Widget? | Status chip |
| `status` | String? | Status text |
| `trailingIcon` | Widget? | Right icon |
| `title` | String? | Primary title |
| `subtitle` | String? | Secondary text |
| `description` | String? | Description text |
| `variant` | CardVariant | Card style variant |

---

### McChip
**Purpose**: Compact status indicators and tags.

```dart
McChip(
  label: 'Protected',
  type: ChipType.suggestion,
  style: ChipStyle.filled,
  kind: ChipKind.safe,
  isSelected: false,
  onPressed: () {},
)
```

**ChipType**:
| Type | Usage |
|------|-------|
| `input` | User-entered values, removable |
| `assistive` | Smart suggestions |
| `filter` | Filtering content |
| `suggestion` | Quick actions |

**ChipStyle**:
| Style | Description |
|-------|-------------|
| `outlined` | Border only |
| `elevated` | With shadow |
| `filled` | Solid background |

**ChipKind** (Semantic States):
| Kind | Background | Use Case |
|------|------------|----------|
| `none` | Default Material | Generic |
| `safe` | positive | Protected, success |
| `inProgress` | surfaceContainerHigh | Loading, pending |
| `resolved` | positiveContainer | Completed |
| `warning` | warningContainer | Attention needed |
| `danger` | errorContainer | Critical, error |
| `dismissed` | surfaceContainerLowest + opacity | Inactive |

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `label` | String | Chip text (required) |
| `type` | ChipType | Chip behavior type |
| `style` | ChipStyle | Visual style |
| `kind` | ChipKind | Semantic color preset |
| `isSelected` | bool | Selection state |
| `isEnabled` | bool | Interaction enabled |
| `onPressed` | VoidCallback? | Tap callback |
| `onDeleted` | VoidCallback? | Delete callback |
| `leadingIcon` | Widget? | Icon before label |
| `trailingIcon` | Widget? | Icon after label |
| `avatar` | Widget? | Avatar widget |

---

### McFilterChip
**Purpose**: Filter chips for refining content.

```dart
McFilterChip(
  label: 'Active',
  isSelected: true,
  onSelected: (selected) {},
  showCheckmark: true,
)
```

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `label` | String | Chip text (required) |
| `isSelected` | bool | Selection state |
| `isEnabled` | bool | Interaction enabled |
| `onSelected` | ValueChanged<bool>? | Selection callback |
| `leadingIcon` | Widget? | Icon before label |
| `showCheckmark` | bool | Show check when selected |

---

### McTextField
**Purpose**: Text input field with expandable chat-style support.

```dart
// Standard text field
McTextField(
  hintText: 'Enter text',
  controller: textController,
  onChanged: (value) {},
)

// Chat-style expandable text field
McTextField(
  hintText: 'Type a message',
  isExpandable: true,
  onAttachPressed: () {},
  onSendPressed: () {},
  onRecordPressed: () {},
)
```

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `hintText` | String? | Placeholder text |
| `controller` | TextEditingController? | Text controller |
| `onChanged` | ValueChanged<String>? | Text change callback |
| `disabled` | bool | Disable input |
| `readOnly` | bool | Read-only mode |
| `obscureText` | bool | Password mode |
| `isExpandable` | bool | Chat-style expandable |
| `onAttachPressed` | VoidCallback? | Attach button callback |
| `onSendPressed` | VoidCallback? | Send button callback |
| `onRecordPressed` | VoidCallback? | Record button callback |
| `leadingIcon` | Widget? | Custom leading icon |
| `trailingIcon` | Widget? | Custom trailing icon |

---

### McSearchBar
**Purpose**: Search input with icons.

```dart
McSearchBar(
  hintText: 'Search...',
  style: SearchBarStyle.filled,
  onChanged: (value) {},
  onSubmitted: (value) {},
  showClearButton: true,
)
```

**SearchBarStyle**:
| Style | Description |
|-------|-------------|
| `outlined` | Border with transparent background |
| `filled` | Filled background |

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `hintText` | String | Placeholder text |
| `style` | SearchBarStyle | Visual style |
| `controller` | TextEditingController? | Text controller |
| `onChanged` | ValueChanged<String>? | Text change callback |
| `onSubmitted` | ValueChanged<String>? | Submit callback |
| `showClearButton` | bool | Show clear button |
| `enabled` | bool | Enable interaction |
| `autofocus` | bool | Auto-focus on mount |

---

### McSideSheet
**Purpose**: Modal side sheet sliding from screen edge.

```dart
McSideSheet.show(
  context: context,
  header: McSideSheetLogoHeader(),
  variant: SideSheetVariant.primary,
  children: [
    McSideSheetItem(
      label: 'Home',
      leading: Icon(Icons.home),
      onTap: () => Navigator.pop(context),
    ),
    McSideSheetItem(
      label: 'Settings',
      leading: Icon(Icons.settings),
      trailing: McBadge(badgeText: '3'),
      onTap: () {},
    ),
  ],
)
```

**SideSheetVariant**:
| Variant | Background |
|---------|------------|
| `primary` | surface |
| `secondary` | surfaceContainerLowest (white) |

**Static Method**:
```dart
static Future<T?> show<T>({
  required BuildContext context,
  Widget? header,
  Widget? body,
  List<Widget>? children,
  double width = 360,
  bool barrierDismissible = true,
  bool showDivider = true,
  SideSheetVariant variant = SideSheetVariant.primary,
})
```

---

### McChatBubble
**Purpose**: Chat message bubbles.

```dart
McChatBubble(
  text: 'Hello! How can I help?',
  isSent: false, // false = received, true = sent
)
```

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `text` | String | Message text (required) |
| `isSent` | bool | true = sent (right), false = received (left) |
| `padding` | EdgeInsetsGeometry? | Custom padding |
| `margin` | EdgeInsetsGeometry? | Custom margin |

---

### McCarousel
**Purpose**: Horizontal scrolling carousel.

```dart
McCarousel(
  height: 200,
  itemWidth: 280,
  itemGap: 16,
  showIndicators: true,
  items: [
    McCard(title: 'Card 1'),
    McCard(title: 'Card 2'),
    McCard(title: 'Card 3'),
  ],
  onPageChanged: (index) {},
)
```

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `items` | List<Widget> | Carousel items (required) |
| `height` | double | Carousel height |
| `itemWidth` | double? | Fixed item width |
| `itemGap` | double | Gap between items |
| `showIndicators` | bool | Show page indicators |
| `onPageChanged` | Function(int)? | Page change callback |

---

### McStatCard
**Purpose**: Statistics display card with progress bar.

```dart
McStatCard(
  title: 'Security Score',
  statText: 'Good',
  value: 15,
  maxValue: 20,
  variant: CardVariant.outlined,
)
```

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `title` | String | Card title (required) |
| `statText` | String | Status text (required) |
| `value` | int | Current value (required) |
| `maxValue` | int | Maximum value (default: 20) |
| `variant` | CardVariant | Card style |
| `header` | Widget? | Optional header widget |
| `progressBackgroundColor` | Color? | Progress bar background |
| `progressFillColor` | Color? | Progress bar fill |

---

### McConnectionDetails
**Purpose**: Network/device connection status display.

```dart
McConnectionDetails(
  title: 'Wi-Fi Network',
  subtitle: 'Home Network',
  status: 'Connected',
  statusChipKind: ChipKind.safe,
  connectionType: 'WPA3',
  lastConnected: '2 hours ago',
  bullets: [
    BulletItem('High-speed connection'),
    BulletItem('Secure encryption'),
    BulletItem('Weak password', type: BulletType.failed),
  ],
  variant: ConnectionDetailsVariant.outlined,
)
```

**BulletType**:
| Type | Icon |
|------|------|
| `success` | Green checkmark |
| `failed` | Red X |

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `title` | String? | Connection name |
| `subtitle` | String? | Additional info |
| `status` | String? | Status text |
| `statusChipKind` | ChipKind | Status chip semantic |
| `statusChipStyle` | ChipStyle | Status chip style |
| `connectionType` | String? | Connection type |
| `lastConnected` | String? | Last connected time |
| `bullets` | List<BulletItem>? | Feature/issue list |
| `variant` | ConnectionDetailsVariant | Card variant |

---

### McBadge
**Purpose**: Notification badge/dot indicator.

```dart
// Simple badge
McBadge(size: BadgeSize.large, color: Colors.red)

// Badge with count on icon
McBadge(
  icon: Icon(Icons.notifications),
  badgeText: '5',
  size: BadgeSize.large,
)
```

**BadgeSize**:
| Size | Diameter |
|------|----------|
| `large` | 16px |
| `small` | 8px |

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `size` | BadgeSize | Badge size |
| `color` | Color? | Badge color (default: error) |
| `icon` | Widget? | Icon to overlay badge on |
| `badgeText` | String? | Text inside badge |

---

### McLoader
**Purpose**: McAfee branded loading indicator.

```dart
// Simple loader
McLoader(
  size: 48,
  brandColor: BrandColor.red,
  showLogo: true,
)

// Loading overlay
McLoadingOverlay(
  isLoading: true,
  message: 'Loading...',
  child: YourContent(),
)
```

**BrandColor**:
| Color | Description |
|-------|-------------|
| `red` | McAfee red |
| `black` | Brand black (adapts in dark mode) |

**Properties**:
| Property | Type | Description |
|----------|------|-------------|
| `size` | double | Loader diameter |
| `brandColor` | BrandColor | Loader color |
| `strokeWidth` | double | Circle stroke width |
| `showLogo` | bool | Show McAfee logo in center |

---

### McFeedback
**Purpose**: User feedback collection (thumbs up/down).

```dart
McFeedback(
  message: 'Was this helpful?',
  onThumbsUp: () {},
  onThumbsDown: () {},
)
```

---

### McMenu & McMenuItem
**Purpose**: Dropdown menus.

```dart
McMenu(
  children: [
    McMenuItem(
      label: 'Option 1',
      trailing: Text('⌘1'),
      onTap: () {},
    ),
    McMenuItemWithIcon(
      label: 'Settings',
      icon: Icons.settings,
      onTap: () {},
    ),
  ],
)
```

---

### McList & McListItem
**Purpose**: Structured list displays.

```dart
McList(
  showDividers: true,
  children: [
    McListItem(
      headline: 'Item Title',
      supportingText: 'Secondary text',
      overline: 'CATEGORY',
      leading: Icon(Icons.person),
      trailing: Icon(Icons.chevron_right),
      onTap: () {},
    ),
  ],
)
```

---

### McDivider
**Purpose**: Horizontal divider line.

```dart
McDivider(
  thickness: 1,
  indent: 16,
  endIndent: 16,
)
```

---

### Typography Components

#### Header
```dart
Header(
  level: 1, // 1-9, where 1=displayLarge, 9=titleSmall
  strong: true, // Bold
  child: Text('Page Title'),
)
```

| Level | Style |
|-------|-------|
| 1 | displayLarge |
| 2 | displayMedium |
| 3 | displaySmall |
| 4 | headlineLarge |
| 5 | headlineMedium |
| 6 | headlineSmall |
| 7 | titleLarge |
| 8 | titleMedium |
| 9 | titleSmall |

#### Body
```dart
Body(
  level: 2, // 1-5
  strong: false,
  child: Text('Body text content'),
)
```

| Level | Style |
|-------|-------|
| 1 | bodyLarge |
| 2 | bodyMedium |
| 3 | bodySmall |
| 4 | labelLarge |
| 5 | labelSmall |

---

### Custom Icons

The design system includes McAfee-branded icons:

| Icon Widget | Description |
|-------------|-------------|
| `McLogoIcon` | McAfee "M" logo |
| `McLogoHorizontalIcon` | Horizontal McAfee logo |
| `McRecordIcon` | Voice recording icon |
| `McChatIcon` | Chat icon |
| `McSparkleIcon` | AI/Magic sparkle |
| `McReplyReverseIcon` | Reply reverse arrow |
| `McArrowUpIcon` | Arrow up |
| `McSecurityHistoryIcon` | Security history |
| `McUserIcon` | User profile |
| `McSettingsIcon` | Settings gear |
| `McRenewalIcon` | Subscription renewal |
| `McExternalLinkIcon` | External link |
| `McSignOutIcon` | Sign out |
| `McAccountIcon` | Account |
| `McRunAScanIcon` | Scan action |
| `McCheckmarkIcon` | Success checkmark |
| `McXIcon` | Close/cancel X |
| `McListModeIcon` | List view mode |
| `McChevronDownIcon` | Chevron down |
| `McListingIcon` | Listing |
| `McTimeIcon` | Time/clock |
| `McInfoIcon` | Information |
| `McCautionIcon` | Warning/caution |
| `McCheckmarkCircleIcon` | Circled checkmark |
| `McSendIcon` | Send message |
| `McSearchIcon` | Search |

```dart
McLogoIcon(size: 24, color: BrandColor.red)
McCheckmarkIcon(size: 20, color: Colors.green)
```

---

## Screen Layout Patterns

### Basic Screen with AppBar and Side Sheet
```dart
McApp(
  title: 'My App',
  home: Scaffold(
    appBar: McAppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => McSideSheet.show(
            context: context,
            header: McSideSheetLogoHeader(),
            children: [
              McSideSheetItem(label: 'Home', leading: Icon(Icons.home)),
              McSideSheetItem(label: 'Settings', leading: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
      trailing: IconButton(icon: Icon(Icons.search), onPressed: () {}),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Your content here
          ],
        ),
      ),
    ),
  ),
)
```

### Dashboard with Status Cards
```dart
Column(
  children: [
    McStatCard(
      title: 'Security Score',
      statText: 'Protected',
      value: 18,
      maxValue: 20,
    ),
    SizedBox(height: 16),
    McCarousel(
      height: 180,
      items: [
        McCard(title: 'Scan', icon: Icon(Icons.security)),
        McCard(title: 'VPN', icon: Icon(Icons.vpn_lock)),
        McCard(title: 'WiFi', icon: Icon(Icons.wifi)),
      ],
    ),
  ],
)
```

### Chat Interface
```dart
Column(
  children: [
    Expanded(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          McChatBubble(text: 'Hello! How can I help?', isSent: false),
          McChatBubble(text: 'I need help with my subscription', isSent: true),
          McChatBubble(text: 'I can help you with that!', isSent: false),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(16),
      child: McTextField(
        hintText: 'Type a message',
        isExpandable: true,
        onSendPressed: () {},
        onAttachPressed: () {},
      ),
    ),
  ],
)
```

### Connection/Status Screen
```dart
SingleChildScrollView(
  padding: EdgeInsets.all(16),
  child: Column(
    children: [
      McConnectionDetails(
        title: 'Wi-Fi Network',
        status: 'Connected',
        statusChipKind: ChipKind.safe,
        bullets: [
          BulletItem('Secure connection'),
          BulletItem('WPA3 encryption'),
        ],
      ),
      SizedBox(height: 16),
      McCard(
        title: 'VPN Status',
        subtitle: 'Not connected',
        icon: Icon(Icons.vpn_lock),
      ),
    ],
  ),
)
```

### Filter/Search Interface
```dart
Column(
  children: [
    McSearchBar(
      hintText: 'Search devices...',
      onChanged: (value) {},
    ),
    SizedBox(height: 12),
    Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        McFilterChip(label: 'All', isSelected: true, onSelected: (v) {}),
        McFilterChip(label: 'Active', onSelected: (v) {}),
        McFilterChip(label: 'Inactive', onSelected: (v) {}),
      ],
    ),
    SizedBox(height: 16),
    McList(
      children: [
        McListItem(headline: 'Device 1', supportingText: 'Online'),
        McListItem(headline: 'Device 2', supportingText: 'Offline'),
      ],
    ),
  ],
)
```

---

## Best Practices

### Color Usage
1. **Structure colors** (`colorScheme`) for backgrounds, borders, elevation
2. **Semantic colors** (`extendedColors`) for success, warning, brand
3. Always use "on" colors for text: `onSurface`, `onPositive`, etc.
4. Both systems auto-adapt to light/dark mode

### Component Selection
| Need | Use |
|------|-----|
| App wrapper | `McApp` |
| Top navigation | `McAppBar` |
| Side navigation | `McSideSheet` |
| Content container | `McCard` / `McHorizontalCard` |
| Status indicator | `McChip` with appropriate `kind` |
| Filtering | `McFilterChip` |
| User input | `McTextField` |
| Search | `McSearchBar` |
| Lists | `McList` with `McListItem` |
| Statistics | `McStatCard` |
| Loading | `McLoader` / `McLoadingOverlay` |
| Chat | `McChatBubble` |
| Horizontal scroll | `McCarousel` |
| Notifications | `McBadge` |

### Spacing Guidelines
- **Screen padding**: 16-24px
- **Between cards**: 16px
- **Between sections**: 24-32px
- **Inside cards**: 16px
- **Between related items**: 8-12px

### Typography Guidelines
- **Page titles**: `Header(level: 4)` or `typographyTokens.headlineLarge`
- **Section titles**: `Header(level: 5-6)` or `typographyTokens.headlineMedium/Small`
- **Card titles**: `typographyTokens.titleMedium`
- **Body text**: `typographyTokens.bodyMedium`
- **Captions**: `typographyTokens.bodySmall` or `labelSmall`

---

## Figma Make Integration Notes

When using Figma Make with this design system:

1. **Component Mapping**: Map Figma components directly to `Mc*` Flutter widgets
2. **Token Sync**: Design tokens in `tokens.json` align with Figma variables
3. **Color Modes**: Support both light and dark modes using the dual color system
4. **Variants**: Use component variants (outlined, filled, elevated) as defined
5. **Semantic States**: Use `ChipKind` for status indicators (safe, warning, danger, etc.)

---

## File Structure

```
lib/
├── pegasus_flutter.dart       # Main export file
├── widgets.dart              # Widget exports
└── components/
    ├── app.dart              # McApp
    ├── app_bar.dart          # McAppBar
    ├── badge.dart            # McBadge
    ├── button.dart           # McButton
    ├── card.dart             # McCard, McHorizontalCard
    ├── carousel.dart         # McCarousel
    ├── chat_bubble.dart      # McChatBubble
    ├── chip.dart             # McChip
    ├── connection_details.dart # McConnectionDetails
    ├── divider.dart          # McDivider
    ├── feedback.dart         # McFeedback
    ├── filter_chip.dart      # McFilterChip
    ├── icon.dart             # Icon exports
    ├── list_chip.dart        # McListChip
    ├── list.dart             # McList, McListItem
    ├── loader.dart           # McLoader, McLoadingOverlay
    ├── menu.dart             # McMenu, McMenuItem
    ├── search_bar.dart       # McSearchBar
    ├── side_sheet.dart       # McSideSheet, McSideSheetItem
    ├── stat_card.dart        # McStatCard
    ├── text_field.dart       # McTextField
    ├── typography.dart       # Header, Body
    └── icons/                # Individual icon components
```

---

## Quick Reference Card

```dart
// Import
import 'package:pegasus_flutter/pegasus_flutter.dart';

// Colors
final colors = Theme.of(context).colorScheme;
final extended = context.extendedColors;

// Typography
final typography = context.typographyTokens;

// Spacing
final spacing = context.spacingTokens;

// Elevation
final elevation = context.elevations["3"];

// Common patterns
McApp(home: Scaffold(appBar: McAppBar(), body: ...))
McCard(title: '...', variant: CardVariant.outlined)
McChip(label: '...', kind: ChipKind.safe)
McTextField(hintText: '...', isExpandable: true)
McSideSheet.show(context: context, children: [...])
```

---

*Generated from Pegasus Flutter Design System v0.6.0*
