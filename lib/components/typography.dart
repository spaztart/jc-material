import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';

class Header extends StatelessWidget {
  final int level;
  final bool strong;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  const Header({
    super.key,
    this.level = 4,
    this.strong = false,
    required this.child,
    this.padding,
    this.color,
  }) : assert(level >= 1 && level <= 9, 'Header level must be between 1 and 9');

  @override
  Widget build(BuildContext context) {
    TextStyle style = _getHeaderStyle(context);
    if (strong) {
      style = style.copyWith(fontWeight: FontWeight.w700);
    }
    final Color defaultTextColor = const Color(0xFF1C1B1C);
    style = style.copyWith(color: color ?? defaultTextColor);
    return DefaultTextStyle(
      style: style,
      child: Container(padding: padding, child: child),
    );
  }

  TextStyle _getHeaderStyle(BuildContext context) {
    final typographyTokens = context.typographyTokens;
    switch (level) {
      case 1:
        return typographyTokens.displayLarge;
      case 2:
        return typographyTokens.displayMedium;
      case 3:
        return typographyTokens.displaySmall;
      case 4:
        return typographyTokens.headlineLarge;
      case 5:
        return typographyTokens.headlineMedium;
      case 6:
        return typographyTokens.headlineSmall;
      case 7:
        return typographyTokens.titleLarge;
      case 8:
        return typographyTokens.titleMedium;
      case 9:
        return typographyTokens.titleSmall;
      default:
        return typographyTokens.headlineLarge;
    }
  }
}

class Body extends StatelessWidget {
  final int level;
  final bool strong;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  const Body({
    super.key,
    this.level = 3,
    this.strong = false,
    required this.child,
    this.padding,
    this.color,
  }) : assert(level >= 1 && level <= 5, 'Body level must be between 1 and 5');

  @override
  Widget build(BuildContext context) {
    TextStyle style = _getBodyStyle(context);
    if (strong) {
      style = style.copyWith(fontWeight: FontWeight.w600);
    }
    final Color defaultTextColor = const Color(0xFF1C1B1C);
    style = style.copyWith(color: color ?? defaultTextColor);
    return DefaultTextStyle(
      style: style,
      child: Container(padding: padding, child: child),
    );
  }

  TextStyle _getBodyStyle(BuildContext context) {
    final typographyTokens = context.typographyTokens;
    switch (level) {
      case 1:
        return typographyTokens.bodyLarge;
      case 2:
        return typographyTokens.bodyMedium;
      case 3:
        return typographyTokens.bodySmall;
      case 4:
        return typographyTokens.labelLarge;
      case 5:
        return typographyTokens.labelSmall;
      default:
        return typographyTokens.bodySmall;
    }
  }
}
