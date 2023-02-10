import 'package:flutter/material.dart';

import 'package:lomenu/menu/menu.dart';
import 'package:lomenu/menu/main_dish.dart';
import 'package:lomenu/menu/side_dish.dart';
import 'package:lomenu/menu/soup.dart';
import 'package:lomenu/menu/meal.dart';
import 'package:lomenu/menu/dessert.dart';

class MenuHomeScreen extends StatefulWidget {
  const MenuHomeScreen({Key? key}) : super(key: key);

  @override
  State<MenuHomeScreen> createState() => _MenuHomeScreen();
}

class _MenuHomeScreen extends State<MenuHomeScreen> {

  TabBar get _tabBar =>
      const TabBar(
        isScrollable: true,
        labelColor: Colors.black,
        indicatorColor: Colors.black,

        tabs: [
          Tab(text: "全て"),
          Tab(text: "主菜"),
          Tab(text: "副菜"),
          Tab(text: "汁物"),
          Tab(text: "ご飯物"),
          Tab(text: "デザート"),
        ],
      );

  @override
  Widget build(BuildContext context) {

    // print("####################");
    // print(_kosu.length);
    // print(_kosu);
    // print(ingredient_you_have.length);
    // print(ingredient_you_have);

    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 6, // タブの数
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0.0,
          flexibleSpace: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              color: Colors.white, //<-- SEE HERE
              child: _tabBar,
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: const TabBarView(
          children: <Widget>[
            Menu(),
            MainDishPage(),
            SideDishPage(),
            SoupPage(),
            MealPage(),
            DessertPage()
          ],
        ),
      ),
    );
  }
}
