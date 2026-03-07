# Pegasus Flutter Example App

Example application demonstrating the Pegasus Flutter Design System components and McApp usage.

## Features

This example app showcases:

- **McApp** - Automatic theme configuration with light/dark mode support
- **Theme Toggle** - Runtime theme switching between light and dark modes
- **Components**:
  - McButton (with icons)
  - McChip (various kinds: safe, resolved, warning, danger)
  - McCard (filled and outlined variants)
  - McConnectionDetails
  - McTextField
  - McChatBubble
  - McLoader
  - McAppBar
  - McSideSheet
  - McDivider
  - McBadge

## Running the Example

From the `example` directory:

```bash
# Get dependencies
flutter pub get

# Run on your preferred platform
flutter run

# Or specify a platform
flutter run -d macos
flutter run -d chrome
flutter run -d ios
```

## Testing Themes

The example app includes a theme toggle button in the app bar (brightness icon). Click it to switch between light and dark modes.

You can also test system theme following:

- Remove the `themeMode` parameter from `McApp` to use system theme
- Change your device/OS theme settings to see automatic switching

## Code Overview

The example demonstrates:

1. **McApp Setup**: Using McApp instead of MaterialApp for automatic theme configuration
2. **Stateful Theme**: Managing ThemeMode state for runtime theme switching
3. **Component Showcase**: Examples of all major design system components
4. **Interactive Elements**: Side sheet navigation, buttons with callbacks, deletable chips
5. **Layout Patterns**: Responsive padding, spacing, and organization

## Learn More

- [Pegasus Flutter Documentation](../README.md)
- [Widgetbook Component Gallery](../widget_book/)
