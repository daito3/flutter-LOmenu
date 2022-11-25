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
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
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
                Expanded(
                    flex: 2,
                    child: Container(
                      height: double.infinity,
                      child: const Text(
                        "今日のおすすめ",
                        style: TextStyle(
                          fontSize: 30,
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
                                  margin: const EdgeInsets.all(10),
                                  child: Image.network(
                                      'https://d2ij38769uvyqz.cloudfront.net/inshokuten-com/supplier/upload_picture/suppBuyersMagazine/S1558920237646_1.jpg'),
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
            margin: const EdgeInsets.all(10),
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
                Expanded(
                    flex: 2,
                    child: Container(
                      height: double.infinity,
                      child: const Text(
                        "今月の支出",
                        style: TextStyle(
                          fontSize: 30,
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
                                margin: const EdgeInsets.all(15),
                                child: Container(
                                    // child: PieChart(
                                    //   PieChartData(
                                    //     startDegreeOffset: 270,
                                    //     sections: [
                                    //       PieChartSectionData(
                                    //           borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //               width: 1),
                                    //           color: Colors.white,
                                    //           value: 2 / 24 * 100,
                                    //           titlePositionPercentageOffset:
                                    //               0.7,
                                    //           title: "ゲーム\nテレビ",
                                    //           titleStyle:
                                    //               TextStyle(fontSize: 10),
                                    //           radius: 160),
                                    //       PieChartSectionData(
                                    //           borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //               width: 1),
                                    //           color: Colors.white,
                                    //           value: 1 / 24 * 100,
                                    //           titlePositionPercentageOffset:
                                    //               0.8,
                                    //           titleStyle:
                                    //               TextStyle(fontSize: 10),
                                    //           title: "寝る\n準備",
                                    //           radius: 160),
                                    //       PieChartSectionData(
                                    //           borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //               width: 1),
                                    //           color: Colors.white,
                                    //           value: 7 / 24 * 100,
                                    //           titlePositionPercentageOffset:
                                    //               0.5,
                                    //           title: "眠",
                                    //           titleStyle:
                                    //               TextStyle(fontSize: 10),
                                    //           radius: 160),
                                    //       PieChartSectionData(
                                    //           borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //               width: 1),
                                    //           color: Colors.white,
                                    //           value: 2 / 24 * 100,
                                    //           titleStyle:
                                    //               TextStyle(fontSize: 10),
                                    //           titlePositionPercentageOffset:
                                    //               0.7,
                                    //           title: "朝ご飯\nテレビ",
                                    //           radius: 160),
                                    //       PieChartSectionData(
                                    //           borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //               width: 1),
                                    //           color: Colors.white,
                                    //           value: 4 / 24 * 100,
                                    //           title: "?",
                                    //           titleStyle:
                                    //               TextStyle(fontSize: 60),
                                    //           titlePositionPercentageOffset:
                                    //               0.7,
                                    //           radius: 160),
                                    //       PieChartSectionData(
                                    //           borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //               width: 1),
                                    //           color: Colors.white,
                                    //           value: 2 / 24 * 100,
                                    //           title: "散歩",
                                    //           titleStyle:
                                    //               TextStyle(fontSize: 10),
                                    //           titlePositionPercentageOffset:
                                    //               0.7,
                                    //           radius: 160),
                                    //       PieChartSectionData(
                                    //           borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //               width: 1),
                                    //           color: Colors.white,
                                    //           value: 1 / 24 * 100,
                                    //           title: "晩御飯",
                                    //           titleStyle:
                                    //               TextStyle(fontSize: 10),
                                    //           titlePositionPercentageOffset:
                                    //               0.7,
                                    //           radius: 160),
                                    //       PieChartSectionData(
                                    //           borderSide: BorderSide(
                                    //               color: Colors.black,
                                    //               width: 1),
                                    //           color: Colors.white,
                                    //           value: 5 / 24 * 100,
                                    //           title:
                                    //               "家での自由時間\nテレビ\n漫画\nゲーム\nラジオ",
                                    //           titleStyle:
                                    //               TextStyle(fontSize: 10),
                                    //           titlePositionPercentageOffset:
                                    //               0.6,
                                    //           radius: 160),
                                    //     ],
                                    //     sectionsSpace: 0,
                                    //     centerSpaceRadius: 0,
                                    //   ),
                                    // )
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
                                          margin: EdgeInsets.fromLTRB(
                                              0, 20, 20, 20),
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
            margin: const EdgeInsets.all(10),
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
