import 'package:e_commerce/provider/dark_theme_provider.dart';
import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/screens/categories.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:e_commerce/screens/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentPageIndex = 0;
  final List _pages = [
    const HomeScreen(),
    CategoriesScreen(),
    const CartScreen(),
    const UserScreen(),
  ];

  void _selectPage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        body: _pages[currentPageIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentPageIndex,
          onDestinationSelected: _selectPage,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          elevation: 0.5,
          indicatorColor: themeState.getDarkTheme
              ? Theme.of(context).dialogBackgroundColor
              : Colors.grey,
          // backgroundColor: themeState.getDarkTheme
          //     ? Theme.of(context).scaffoldBackgroundColor
          //     : Colors.white,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
        ));
  }
}
