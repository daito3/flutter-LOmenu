import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

List<String> _foodListMeat = [
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

List<String> _meatImageList = [
  "lomenu-2-1-tori-momo.png",
  "lomenu-2-2-tori-mune.png",
  "lomenu-2-3-tori-sasami.png",
  "lomenu-2-4-buta-komagire.png",
  "lomenu-2-5-buta-rousu.png",
  "lomenu-2-6-buta-momo.png",
  "lomenu-2-7-buta-bara.png",
  "lomenu-2-8-buta-hire.png",
  "lomenu-2-9-usi-komagire.png",
  "lomenu-2-10-usi-rousu.png",
  "lomenu-2-11-usi-momo.png",
  "lomenu-2-12-usi-bara.png",
  "lomenu-2-13-usi-hire.png",
  "lomenu-2-14-hikiniku-chicken.png",
  "lomenu-2-15-hikiniku-pork.png",

  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
  "lomenu-1-6-piman.png",
];

class Meatform extends StatefulWidget {
  const Meatform({Key? key}) : super(key: key);

  @override
  State<Meatform> createState() => _MeatformState();
}

class _MeatformState extends State<Meatform> {
  int _counterMeat = 0;

  String ok = "no";

  List<int> _MeatNumber = [
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
      _counterMeat = 0;
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _MeatNumber.clear();
        for (var i = 0; i <= _foodListMeat.length - 1; i++) {
          if (prefs.getInt(_foodListMeat[i]) == 0) {
            prefs.setInt(_foodListMeat[i], 0);
            _MeatNumber.add(0);
          } else {
            _counterMeat = prefs.getInt(_foodListMeat[i]) ?? 0;
            _MeatNumber.add(_counterMeat);
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
            itemCount: _foodListMeat.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.white,
                height: 50,
                child: Card(
                  elevation: 15,
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
                                  'assets/lomenu-food/' + _meatImageList[index],
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
                                                        _foodListMeat[index],
                                                        _MeatNumber[index]);
                                                  }

                                                  setState(() {
                                                    if (_MeatNumber[index] !=
                                                        0) {
                                                      _MeatNumber[index] =
                                                          decrement(_MeatNumber[
                                                              index]);
                                                      _setPlefItem();
                                                    } else {}
                                                  });
                                                },
                                                icon: const Icon(Icons.remove,
                                                    color: Colors.red)),
                                            Stack(
                                              children: [
                                                Text(_MeatNumber[index]
                                                    .toString()),
                                              ],
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  _setPlefItem() async {
                                                    final prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    prefs.setInt(
                                                        _foodListMeat[index],
                                                        _MeatNumber[index]);
                                                  }

                                                  setState(() {
                                                    if (_MeatNumber[index] !=
                                                        99) {
                                                      _MeatNumber[index] =
                                                          increment(_MeatNumber[
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
                          child: Container(
                            color: Colors.white,
                            child: Center(
                                child: Text(
                              _foodListMeat.elementAt(index),
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
