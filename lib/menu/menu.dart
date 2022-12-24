import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/UserRecipeListModel.dart';
import '../hamburger_menu/option.dart';
import '../recipe.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: ChangeNotifierProvider(
            create: (_) => RecipeListModel()..getRecipes(),
            child: Consumer<RecipeListModel>(builder: (context, model, child) {
              final recipes = model.userRecipes;
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: recipes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    child: Card(
                      elevation: 15,
                      child: GestureDetector(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipeView(
                                      userRecipeId: recipes[index].recipeId)));
                        }),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 5,
                                child: Image.asset("assets/No_Image.png")
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(recipes[index].recipeName),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          )),
    );
  }
}
