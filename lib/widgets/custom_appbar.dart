import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double elevation;
  final Color backgroundColor;
  final TextStyle? titleStyle;

  CustomAppBar({
    required this.title,
    this.actions,
    this.elevation = 4.0,
    this.backgroundColor = Colors.blue,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: titleStyle ?? TextStyle(color: Colors.white, fontSize: 20),
      ),
      actions: actions,
      elevation: elevation,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
