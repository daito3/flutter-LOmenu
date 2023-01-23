import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lomenu/Model/UserRecipeModel.dart';

class RecipeListModel extends ChangeNotifier {
  List<RecipeModel> userRecipes = [];

  Future getRecipes() async {
    var collection = await FirebaseFirestore.instance
        .collection('recipe')
        .get();

    userRecipes = collection.docs
        .map((doc) =>
        RecipeModel(doc['recipeName'], doc['recipeImagePath'], doc.id))
        .toList();

    this.userRecipes = userRecipes;

    notifyListeners();
  }
}

class UserRecipeListModel extends ChangeNotifier {
  List<UserRecipeModel> userRecipes = [];

  Future getRecipes() async {
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

class RecipeMainListModel extends ChangeNotifier {

  List<RecipeMainModel> userRecipes = [];

  Future getRecipes() async {
    var collection =
        await FirebaseFirestore.instance
            .collection('recipe')
            .where('selectedCuisine', isEqualTo: '主菜')
            .get();

    userRecipes = collection.docs
        .map((doc) =>
        RecipeMainModel(doc['recipeName'], doc['recipeImagePath'], doc.id))
        .toList();

    this.userRecipes = userRecipes;

    notifyListeners();
  }
}
