import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/flutter_tokens.dart';

/// A convenience wrapper around [MaterialApp] that automatically configures
/// McAfee Design System themes using [McTokens].
///
/// This widget simplifies theme setup for client applications by handling
/// both light and dark theme initialization from design tokens.
///
/// Example:
/// ```dart
/// void main() {
///   runApp(
///     McApp(
///       title: 'My McAfee App',
///       home: MyHomePage(),
///     ),
///   );
/// }
/// ```
///
/// You can still customize theme properties by passing additional parameters:
/// ```dart
/// McApp(
///   title: 'My App',
///   themeMode: ThemeMode.dark, // Force dark mode
///   locale: const Locale('es', 'ES'),
///   home: MyHomePage(),
/// )
/// ```
///
/// This widget forwards all [MaterialApp] parameters, so any feature available
/// in [MaterialApp] is also available in [McApp].
class McApp extends MaterialApp {
  /// Creates a McAfee Design System app with automatic theme configuration.
  ///
  /// This constructor automatically initializes [theme] and [darkTheme]
  /// using `McTokens().toThemeData()` and `McTokens(darkMode: true).toThemeData()`.
  ///
  /// All standard [MaterialApp] parameters are supported.
  McApp({
    super.key,
    super.navigatorKey,
    super.scaffoldMessengerKey,
    super.home,
    super.routes = const <String, WidgetBuilder>{},
    super.initialRoute,
    super.onGenerateRoute,
    super.onGenerateInitialRoutes,
    super.onUnknownRoute,
    super.onNavigationNotification,
    super.navigatorObservers = const <NavigatorObserver>[],
    super.builder,
    super.title = '',
    super.onGenerateTitle,
    super.color,
    super.locale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales = const <Locale>[Locale('en', 'US')],
    super.debugShowMaterialGrid = false,
    super.showPerformanceOverlay = false,
    super.checkerboardRasterCacheImages = false,
    super.checkerboardOffscreenLayers = false,
    super.showSemanticsDebugger = false,
    super.debugShowCheckedModeBanner = true,
    super.shortcuts,
    super.actions,
    super.restorationScopeId,
    super.scrollBehavior,
    super.themeAnimationDuration,
    super.themeAnimationCurve,
    super.themeAnimationStyle,
    super.highContrastTheme,
    super.highContrastDarkTheme,
    super.themeMode,
  }) : super(
         theme: McTokens().toThemeData(),
         darkTheme: McTokens(darkMode: true).toThemeData(),
       );
}
