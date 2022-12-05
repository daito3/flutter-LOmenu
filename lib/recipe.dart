import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
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
  String? imgPath = "";

  bool isLoading = false;

  Future<void> _dateload() async {
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
            imgPath = snapshot.get('recipeImagePath');
          });
        });
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
                        // child: Image.asset("assets/"+imgPath!),
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
