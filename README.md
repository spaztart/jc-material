# Pegasus Flutter Design System

A comprehensive Flutter design system providing reusable UI components, design tokens, themes, and interactive component documentation for building consistent McAfee-branded applications across web, iOS, and Android platforms.

## Installation

### Option 1: Using flutter pub add (Recommended)

```bash
flutter pub add pegasus_flutter --git-url=https://github.com/mcafee-eng/pegasus-flutter.git --git-ref=v0.6.0
```

### Option 2: Add to pubspec.yaml

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  pegasus_flutter:
    git:
      url: https://github.com/mcafee-eng/pegasus-flutter.git
      ref: v0.6.0
```

Then run:

```bash
flutter pub get
```

### Upgrading from Previous Versions

If you're already using v0.4.0 or earlier, update the `ref` in your `pubspec.yaml`:

```yaml
dependencies:
  pegasus_flutter:
    git:
      url: https://github.com/mcafee-eng/pegasus-flutter.git
      ref: v0.6.0 # Update this line
```

Then run:

```bash
flutter pub get
```

Or use the command line:

```bash
flutter pub upgrade pegasus_flutter
```

> **Note**: The design system includes all necessary design tokens and theming utilities.

## Usage

Import the package in your Dart code:

```dart
import 'package:flutter/material.dart';
import 'package:pegasus_flutter/pegasus_flutter.dart';
```

### Basic Example

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return McApp(
      title: 'My McAfee App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: McAppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                McSideSheet.show(
                  context: context,
                  header: McSideSheetLogoHeader(),
                  children: [
                    McSideSheetItem(
                      label: 'Home',
                      leading: Icon(Icons.home),
                      onTap: () {
                        Navigator.pop(context);
                        debugPrint('Navigating to Home');
                      },
                    ),
                    McSideSheetItem(
                      label: 'Profile',
                      leading: Icon(Icons.person),
                      onTap: () {
                        Navigator.pop(context);
                        debugPrint('Navigating to Profile');
                      },
                    ),
                    McSideSheetItem(
                      label: 'Notifications',
                      leading: Icon(Icons.notifications),
                      trailing: McBadge(badgeText: '5'),
                      onTap: () {
                        Navigator.pop(context);
                        debugPrint('Navigating to Notifications');
                      },
                    ),
                  ],
                );
              },
              tooltip: 'Menu',
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            tooltip: 'Search',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              McButton(label: 'Primary Button', onPressed: () {}),
              const SizedBox(height: 16),
              McChip(
                type: ChipType.input,
                label: 'Warning Chip',
                style: ChipStyle.filled,
                kind: ChipKind.warning,
                onDeleted: () => print('Deleted'),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                child: McConnectionDetails(
                  title: 'Wi-Fi Network',
                  status: 'Connected',
                  bullets: const [
                    BulletItem('High-speed internet connection'),
                    BulletItem('Secure WPA3 encryption'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              McTextField(
                hintText: 'Input text',
                onAttachPressed: () => print('Attach'),
                onSendPressed: () => print('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Theme Configuration

`McApp` extends `MaterialApp` and automatically configures light and dark themes from design tokens. All `MaterialApp` parameters are supported, including routing, localization, shortcuts, and more.

```dart
// Force light mode
McApp(
  title: 'My App',
  themeMode: ThemeMode.light,
  home: HomePage(),
)

// Force dark mode
McApp(
  title: 'My App',
  themeMode: ThemeMode.dark,
  home: HomePage(),
)

// Auto (default) - follows system theme
McApp(
  title: 'My App',
  themeMode: ThemeMode.system,  // or omit this parameter
  home: HomePage(),
)

// With advanced MaterialApp features
McApp(
  title: 'My App',
  shortcuts: myShortcuts,
  actions: myActions,
  localizationsDelegates: myDelegates,
  home: HomePage(),
)
```

### Testing Dark/Light Mode

**Option 1: System Theme (Recommended)**
`McApp` uses `ThemeMode.system` by default, so your app automatically follows the device's theme setting:

- **macOS/iOS**: System Preferences → Appearance → Light/Dark
- **Android**: Settings → Display → Dark theme
- **Chrome DevTools**: F12 → ⋮ menu → More tools → Rendering → Emulate CSS `prefers-color-scheme`

**Option 2: Manual Toggle**
Add a theme switcher in your app for testing:

```dart
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return McApp(
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.brightness_6),
              onPressed: () {
                setState(() {
                  _themeMode = _themeMode == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
                });
              },
            ),
          ],
        ),
        body: YourContent(),
      ),
    );
  }
}
```

**Option 3: Force Specific Theme**

```dart
McApp(
  themeMode: ThemeMode.dark,  // Always dark
  // or ThemeMode.light for always light
  home: HomePage(),
)
```

### Advanced: Manual Theme Setup

If you need to use `MaterialApp` directly instead of `McApp`, configure themes manually:

```dart
import 'package:mc_flutter_tokens/flutter_tokens.dart';

MaterialApp(
  theme: McTokens().toThemeData(),
  darkTheme: McTokens(darkMode: true).toThemeData(),
  themeMode: ThemeMode.system,
  // ... rest of your app
)
```

> **Note**: Using `McApp` is recommended as it simplifies setup and automatically stays compatible with future Flutter updates.

## Components

The design system includes the following components:

- **Buttons** (`McButton`) - Primary, secondary, and tertiary button variants
- **Cards** (`McCard`) - Container components with different styles
- **Chips** (`McChip`) - Status indicators and tags
- **Connection Details** (`McConnectionDetails`) - Network/device status displays
- **Icons** (`Mc*Icon`) - Custom McAfee-branded icons
- **And more...**

## Documentation

View interactive component documentation using Widgetbook:

```bash
cd widget_book
flutter run
```

Navigate to the Widgetbook interface to explore all components with live examples and playgrounds.

## Troubleshooting

### Components not showing colors/tokens

**Problem**: Colors, icons, or design tokens not appearing correctly in your app.

**Solution 1 (Recommended)**: Use `McApp` which automatically configures themes:

```dart
void main() {
  runApp(
    McApp(
      title: 'My McAfee App',
      home: YourHomePage(),
    ),
  );
}
```

**Solution 2 (Manual)**: Configure themes manually in `MaterialApp`:

```dart
import 'package:mc_flutter_tokens/flutter_tokens.dart';

void main() {
  runApp(
    MaterialApp(
      theme: McTokens().toThemeData(),           // Light theme
      darkTheme: McTokens(darkMode: true).toThemeData(),  // Dark theme
      themeMode: ThemeMode.system,               // Auto-switch based on system
      home: YourHomePage(),
    ),
  );
}
```

The themes include all necessary theme extensions with color tokens, typography tokens, and spacing tokens.

### MaterialLocalizations error with McSideSheet

**Problem**: Error "No MaterialLocalizations found" when opening side sheet.

**Solution**: Ensure `McSideSheet.show()` is called within a `MaterialApp` or `McApp` widget tree:

```dart
void main() {
  runApp(
    McApp(  // Automatically provides MaterialApp context
      title: 'My McAfee App',
      home: YourApp(),
    ),
  );
}
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## Repository

[https://github.com/mcafee-eng/pegasus-flutter](https://github.com/mcafee-eng/pegasus-flutter)
