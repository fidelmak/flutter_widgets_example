import 'package:flutter/material.dart';

import '../widgets/product_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ProductCard(
            image: 'assets/product1.png', // Update with actual asset path
            name: 'Product 1',
            category: 'Category A',
            price: 29.99,
            isLiked: true,
            isSelected: false,
            onSelected: (product) {
              // Handle product selection
              print('Product selected: ${product.name}');
            },
            backgroundColor: Colors.white,
            borderColor: Colors.grey,
            borderRadius: 15.0,
            iconColor: Colors.red,
            imageRadius: 50.0,
            titleColor: Colors.black,
            titleFontSize: 18.0,
            categoryFontSize: 14.0,
            priceFontSize: 20.0,
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          ProductCard(
            image: 'assets/product2.png', // Update with actual asset path
            name: 'Product 2',
            category: 'Category B',
            price: 49.99,
            isLiked: false,
            isSelected: true,
            onSelected: (product) {
              // Handle product selection
              print('Product selected: ${product.name}');
            },
            backgroundColor: Colors.grey[200]!,
            borderColor: Colors.blue,
            borderRadius: 20.0,
            iconColor: Colors.green,
            imageRadius: 40.0,
            titleColor: Colors.blueGrey,
            titleFontSize: 16.0,
            categoryFontSize: 12.0,
            priceFontSize: 18.0,
            margin: EdgeInsets.symmetric(vertical: 12),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          // Add more ProductCard widgets as needed
        ],
      ),
    );
  }
}
