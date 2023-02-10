import 'package:flutter/material.dart';

import 'package:lomenu/mypage/mypage_recommended.dart';
import 'package:lomenu/mypage/mypage_expenditure.dart';
import 'package:lomenu/mypage/mypage_Ingredients_at_home.dart';

class MyPage extends StatefulWidget {
  final String? email;

  const MyPage({Key? key, this.email}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  static List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MypageRecommended(),
          MypageExpenditure(),
          MypageIngredients(),
        ]),
      ),
    );
  }
}
