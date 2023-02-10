import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/RecipeListModel.dart';
import '../recipe.dart';

class MainDishPage extends StatefulWidget {
  const MainDishPage({Key? key}) : super(key: key);

  @override
  State<MainDishPage> createState() => _MainDishPageState();
}

class _MainDishPageState extends State<MainDishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Scrollbar(
          child: Container(
            padding: EdgeInsets.all(3),
            child: ChangeNotifierProvider(
              create: (_) => RecipeMainListModel()..getRecipes(),
              child: Consumer<RecipeMainListModel>(builder: (context, model, child) {
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
                                        ? Image.network(recipes[index].recipeImagePath, fit: BoxFit.cover)
                                        : Image.asset("assets/No_Image.png"),
                                  )),
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
            ),
          )),
    );
  }
}
