import 'package:flutter/material.dart';
import 'package:lomenu/mypage.dart';
import 'package:lomenu/receipt.dart';
import 'food/tabu_ber.dart';
import 'make_recipe/new_recipe.dart';
import 'menu/menu.dart';

class MyHomePage extends StatefulWidget {
  final String? email;

  const MyHomePage({Key? key, this.email}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: [
        MyPage(),
        HomeScreen(),
        Menu(),
        NewRecipe(),
        Receipt(),
      ].elementAt(_selectedTab),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.kitchen), label: 'food'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book), label: 'new-recipe'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: 'receipt'),
        ],
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
