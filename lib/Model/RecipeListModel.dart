import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'RecipeModel.dart';

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

bool readCheck = false;

class RecipeListModel extends ChangeNotifier {

  List<RecipeModel> userRecipes = [];

  Future getRecipes() async {

    final prefs = await SharedPreferences.getInstance();

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
    // print("#########  1  #########");
    // print(_kosu);

    ingredient_you_have.clear();
    for (var j = 0; j <=_testList.length - 1; j++) {
      if (_kosu[j] != 0) {
        ingredient_you_have.add(_testList[j]);
      }
    }
    // print("#########  2  #########");
    // print(ingredient_you_have);


    readCheck = true;

    if ( readCheck == true ) {
      var collection = await FirebaseFirestore.instance
          .collection('recipe')
          .where('ingredientList', arrayContainsAny: ingredient_you_have)
          .get();

      userRecipes = collection.docs
          .map((doc) =>
          RecipeModel(doc['recipeName'], doc['recipeImagePath'], doc.id))
          .toList();

      this.userRecipes = userRecipes;

      // print("#########  3  #########");

    }

    notifyListeners();
  }
}


class RecipeMainListModel extends ChangeNotifier {
  
  List<RecipeMainModel> userRecipes = [];

  Future getRecipes() async {

    final prefs = await SharedPreferences.getInstance();

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

    readCheck = true;

    if ( readCheck == true ) {
      var collection = await FirebaseFirestore.instance
          .collection('recipe').where('selectedCuisine', isEqualTo: '主菜')
          .where('ingredientList', arrayContainsAny: ingredient_you_have)
          .get();

      userRecipes = collection.docs
          .map((doc) =>
          RecipeMainModel(doc['recipeName'], doc['recipeImagePath'], doc.id))
          .toList();

      this.userRecipes = userRecipes;
    }

    notifyListeners();
  }
}

class RecipeSideListModel extends ChangeNotifier {

  List<RecipeSideModel> userRecipes = [];

  Future getRecipes() async {

    final prefs = await SharedPreferences.getInstance();

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

    readCheck = true;

    if ( readCheck == true ) {
      var collection = await FirebaseFirestore.instance
          .collection('recipe').where('selectedCuisine', isEqualTo: '副菜')
          .where('ingredientList', arrayContainsAny: ingredient_you_have)
          .get();

      userRecipes = collection.docs
          .map((doc) =>
          RecipeSideModel(doc['recipeName'], doc['recipeImagePath'], doc.id))
          .toList();

      this.userRecipes = userRecipes;
    }

    notifyListeners();
  }
}

class RecipeSoupListModel extends ChangeNotifier {

  List<RecipeSoupModel> userRecipes = [];

  Future getRecipes() async {

    final prefs = await SharedPreferences.getInstance();

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

    readCheck = true;

    if ( readCheck == true ) {
      var collection = await FirebaseFirestore.instance
          .collection('recipe').where('selectedCuisine', isEqualTo: '汁物')
          .where('ingredientList', arrayContainsAny: ingredient_you_have)
          .get();

      userRecipes = collection.docs
          .map((doc) =>
          RecipeSoupModel(doc['recipeName'], doc['recipeImagePath'], doc.id))
          .toList();

      this.userRecipes = userRecipes;
    }

    notifyListeners();
  }
}

class RecipeMealListModel extends ChangeNotifier {

  List<RecipeMealModel> userRecipes = [];

  Future getRecipes() async {

    final prefs = await SharedPreferences.getInstance();

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

    readCheck = true;

    if ( readCheck == true ) {
      var collection = await FirebaseFirestore.instance
          .collection('recipe').where('selectedCuisine', isEqualTo: 'ご飯物')
          .where('ingredientList', arrayContainsAny: ingredient_you_have)
          .get();

      userRecipes = collection.docs
          .map((doc) =>
          RecipeMealModel(doc['recipeName'], doc['recipeImagePath'], doc.id))
          .toList();

      this.userRecipes = userRecipes;
    }

    notifyListeners();
  }
}

class RecipeDessertListModel extends ChangeNotifier {

  List<RecipeDessertModel> userRecipes = [];

  Future getRecipes() async {

    final prefs = await SharedPreferences.getInstance();

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

    readCheck = true;

    if ( readCheck == true ) {
      var collection = await FirebaseFirestore.instance
          .collection('recipe').where('selectedCuisine', isEqualTo: 'デザート')
          .where('ingredientList', arrayContainsAny: ingredient_you_have)
          .get();

      userRecipes = collection.docs
          .map((doc) =>
          RecipeDessertModel(doc['recipeName'], doc['recipeImagePath'], doc.id))
          .toList();

      this.userRecipes = userRecipes;
    }

    notifyListeners();
  }
}
