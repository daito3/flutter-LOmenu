import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lomenu/Model/UserRecipeModel.dart';

class UserRecipeListModel extends ChangeNotifier {
  List<UserRecipeModel> userRecipes = [];

  Future getRecipes() async {
    await Future.delayed(
      Duration(seconds: 1),
    );

    final auth = FirebaseAuth.instance;
    final uid = auth.currentUser?.uid.toString();

    var collection = await FirebaseFirestore.instance
        .collection('recipe')
        .where('userUID', isEqualTo: uid)
        .get();

    userRecipes = collection.docs
        .map((doc) =>
            UserRecipeModel(doc['recipeName'], doc['recipeImagePath'], doc.id))
        .toList();

    this.userRecipes = userRecipes;

    notifyListeners();
  }
}
