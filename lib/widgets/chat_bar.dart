import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
    this.backgroundColor,
    this.borderRadius = 8.0,
    this.horizontalPadding = 4.0,
    this.opacity = 0.65,
    this.isDarkMode,
  });

  final double fill;

  // Customizable properties
  final Color? backgroundColor;
  final double borderRadius;
  final double horizontalPadding;
  final double opacity;
  final bool? isDarkMode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveDarkMode = isDarkMode ??
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final barColor = backgroundColor ??
        (effectiveDarkMode
            ? theme.colorScheme.secondary
            : theme.colorScheme.primary.withOpacity(opacity));

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(borderRadius),
              ),
              color: barColor,
            ),
          ),
        ),
      ),
    );
  }
}
