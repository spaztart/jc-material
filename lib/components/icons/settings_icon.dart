import 'package:flutter/material.dart';

// McSettings Icon - Material Design outlined gear with thinner stroke
class McSettingsIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McSettingsIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return IconTheme(
      data: IconThemeData(
        color: iconColor,
        size: size,
        weight: 300, // Thinner stroke weight
      ),
      child: Icon(Icons.settings_outlined, size: size, color: iconColor),
    );
  }
}
