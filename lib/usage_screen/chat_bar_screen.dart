import 'package:flutter/material.dart';

import '../widgets/chat_bar.dart';

void main() => runApp(ChartApp());

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChartScreen(),
    );
  }
}

class ChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart Example'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ChartBar(
              fill: 0.8,
              backgroundColor: Colors.blueAccent,
              borderRadius: 10.0,
              horizontalPadding: 4.0,
              opacity: 0.9,
            ),
            ChartBar(
              fill: 0.6,
              backgroundColor: Colors.greenAccent,
              borderRadius: 8.0,
              horizontalPadding: 4.0,
              opacity: 0.7,
            ),
            ChartBar(
              fill: 0.4,
              borderRadius: 12.0,
              horizontalPadding: 6.0,
              opacity: 0.6,
            ),
            ChartBar(
              fill: 0.9,
              backgroundColor: Colors.orange,
              borderRadius: 8.0,
              horizontalPadding: 4.0,
              opacity: 0.8,
              isDarkMode: true,
            ),
            ChartBar(
              fill: 0.3,
              backgroundColor: Colors.purple,
              borderRadius: 15.0,
              horizontalPadding: 2.0,
              opacity: 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
