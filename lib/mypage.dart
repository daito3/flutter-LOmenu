import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lomenu/igredientAdd.dart';
import 'package:lomenu/option.dart';

import 'make_recipe/ingredient_Add_Test.dart';
import 'login/sign-up.dart';
import 'make_recipe/making_Add.dart';

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
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        backgroundColor: const Color(0xFFff8e3c),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return OptionPage();
              }));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
            height: screenSize.height * 0.29,
            width: screenSize.width * 1,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, //色
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.01),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: double.infinity,
                      child: const Text(
                        "今日のおすすめ",
                        style: TextStyle(
                          fontSize: 27,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 8,
                    child: Container(
                      //color: Colors.grey,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                color: Colors.white,
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(10,0,10,10),
                                  child: Image.asset('assets/mypage_food_image.jpg')
                                  //color: Colors.red,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          //color: Colors.red,
                                          child: Text(
                                            "焼肉",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 6,
                                        child: Container(
                                          //color: Colors.red,
                                          margin: EdgeInsets.all(10),
                                          child: Text("みんなで食べに行きたいよね！"
                                              "肉大好き\n"
                                              "お腹hetta！"),
                                        )),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10,5,10,5),
            height: screenSize.height * 0.3,
            width: screenSize.width * 1,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, //色
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.01),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: double.infinity,
                      child: const Text(
                        "今月の支出",
                        style: TextStyle(
                          fontSize: 27,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 9,
                    child: Container(
                      //color: Colors.grey,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                //食材別の支出の円グラフ
                                // margin: const EdgeInsets.all(15),
                                child: Container(
                                  child: Image.asset('assets/LOmenu_gurahu.png'),
                                  ),
                              )),
                          Expanded(
                              flex: 4,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: Colors.white,
                                          margin: EdgeInsets.fromLTRB(
                                              0, 20, 20, 20),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    child: const Text(
                                                      '今週',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 7,
                                                  child: Container(
                                                    child: Text(
                                                      '3000円',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ), //後で変動するとこ
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: Colors.white,
                                          margin: EdgeInsets.fromLTRB(0, 20, 20, 20),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    child: const Text(
                                                      '合計',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 7,
                                                  child: Container(
                                                    child: Text(
                                                      '21000円',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                      //後で変動するとこ
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: screenSize.height * 0.28,
            width: screenSize.width * 1,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, //色
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text(widget.email ?? ""),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
