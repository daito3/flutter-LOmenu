import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class RecipeView extends StatefulWidget {
  final userRecipeId;

  const RecipeView({Key? key, required this.userRecipeId}) : super(key: key);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  List? makingList;
  List? ingredientList;
  List? quantityList;

  String? selectedCuisine = "";
  String? recipeName = "";
  String? _imgPath = "";
  String? userName;
  String? createTime;

  Image _img = Image.asset("assets/No_Image.png");

  bool isLoading = false;

  Future<void> _dateload() async {
    var userUID;
    // makingList?.clear();
    // ingredientList?.clear();

    await Future.delayed(
      Duration(seconds: 1),
    );

    if (isLoading == false) {
      isLoading = false;
      final store = FirebaseFirestore.instance;

      try {
        await store
            .collection("recipe")
            .doc(widget.userRecipeId)
            .get()
            .then((DocumentSnapshot snapshot) {
          setState(() {
            makingList = snapshot.get('makingList');
            ingredientList = snapshot.get('ingredientList');
            quantityList = snapshot.get('quantityList');
            selectedCuisine = snapshot.get('selectedCuisine');
            recipeName = snapshot.get('recipeName');
            _imgPath = snapshot.get('recipeImagePath');
            userUID = snapshot.get('userUID');
            createTime = snapshot.get('createTime');
          });
        });

        if (userUID != "") {
          store
              .collection("userCollection")
              .doc(userUID)
              .get()
              .then((DocumentSnapshot snapshot) {
            setState(() {
              userName = snapshot.get('UserName');
            });
          });
        };

        if (_imgPath != "") {
          var imageUrl = await FirebaseStorage.instance
              .ref()
              .child("image/food/$_imgPath")
              .getDownloadURL();

          setState(() {
            _img = Image.network(imageUrl);
          });
        } else if (_imgPath == "") {
          setState(() {
            _img = Image.asset("assets/No_Image.png");
          });
        }

      } catch (e) {
        print(e);
      }

      isLoading = true;
    } else {}
    return _dateload();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipeName!),
        backgroundColor: const Color(0xFFff8e3c),
      ),
      body: FutureBuilder(
          future: _dateload(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (isLoading == true) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: screenSize.width * 1.0,
                      child: _img != null ? _img : Image.asset("assets/No_Image.png")
                      // child: Image.asset("assets/" + imgPath!),
                    ),
                    //
                    // レシピ　詳細情報
                    //
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite,size: 30,color: Colors.red,),
                                    // icon: const Icon(Icons.favorite_border,size: 30,color: Colors.red,)
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('投稿者：' + userName!),
                                Text('作成日：' + createTime!)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //
                    // 料理の材料
                    //
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Text(
                              "< 材料 >",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.01,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: ingredientList?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    SizedBox(height: screenSize.height * 0.01),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              ingredientList![index],
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              quantityList![index],
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenSize.height * 0.01,
                                    ),
                                    DottedLine(
                                      dashLength: 10,
                                      dashGapLength: 5,
                                      lineThickness: 2,
                                      dashRadius: 1,
                                      dashColor: Colors.grey,
                                    ),
                                  ],
                                );
                              }),
                          SizedBox(
                            height: screenSize.height * 0.06,
                          ),
                          //
                          // 料理の作り方
                          //
                          Container(
                            width: double.infinity,
                            child: Text(
                              "< 作り方 >",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.01,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: makingList?.length,
                              itemBuilder: (BuildContext context, int index) {
                                int kazu = index + 1;
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          kazu.toString() + '.',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        Expanded(
                                            child: Text(makingList![index])),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenSize.height * 0.01,
                                    )
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
