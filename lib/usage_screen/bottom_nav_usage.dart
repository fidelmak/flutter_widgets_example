import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/cart': (context) => CartScreen(),
        '/favorites': (context) => FavoritesScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onIconPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/search');
        break;
      case 2:
        Navigator.pushNamed(context, '/cart');
        break;
      case 3:
        Navigator.pushNamed(context, '/favorites');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Screen', style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onIconPressedCallback: _onIconPressed,
        icons: [
          Icons.home,
          Icons.search,
          Icons.card_travel,
          Icons.favorite_border,
        ],
        labels: ['Home', 'Search', 'Cart', 'Favorites'],
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        backgroundColor: Colors.white,
        iconSize: 30.0,
        borderRadius: 30.0,
        height: 60.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.all(5.0),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Search Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Cart Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Favorites Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
