import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool isLoading = false;

  Future<String> _getFutureValue() async {
    // 擬似的に通信中を表現するために１秒遅らせる
    await Future.delayed(
      Duration(seconds: 1),
    );

    if (isLoading == false){

    }

    isLoading = true;


    try {
      // 必ずエラーを発生させる
      throw Exception("データの取得に失敗しました");
    } catch (error) {
    return Future.error(error);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Scrollbar(
      child: Container(
          padding: EdgeInsets.fromLTRB(3, 10, 3, 3),
          child: ChangeNotifierProvider(
            create: (_) => UserRecipeListModel()..getRecipes(),
            child: Consumer<UserRecipeListModel>(builder: (context, model, child) {
              final recipes = model.userRecipes;
              return FutureBuilder(
                future: _getFutureValue(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (isLoading == true) {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: recipes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(4),
                          // color: Colors.white,
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
                            child: Stack(
                              children: [
                                Center(
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
                                            child: recipes[index].recipeImagePath != null
                                                ? Image.network(recipes[index].recipeImagePath, fit: BoxFit.cover)
                                                : Image.asset("assets/No_Image.png")),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(recipes[index].recipeName),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: TextButton(
                                                      onPressed: ((){}),
                                                      child: Container(
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons.edit,color: Colors.blue,),
                                                            Text(
                                                              '編集',
                                                              style: TextStyle(
                                                                  color: Colors.blue),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: TextButton(
                                                      onPressed: ((){
                                                        showDialog(context: context, builder: (context) {
                                                          return AlertDialog(
                                                            title: Text("レシピ 消去"),
                                                            content: Text("本当に消去してもかまいませんか？"),
                                                            actions: [
                                                              TextButton(
                                                                  child: Text('Cancel'),
                                                                  onPressed: () => Navigator.pop(context)),
                                                              TextButton(
                                                                child: Text('OK'),

                                                                onPressed: (() async {
                                                                  final auth = FirebaseAuth.instance;
                                                                  final uid = auth.currentUser?.uid.toString();

                                                                  setState((){
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection("recipe")
                                                                        .doc(recipes[index].recipeId)
                                                                        .delete();

                                                                    isLoading = false;
                                                                  });

                                                                  Navigator.pop(context);
                                                                }),
                                                              )
                                                            ],
                                                          );
                                                        });
                                                      }),
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.delete,color: Colors.red,),
                                                          Text(
                                                            '消去',
                                                            style: TextStyle(
                                                                color: Colors.red),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
              );
            }),
          )),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFff8e3c),
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return RecipeName();
          }));
          setState(() {
            isLoading = false;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

}
