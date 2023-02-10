import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/RecipeListModel.dart';
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
      backgroundColor: Colors.grey[100],
      body: Scrollbar(
          child: Container(
            padding: EdgeInsets.all(3),
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
                      padding: EdgeInsets.all(4),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, //色
                              spreadRadius: 0.1,
                              blurRadius: 0.1,
                              offset: Offset(0.5, 0.5),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        // elevation: 15,
                        child: GestureDetector(
                          // behavior: HitTestBehavior.translucent,
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
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    child: recipes[index].recipeImagePath != null
                                        ? Image.network(recipes[index].recipeImagePath ,fit: BoxFit.cover)
                                        : Image.asset("assets/No_Image.png"),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
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
            ),
          )),
    );
  }
}
