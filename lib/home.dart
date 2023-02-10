import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'hamburger_menu/favorite.dart';
import 'login/sign-up.dart';

import 'package:lomenu/mypage/mypage.dart';
import 'package:lomenu/food/tabu_ber.dart';
import 'package:lomenu/menu/menu_tab_ber.dart';
import 'package:lomenu/make_recipe/new_recipe.dart';
import 'package:lomenu/receipt.dart';

import 'hamburger_menu/option.dart';
import 'hamburger_menu/account.dart';
import 'hamburger_menu/notification.dart';
import 'hamburger_menu/tip.dart';

class MyHomePage extends StatefulWidget {
  final String? email;

  const MyHomePage({Key? key, this.email}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _title = 'ホーム';
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.1,
              color: const Color(0xFFff8e3c),
              child: const Text(
                'Menu',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.center,
            ),

            // アカウントボタン
            Container(
              padding: EdgeInsets.fromLTRB(12, 6, 0, 0),
              child: TextButton(
                onPressed: (() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AccountPage();
                  }));
                }),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.015,
                    ),
                    Text(
                      'アカウント',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(Icons.arrow_forward_ios,
                                color: Colors.black),
                            alignment: Alignment.centerRight))
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
              // height: 25,
            ),
            // お気に入り
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: TextButton(
                onPressed: (() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return FavoritePage();
                  }));
                }),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      size: 32,
                      color: Colors.black,
                    ),
                    SizedBox(width: screenSize.width * 0.015),
                    Text(
                      'お気に入り',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      alignment: Alignment.centerRight,
                    ))
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
              // height: 25,
            ),
            //　通知ボタン
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: TextButton(
                onPressed: (() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NotificationPage();
                  }));
                }),
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 32,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.015,
                    ),
                    Text(
                      '通知',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                            alignment: Alignment.centerRight))
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
              // height: 25,
            ),
            // ヒント
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: TextButton(
                onPressed: (() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TipPage();
                  }));
                }),
                child: Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      size: 32,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.015,
                    ),
                    Text(
                      'ヒント',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                            alignment: Alignment.centerRight))
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
              // height: 25,
            ),
            // 設定
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: TextButton(
                onPressed: (() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return OptionPage();
                  }));
                }),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 32,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.015,
                    ),
                    Text(
                      '設定',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                            alignment: Alignment.centerRight))
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
              // height: 25,
            ),
            // ログアウト
            Container(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: TextButton(
                onPressed: (() {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("ログアウト"),
                          content: Text("本当にログアウトしてもかまいませんか？"),
                          actions: [
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: Text("OK"),
                              onPressed: (() {
                                FirebaseAuth.instance.signOut();
                                if (FirebaseAuth.instance.currentUser != null) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()));
                                }
                              }),
                            ),
                          ],
                        );
                      });
                }),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 30,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.015,
                    ),
                    Text(
                      'ログアウト',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                            alignment: Alignment.centerRight))
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
              // height: 25,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: const Color(0xFFff8e3c),
      ),
      body: [
        MyPage(),
        HomeScreen(),
        MenuHomeScreen(),
        NewRecipe(),
        Receipt(),
      ].elementAt(_selectedTab),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.kitchen), label: 'food'),
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
            switch (index) {
              case 0:
                _title = 'ホーム';
                break;
              case 1:
                _title = '食材管理';
                break;
              case 2:
                _title = '今日の献立';
                break;
              case 3:
                _title = 'レシピ作成';
                break;
              case 4:
                _title = 'レシート読み込み';
                break;
            }
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
