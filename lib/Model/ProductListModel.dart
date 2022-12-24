import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ProductModel.dart';

class ProductListModel extends ChangeNotifier{
  List<ProductModel> products = [];

  Future getProducts() async {
    var collection =
        await FirebaseFirestore.instance.collection('products').get();
    // firestoreに格納されている'products'というコレクションから全てのデータを取得しています。

    // コレクション : products
    // ドキュメント : product1
    // フィールド　 : name:"aaa",price:'1000'

    products = collection.docs
        .map((doc) => ProductModel(doc['name'], doc['price'], doc.id))
        .toList();

    this.products = products;

    notifyListeners();
  }
}

