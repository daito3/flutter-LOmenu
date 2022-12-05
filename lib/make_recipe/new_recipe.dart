import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lomenu/make_recipe/recipe_name_Add.dart';
import 'package:lomenu/recipe.dart';

class NewRecipe extends StatefulWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  State<NewRecipe> createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  List userRecipeID = [];
  List userRecipeName = [];
  List userRecipeImage = [];


  Image? _img;

  bool isLoading = false;

  // @override
  // void initState() {
  //
  // }

  Future<void> _userRecipeDate() async {
    await Future.delayed(
      Duration(seconds: 1),
    );

    if (isLoading == false) {
      isLoading = false;
      userRecipeID.clear();
      userRecipeImage.clear();
      userRecipeName.clear();

      final store = FirebaseFirestore.instance;
      final auth = FirebaseAuth.instance;
      final uid = auth.currentUser?.uid.toString();

      try {
        await store
            .collection("userCollection")
            .doc(uid)
            .get()
            .then((DocumentSnapshot snapshot) {
          userRecipeID = snapshot.get('recipeID');
          print('--------  1  ----------');
          print(userRecipeID[0]);
          print(userRecipeID.length);
          print('-----------------------');
          print('#####$userRecipeID######');
        });

        if (userRecipeID.length != 0) {
          for (var i = 0; i < userRecipeID.length; i++) {
            print('#############' + userRecipeID[i]);

            FirebaseFirestore.instance
                .collection("recipe")
                .doc(userRecipeID[i])
                .get()
                .then((DocumentSnapshot snapshot) {
              print('--------------------------');
              print(snapshot.get('recipeName'));
              print(snapshot.get('recipeImagePath'));
              print('--------------------------');

              setState(() {
                userRecipeName.add(snapshot.get('recipeName'));
                userRecipeImage.add(snapshot.get('recipeImagePath'));
              });
            });
          }
          ;
        }
      } catch (e) {
        print('--------------------------');
        print(e);
        print('--------------------------');
      }

      isLoading = true;
    } else {}
    return _userRecipeDate();
  }

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
      body: Container(
        child: FutureBuilder(
          future: _userRecipeDate(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (isLoading == true) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(10),
                // child: Text(userRecipeName![1]),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: userRecipeID.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.white,
                      child: Card(
                        elevation: 15,
                        child: GestureDetector(
                          onTap: ((){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecipeView(
                                      userRecipeId : userRecipeID[index]
                                    )));
                          }),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: userRecipeImage[index] != null
                                      ? Image.asset('assets/'+userRecipeImage[index])
                                      : Container(
                                          color: Colors.grey,
                                        )),
                              // child: userRecipeImage[index] != null
                              //     ? Image.network(userRecipeImage[index])
                              //     : Container(
                              //         color: Colors.grey,
                              //       )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Text(userRecipeName[index]),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
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
