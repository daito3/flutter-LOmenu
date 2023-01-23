import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class RecipeReview extends StatefulWidget {
  final recipeName;
  final selectedCuisine;
  final imgPath;

  final List ingredientList;
  final List quantityList;
  final List makingList;

  const RecipeReview({
    Key? key,
    required this.makingList,
    required this.recipeName,
    required this.selectedCuisine,
    required this.ingredientList,
    required this.quantityList,
    required this.imgPath,
  }) : super(key: key);

  @override
  State<RecipeReview> createState() => _RecipeReviewState();
}

class _RecipeReviewState extends State<RecipeReview> {
  String testImage = 'test_image.jpg';
  var foodMap = Map();
  String? imageUrl;
  Image? _img;

  @override
  void initState() {
    Future(() async {
      String _imgPath = widget.imgPath;
      try {
        imageUrl = await FirebaseStorage.instance
            .ref()
            .child("image/food/$_imgPath")
            .getDownloadURL();

        setState(() {
          _img = Image.network(imageUrl!);
        });
      } catch (e) {
        print("-----------");
        print(e);
        print("-----------");
      }
    });
  }

  // String generateRandomString([int length = 32]) {
  //   const charset =
  //       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  //   final random = Random.secure();
  //   final randomStr =
  //       List.generate(length, (_) => charset[random.nextInt(charset.length)])
  //           .join();
  //   return randomStr;
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final auth = FirebaseAuth.instance;
    final uid = auth.currentUser?.uid.toString();

    for (int i = 0; i < widget.ingredientList.length; i++) {
      foodMap[widget.ingredientList[i]] = widget.quantityList[i];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFff8e3c),
        title: Text('レシピ　プレビュー'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          // child: Text(widget.makingList),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, //色
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: Offset(1, 1),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              children: [
                //
                // 料理の名前
                //
                Container(
                  width: screenSize.width * 1.0,
                  color: Color(0xFFff8e3c),
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.height * 0.003),
                      Text(
                        widget.recipeName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                    ],
                  ),
                ),
                //
                // 料理の写真
                //
                Container(
                  width: screenSize.width * 1.0,
                  child: _img,
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
                          itemCount: widget.ingredientList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                SizedBox(height: screenSize.height * 0.01),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          widget.ingredientList[index],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          widget.quantityList[index],
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
                          itemCount: widget.makingList.length,
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
                                        child: Text(widget.makingList[index])),
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
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFff8e3c),
        onPressed: () async {
          // print(widget.recipeName);
          // print(widget.selectedCuisine);
          // print(widget.imgPath);
          // print(widget.ingredientList);
          // print(widget.quantityList);
          // print(widget.makingList);

          try {
            //　作成時間の取得
            var now = DateTime.now();
            var createTime = "${now.year}/${now.month}/${now.day}";
            // var randomString = generateRandomString();

            //　レシピのデータをFirestoreに記録

            DocumentReference doc =
            await FirebaseFirestore.instance.collection('recipe').add({
              'recipeImagePath': imageUrl,
              'recipeName': widget.recipeName,
              'selectedCuisine': widget.selectedCuisine,
              'ingredientList': widget.ingredientList,
              'quantityList': widget.quantityList,
              'makingList': widget.makingList,
              'userUID': uid,
              'createTime': createTime,
            });

            String docId = doc.id;

            FirebaseFirestore.instance
                .collection('userCollection')
                .doc(uid)
                .update({
              'recipeID': FieldValue.arrayUnion([docId])
            });

          } catch (e) {
            print(e);
          }

          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        child: Text(
          "レシピ登録",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
