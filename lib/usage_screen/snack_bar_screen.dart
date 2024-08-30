import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationBar extends StatelessWidget {
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
    required BuildContext context,
  });

  @override
  Widget build(BuildContext context) {
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
      width: maxWidth,
    );

    return Builder(
      builder: (context) {
        // Build method returns a widget that can be used to show the SnackBar.
        // The actual showing of the SnackBar should be triggered from an action (e.g., button press).
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Container(
            width: maxWidth,
            height:
                1, // Invisible container to handle taps for showing Snackbar
          ),
        );
      },
    );
  }

  void show() {}
}
// Make sure to import your NotificationBar class.

class NotificationDemoScreen extends StatelessWidget {
  const NotificationDemoScreen({Key? key}) : super(key: key);

  void showSuccessNotification(BuildContext context) {
    NotificationBar(
      context: context,
      title: "Success",
      message: "Operation completed successfully!",
      icon: CupertinoIcons.check_mark,
      backgroundColor: Colors.green,
    ).show();
  }

  void showErrorNotification(BuildContext context) {
    NotificationBar(
      context: context,
      title: "Error",
      message: "Something went wrong!",
      icon: Icons.close_sharp,
      backgroundColor: Colors.red,
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showSuccessNotification(context),
              child: const Text('Show Success Notification'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => showErrorNotification(context),
              child: const Text('Show Error Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
