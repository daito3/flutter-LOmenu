import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

//食材のリスト
List<String> _testList = [
  '玉ねぎ',
  'じゃがいも',
  'にんじん',
  'キャベツ',
  '白菜',
  'ピーマン',
  'トマト',
  'きゅうり',
  '大根',
  'ナス',
  'かぼちゃ',
  'ねぎ',
  "しょうが",
  "にんにく",
  "ブロッコリー",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V"
];

//　カウンターのimage
List<String> _vegetableImageList = [
  "lomenu-1-1-onion.jpeg",
  "lomenu-1-2-potato.jpeg",
  "lomenu-1-3-carrot.jpeg",
  "lomenu-1-4-cabbage.png",
  "lomenu-1-5-Chinese-cabbage.jpeg",
  "lomenu-1-6-piman.png",
  "lomenu-1-7-tomato.jpeg",
  "lomenu-1-8-cucumber.jpeg",
  "lomenu-1-9-japanese-white-radish.jpeg",
  "lomenu-1-10-eggplant.jpeg",
  "lomenu-1-11-pumpkin.jpeg",
  "lomenu-1-12-japanese-leek.jpeg",
  "lomenu-1-13-ginger.png",
  "lomenu-1-14-garlic.png",
  "lomenu-1-15-broccoli.jpeg",

  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
];

class Foodform extends StatefulWidget {
  const Foodform({Key? key}) : super(key: key);

  @override
  State<Foodform> createState() => _FoodformState();
}

class _FoodformState extends State<Foodform> {
  // final prefs = SharedPreferences.getInstance();

  int _counter = 0;

  String ok = "no";

  //食材の個数のリスト
  List<int> _kosu = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  @override
  void initState() {
    super.initState();
    Future(() async {
      _counter = 0;
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _kosu.clear();
        for (var i = 0; i <= _testList.length - 1; i++) {
          if (prefs.getInt(_testList[i]) == 0) {
            prefs.setInt(_testList[i], 0);
            _kosu.add(0);
          } else {
            _counter = prefs.getInt(_testList[i]) ?? 0;
            _kosu.add(_counter);
          }
        }
      });
    });
  }

  //-1
  int decrement(int index) {
    return index - 1;
  }

  //+1
  int increment(int index) {
    return index + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: _testList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(4),
                height: 60,
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, //色
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset: Offset(0.5, 0.5),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  // elevation: 10,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              Center(
                                  child: Opacity(
                                opacity: 0.8,
                                child: Image.asset(
                                  'assets/lomenu-food/'+ _vegetableImageList[index],
                                ),
                              )),
                              Column(
                                children: [
                                  Expanded(flex: 3, child: Container()),
                                  Expanded(
                                      flex: 3,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  _setPlefItem() async {
                                                    final prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    prefs.setInt(
                                                        _testList[index],
                                                        _kosu[index]);
                                                  }

                                                  setState(() {
                                                    if (_kosu[index] != 0) {
                                                      _kosu[index] = decrement(
                                                          _kosu[index]);
                                                      _setPlefItem();
                                                    } else {}
                                                  });
                                                },
                                                icon: const Icon(Icons.remove,
                                                    color: Colors.red)),
                                            // Stack(
                                            //   children: [
                                            //     Text(kosu[index].toString()),
                                            //   ],
                                            // ),
                                            IconButton(
                                                onPressed: () {
                                                  _setPlefItem() async {
                                                    final prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    prefs.setInt(
                                                        _testList[index],
                                                        _kosu[index]);
                                                  }

                                                  setState(() {
                                                    if (_kosu[index] != 99) {
                                                      _kosu[index] = increment(
                                                          _kosu[index]);
                                                    }
                                                    _setPlefItem();
                                                  });
                                                },
                                                icon: const Icon(Icons.add,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      )),
                                  Expanded(flex: 3, child: Container()),
                                ],
                              )
                            ],
                          )),
                      Expanded(flex: 1,child: Text(_kosu[index].toString())),
                      Expanded(
                          flex: 1,
                          child: Container(
                              child: Container(
                            color: Colors.white,
                            child: Center(
                                child: Text(
                              _testList.elementAt(index),
                              textAlign: TextAlign.center,
                            )),
                          ))),
                    ],
                  ),
                ),
              );
            }));
  }
}
