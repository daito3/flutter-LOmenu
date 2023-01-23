import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

//　食材のリスト
List<String> _foodListFish = [
  '鶏もも肉',
  '鶏むね肉',
  '鶏ささみ',
  '豚細切れ肉',
  '豚ロース肉',
  '豚もも肉',
  '豚バラ肉',
  '豚ヒレ肉',
  '牛細切れ肉',
  '牛ロース肉',
  '牛もも肉',
  '牛バラ肉',
  '牛ヒレ肉',
  "鶏ミンチ",
  "豚ミンチ",
  "牛ミンチ",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V"
];

//　カウンターのimage
List<String> _fishImageList = [
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",

  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
];

class Fishform extends StatefulWidget {
  const Fishform({Key? key}) : super(key: key);

  @override
  State<Fishform> createState() => _FishformState();
}

class _FishformState extends State<Fishform> {
  int _counterFish = 0;

  String ok = "no";

  //　食材の個数のリスト
  List<int> _FishNumber = [
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
      _counterFish = 0;
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _FishNumber.clear();
        for (var i = 0; i <= _foodListFish.length - 1; i++) {
          if (prefs.getInt(_foodListFish[i]) == 0) {
            prefs.setInt(_foodListFish[i], 0);
            _FishNumber.add(0);
          } else {
            _counterFish = prefs.getInt(_foodListFish[i]) ?? 0;
            _FishNumber.add(_counterFish);
          }
        }
      });
    });
  }

  int decrement(int index) {
    return index - 1;
  }

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
            itemCount: _foodListFish.length,
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
                  // elevation: 15,
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
                                      'assets/lomenu-food/' + _fishImageList[index],
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
                                                        _foodListFish[index],
                                                        _FishNumber[index]);
                                                  }

                                                  setState(() {
                                                    if (_FishNumber[index] !=
                                                        0) {
                                                      _FishNumber[index] =
                                                          decrement(_FishNumber[
                                                          index]);
                                                      _setPlefItem();
                                                    } else {}
                                                  });
                                                },
                                                icon: const Icon(Icons.remove,
                                                    color: Colors.red)),
                                            // Stack(
                                            //   children: [
                                            //     Text(_MeatNumber[index]
                                            //         .toString()),
                                            //   ],
                                            // ),
                                            IconButton(
                                                onPressed: () {
                                                  _setPlefItem() async {
                                                    final prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                    prefs.setInt(
                                                        _foodListFish[index],
                                                        _FishNumber[index]);
                                                  }

                                                  setState(() {
                                                    if (_FishNumber[index] !=
                                                        99) {
                                                      _FishNumber[index] =
                                                          increment(_FishNumber[
                                                          index]);
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
                      Expanded(
                        flex: 1,
                        child: Text(_FishNumber[index].toString()),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            child: Center(
                                child: Text(
                                  _foodListFish.elementAt(index),
                                  textAlign: TextAlign.center,
                                )),
                          )),
                    ],
                  ),
                ),
              );
            }));
  }
}

