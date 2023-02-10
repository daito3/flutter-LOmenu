import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //　フルーツ・甘物　17
  "リンゴ",
  "バナナ",
  "オレンジ",
  "いちご",
  "キウイ",
  "ぶどう",
  "もも",
  "スイカ",
  "メロン",
  "さくらんぼ",
  "なし",
  "柿",
  "パイナップル",
  "ブルーベリー",
  "ジャム",
  "ピーナッツバター",
  "チョコレート",
  "レーズン",
  "ナッツ",
];

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

  //　フルーツ・ジャム　19
  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0,
];

List<String> ingredient_you_have = [];

int _counter = 0;

class MypageIngredients extends StatefulWidget {
  const MypageIngredients({Key? key}) : super(key: key);

  @override
  State<MypageIngredients> createState() => _MypageIngredientsState();
}

class _MypageIngredientsState extends State<MypageIngredients> {

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

        ingredient_you_have.clear();
        for (var j = 0; j <=_testList.length - 1; j++) {
          if (_kosu[j] != 0) {
            ingredient_you_have.add(_testList[j]);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
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
          SizedBox(height: screenSize.height * 0.01),
          Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                child: const Text(
                  "家にある食材",
                  style: TextStyle(
                    fontSize: 27,
                  ),
                ),
              )),
          Expanded(
            flex: 7,
              child: Container(
                child: Text(ingredient_you_have.toString()),
              ))
        ],
      ),
    );
  }
}
