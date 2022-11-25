import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lomenu/food/tabu_ber.dart';
import 'package:lomenu/make_recipe/new_recipe.dart';
import 'package:lomenu/receipt.dart';


import 'home.dart';
import 'menu/menu.dart';



final baseTabViewProvider = StateProvider<ViewType>((ref) => ViewType.home);

enum ViewType { home, info, help, recipe ,receipt,}

class BaseTabView extends ConsumerWidget {
  BaseTabView({Key? key}) : super(key: key);

  final widgets = [
    MyHomePage(),
    HomeScreen(),
    Menu(),
    NewRecipe(),
    Receipt(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = ref.watch(baseTabViewProvider.state);
    return Scaffold(
      //appBar: AppBar(title: Text(view.state.name)),
      body: widgets[view.state.index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.kitchen), label: 'food'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'menu'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'new-recipe'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'receipt'),
        ],
        currentIndex: view.state.index,
        onTap: (int index) => view.update((state) => ViewType.values[index]),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}