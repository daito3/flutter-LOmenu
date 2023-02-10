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

class IngredientLoader extends StatefulWidget {
  const IngredientLoader({Key? key}) : super(key: key);

  @override
  State<IngredientLoader> createState() => _IngredientLoaderState();
}

class _IngredientLoaderState extends State<IngredientLoader> {

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

            print("####################");
            print(_counter);
            print(_kosu);
            print(i);

          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
