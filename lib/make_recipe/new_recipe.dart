import 'package:flutter/material.dart';
import 'package:lomenu/make_recipe/recipe_name_Add.dart';

import 'ingredient_Add_Test.dart';
import 'making_Add.dart';

class NewRecipe extends StatefulWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  State<NewRecipe> createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;



    return Scaffold(
      appBar: AppBar(
        title: const Text('レシピ作成'),
        backgroundColor: const Color(0xFFff8e3c),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          height: screenSize.height * 1,
          color: Colors.red,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFff8e3c),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return RecipeName();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
