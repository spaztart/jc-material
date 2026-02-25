# Changelog

## [v0.6.0] - 2026-02-11

### Added

- Added McSearchBar component with Material 3 styling
  - Support for leading/trailing icons
  - Customizable hint text and input handling
  - Full theme integration with proper color tokens
  - Accessibility support with semantic labels

## [v0.5.0] - 2026-01-16

### Added

- Added McFilterChip component with M3-compliant states
  - Outlined and filled variants with proper disabled states
  - Support for delete/close icon with callback
  - Full Material 3 color token integration
- Added McListChip component for displaying counts with action text
  - Leading/trailing icon support
  - Optional delete button with accessibility improvements (IconButton)
  - Configurable padding and tooltip support
- Added McStatCard component for displaying statistics
  - Displays title, stat text, value, and progress bar
  - Optional header widget support (e.g., McListChip)
  - CardVariant support (outlined, filled, elevated)
  - M3 color token integration with proper theme adaptation
  - Responsive design with full width support

### Changed

- Refactored McStatCard for improved code maintainability
  - Simplified text style handling with `_effectiveTextStyle` helper
  - Reduced code duplication and file size (~27% reduction)
  - Optimized spacing and layout constants using records
- Enhanced widgetbook Playground for McStatCard
  - Added checkbox to toggle McListChip header display
  - Chip count syncs with stat card value for dynamic preview
  - Customizable chip action text

### Fixed

- Fixed chip width stretching - chips now wrap to content size using Align widget
- Proper color contrast in dark mode for filter chip disabled states

## [v0.4.0] - 2025-11-25

### Added

- Added McApp wrapper component for automatic Material 3 theme configuration
  - Automatically applies light/dark theme based on system settings
  - Extends MaterialApp with full feature support
  - Integrated design system theme and typography
- Added comprehensive example app demonstrating McApp and core components
  - Full platform support (iOS, Android, macOS, web)
  - Interactive examples of all major components
- Added ThemeModeSyncAddon to synchronize theme mode in widget_book
- [#12](https://github.com/mcafee-eng/pegasus-flutter/pull/12) - Fix device bg color mismatch

### Changed

- Upgraded to mc_flutter_tokens v0.3.3 with built-in extensions
  - [#11](https://github.com/mcafee-eng/pegasus-flutter/pull/11) - Use mc_flutter_tokens 0.3.3
  - Removed local token transformer and generated files
  - Now using centralized token package for consistency
- Fixed tokenization across all components to use Material 3 semantic color roles
  - McLogoIcon and McLogoHorizontalIcon now use `colorScheme.onSurface` instead of manual brightness checks
  - McLoader components use `colorScheme.onSurface` for automatic theme adaptation
  - McSideSheet icons use `colorScheme.onSurfaceVariant` instead of static tonal palette values
  - McChip danger kind now uses brightness-aware color selection with proper Material 3 error colors
  - Removed hardcoded color values and static tonal palette references in favor of theme-aware semantic tokens
  - All components now properly adapt between light and dark modes automatically
- Replaced hardcoded border radius values with spacing tokens across components
- Updated GitHub Actions deploy workflow for better authentication
  - [#10](https://github.com/mcafee-eng/pegasus-flutter/pull/10) - GitHub auth solution
- Upgraded accessibility_tools package fixing build failures with latest Flutter
- Updated path_provider and url_launcher package versions

### Removed

- Removed local flutter_tokens package (now using mc_flutter_tokens from GitHub)
- Removed all locally generated token files (box_shadow, colors, spacing, typography, tonal_palettes)
- Removed old theme files (app_theme.dart, color_schemes.dart, colors.dart, dark_theme.dart, radii.dart, spacing.dart, typography.dart)
- Removed pubspec.lock files and added to .gitignore
- Cleaned up generated iOS and macOS plugin files

### Fixed

- Fixed device background color mismatch in widget_book
- Fixed build failures with latest Flutter version
- Fixed Git authentication in CI/CD workflow

## [v0.3.0] - 2025-11-21

### Added

- Added McMenu component with Material 3 design specifications
  - McMenuItem for basic menu items
  - McMenuItemWithIcon for menu items with leading icons
  - Support for selected, enabled/disabled states
  - Proper elevation (2dp), border radius, and minimum width (112dp)
  - [#9](https://github.com/mcafee-eng/pegasus-flutter/pull/9) - Refactoring finish up 3
- Updated McList component to match Material 3 Figma specifications
  - One-line (56dp), two-line (72dp), and three-line (88dp) variants
  - McListItem, McListItemWithIcon, McListItemWithTrailingIcon components
  - Support for overline text in three-line items
  - Proper selected state using surfaceContainerHighest
  - Full-width responsive design with proper spacing (16dp horizontal padding)

### Changed

- Menu item selected state uses secondaryContainer background and onSecondaryContainer text/icons
- Menu item trailing text (shortcuts) now uses onSecondaryContainer color when selected
- List component refactored with proper Material 3 color semantics (no hardcoded values)
- Improved component documentation with code snippets for all examples
- [#8](https://github.com/mcafee-eng/pegasus-flutter/pull/8) - Refactoring finish up 2
- [#7](https://github.com/mcafee-eng/pegasus-flutter/pull/7) - Refactoring finish up

### Removed

- Removed unused plugin symlinks (path_provider_windows, url_launcher_windows)
- Removed generated iOS, Linux, Android, and macOS build files
- Cleaned up project structure

### Fixed

- Fixed menu item color contrast in selected state
- Fixed list component divider visibility in playground
- Various deployment workflow improvements

## [v0.2.0] - 2025-11-18

### Added

- Added McSideSheet component with Material 3 design
- Added McSideSheetHeader and McSideSheetLogoHeader variants
- [#6](https://github.com/mcafee-eng/pegasus-flutter/pull/6) - Separate Widgetbook app from pegasus_flutter package

### Removed

- Removed components not part of McAfee custom design system in Figma
- Removed `example/main.dart` (consolidated to `lib/main.dart`)
- Removed `run_widgetbook.sh` script and related documentation

### Changed

- Updated deployment workflow to use `lib/main.dart`
- Updated README - removed "Running Widgetbook" section
- Separated Widgetbook app from pegasus_flutter package for better organization

### Fixed

- Various bug fixes and improvements
- Deployment workflow authentication improvements

## [v0.1.0] - 2025-11-18

### Added

- Initial release of Pegasus Flutter Design System
- Core components with Material 3 design
- Design tokens integration (flutter_tokens, mc_flutter_tokens)
- Theme system with light/dark mode support
- Widgetbook-based component documentation
- [#4](https://github.com/mcafee-eng/pegasus-flutter/pull/4) - Poppins font support
- [#3](https://github.com/mcafee-eng/pegasus-flutter/pull/3) - Fix pub get GitHub authentication
- [#2](https://github.com/mcafee-eng/pegasus-flutter/pull/2) - Fix GH deploy workflow
- [#1](https://github.com/mcafee-eng/pegasus-flutter/pull/1) - M3 scheme color names

### Changed

- Refactored theme setup and component structure
- Updated to use Material 3 color scheme naming conventions

### Fixed

- GitHub authentication for dependency installation
- Deployment workflow configuration
