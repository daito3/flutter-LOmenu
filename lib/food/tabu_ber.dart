import 'package:flutter/material.dart';
import 'vegetable.dart';
import 'meat.dart';
import 'fish.dart';
import 'staple_food.dart';
import 'dairy_products.dart';
import 'seasoning.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  TabBar get _tabBar => const TabBar(
    labelColor: Colors.black,
    indicatorColor: Colors.black,
    tabs: [
      Tab(text: "野菜"),
      Tab(text: "肉",),
      Tab(text: "魚介",),
      Tab(text: "主食"),
      Tab(text: "乳製品",),
      Tab(text: "調味料",),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 6, // タブの数
      child: Scaffold(
        appBar: AppBar(

          title: const Text('食材管理'),

          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ],

          bottom: PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: Material(
            color: Colors.white, //<-- SEE HERE
            child: _tabBar,
          ),
        ),
        backgroundColor: const Color(0xFFff8e3c),
      ),
        body: const TabBarView(
          children: <Widget>[
            Foodform(),
            Meatform(),
            Fishform(),
            Staplefood(),
            Dairyproducts(),
            Seasoning(),
          ],
        ),
      ),
    );
  }
}