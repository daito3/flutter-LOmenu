import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

//食材のリスト
List<String> _testList = [
  // 野菜　種類:15
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

  // 肉 種類:16
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

  // 魚 種類:24
  "鮭",
  "さば",
  "ぶり",
  "たら",
  "アジ",
  "さんま",
  "イワシ",
  "まぐろ",
  "たい",
  "かれい",
  "ひらめ",
  "イカ",
  "たこ",
  "えび",
  "かに",
  "あさり",
  "しじみ",
  "ホタテ",
  "アワビ",
  "かき",
  "しらす",
  "ちりめんじゃこ",
  "たらこ",
  "いくら",

  //　主食・粉　15
  "米",
  "うどん",
  "麺",
  "パスタ",
  "そば",
  "そうめん",
  "食パン",
  "フランスパン",
  "もち",
  "小麦粉",
  "片栗粉",
  "パン粉",
  "お好み焼き粉",
  "たこ焼き粉",
  "ホットケーキミックス",

  //　卵・乳・豆　17
  "卵",
  "牛乳",
  "豆腐",
  "ヨーグルト",
  "クリーム",
  "スライスチーズ",

  "プロセスチーズ",
  "チーズ",
  "豆乳",
  "納豆",
  "油揚げ",
  "厚揚げ",

  "豆",
  "大豆",
  "あずき",
  "きなこ",
  "高野豆腐",

  // 調味料　24
  "塩",
  "こしょう",
  "さとう",
  "醤油",
  "料理酒",
  "みりん",
  "酢",
  "味噌",
  "バター",
  "サラダ油",
  "オリーブオイル",
  "ごま油",
  "マヨネーズ",
  "ケチャップ",
  "ドレッシング",
  "めんつゆ",
  "ポン酢",
  "レモン汁",
  "おろしニンニク",
  "おろししょうが",
  "コンソメ",
  "わさび",
  "からし",
  "オイスターソース",
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
  "lomenu-2-15-hikiniku-pork.png",

  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-12-squid.png",
  "lomenu-3-13-octopus.png",
  "lomenu-3-14-shrimp.png",
  "lomenu-3-15-crab.png",
  "lomenu-3-16-kai.png",
  "lomenu-3-16-kai.png",
  "lomenu-3-16-kai.png",
  "lomenu-3-16-kai.png",
  "lomenu-3-16-kai.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",
  "lomenu-3-1-fish.png",

  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",

  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",

  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
  "No_image.png",
];

class Seasoning extends StatefulWidget {
  const Seasoning({Key? key}) : super(key: key);

  @override
  State<Seasoning> createState() => _SeasoningState();
}

class _SeasoningState extends State<Seasoning> {
  // final prefs = SharedPreferences.getInstance();

  int _counter = 0;

  String ok = "no";

  //食材の個数のリスト
  List<int> _kosu = [
    // 野菜 15
    0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,

    // 肉 16
    0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0,

    // 魚 24
    0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0,

    // 主食・粉 15
    0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,

    // 卵・乳・豆 17
    0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0,

    //　調味料 24
    0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0,

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
    print("####################");
    print(_counter);
    print(_kosu);
    print("####################");
    return Scaffold(
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            // itemCount: _testList.length,
            itemCount: 15,
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
                                      'assets/lomenu-food/'+ _vegetableImageList[index + 87],
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
                                                        _testList[index + 87],
                                                        _kosu[index + 87]);
                                                  }

                                                  setState(() {
                                                    if (_kosu[index + 87] != 0) {
                                                      _kosu[index + 87] = decrement(
                                                          _kosu[index + 87]);
                                                      _setPlefItem();
                                                    } else {}
                                                  });
                                                },
                                                icon: const Icon(Icons.remove,
                                                    color: Colors.red)),
                                            IconButton(
                                                onPressed: () {
                                                  _setPlefItem() async {
                                                    final prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                    prefs.setInt(
                                                        _testList[index + 87],
                                                        _kosu[index + 87]);
                                                  }

                                                  setState(() {
                                                    if (_kosu[index + 87] != 99) {
                                                      _kosu[index + 87] = increment(
                                                          _kosu[index + 87]);
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
                      Expanded(flex: 1,child: Text(_kosu[index + 87].toString())),
                      Expanded(
                          flex: 1,
                          child: Container(
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                    child: Text(
                                      _testList.elementAt(index + 87),
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

