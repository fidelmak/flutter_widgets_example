import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationBar {
  final BuildContext context;
  final String? title;
  final String? message;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Duration duration;
  final double borderRadius;
  final EdgeInsetsGeometry margin;
  final double maxWidth;
  final double messageSize;
  final double titleSize;

  NotificationBar({
    required this.context,
    this.title,
    this.message,
    this.icon = CupertinoIcons.info,
    this.backgroundColor = Colors.blueAccent,
    this.iconColor = Colors.white,
    this.duration = const Duration(seconds: 3),
    this.borderRadius = 30.0,
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.maxWidth = 200.0,
    this.messageSize = 15.0,
    this.titleSize = 15.0,
  });

  void show() {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                if (message != null)
                  Text(
                    message!,
                    style: TextStyle(
                      fontSize: messageSize,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor.withOpacity(0.9),
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      margin: margin,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

//////
