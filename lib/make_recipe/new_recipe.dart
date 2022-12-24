import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lomenu/make_recipe/recipe_name_Add.dart';
import 'package:lomenu/recipe.dart';

import '../Model/UserRecipeListModel.dart';

class NewRecipe extends StatefulWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  State<NewRecipe> createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  Future getRecipesImage(String _imgPath) async {
    try {
      var imageUrl = await FirebaseStorage.instance
          .ref()
          .child("image/food/$_imgPath")
          .getDownloadURL();

      return imageUrl;
    } catch (e) {
      print("-----------");
      print(e);
      print("-----------");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: ChangeNotifierProvider(
            create: (_) => UserRecipeListModel()..getRecipes(),
            child: Consumer<UserRecipeListModel>(builder: (context, model, child) {
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFff8e3c),
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return RecipeName();
          }));
          setState(() {
            // isLoading = false;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
