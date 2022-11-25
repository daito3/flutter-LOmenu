import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lomenu/make_recipe/recipe_review.dart';

class MakingAdd extends StatefulWidget {
  final List ingredientList;
  final List quantityList;

  final recipeName;
  final selectedCuisine;
  final imgPath;

  const MakingAdd({
    Key? key,
    required this.ingredientList,
    required this.quantityList,
    required this.recipeName,
    required this.selectedCuisine,
    required this.imgPath,
  }) : super(key: key);

  @override
  State<MakingAdd> createState() => _MakingAddState();
}

class _MakingAddState extends State<MakingAdd> {
  // late List<String> state;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   state = widget.ingredientList;
  // }

  String _making = "";
  String _log = "";

  List makingList = [];

  var _controller = TextEditingController();

  String? get ingredientList => null;

  String? get quantityList => null;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFff8e3c),
        title: Text('レシピの作り方 記入'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: '手順を記入してください',
                          suffixIcon: IconButton(
                            onPressed: () => _controller.clear(), //リセット処理
                            icon: Icon(Icons.clear),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _making = value;
                          });
                        },
                      ),
                      Container(
                        width: screenSize.width * 1,
                        height: screenSize.height * 0.05,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                makingList.add(_making);
                                print(makingList);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFff8e3c)),
                            child: Text('追加')),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: makingList.length,
                          itemBuilder: (BuildContext context, int index) {
                            int kazu = index + 1;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '手順' + kazu.toString(),
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 3, 10, 3),
                                  child: Text(
                                    makingList[index],
                                  ),
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.02,
                                ),
                              ],
                            );
                          }),
                      Container(
                        width: screenSize.width * 1,
                        height: screenSize.height * 0.05,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              makingList.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFff8e3c)),
                          child: Text('リセット'),
                        ),
                      ),
                      // Text(widget.ingredientList)
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
        child: Text(
          '記録',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: () {
          print(widget.recipeName);
          print(widget.selectedCuisine);
          print(widget.ingredientList);
          print(widget.quantityList);
          if (makingList.length != 0) {
            print(makingList);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeReview(
                        recipeName: widget.recipeName,
                        selectedCuisine: widget.selectedCuisine,
                        imgPath: widget.imgPath,
                        ingredientList: widget.ingredientList,
                        quantityList: widget.quantityList,
                        makingList: List.of(makingList),
                    )));
          } else {
            _log = ("手順がありません");
          }
          ;
        },
      ),
    );
  }
}
