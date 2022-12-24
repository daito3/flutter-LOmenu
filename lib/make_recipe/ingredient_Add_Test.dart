import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lomenu/make_recipe/making_Add.dart';

class Ingredient extends StatefulWidget {
  final String recipeName;
  final String selectedCuisine;
  final String imgPath;

  Ingredient({
    Key? key,
    required this.recipeName,
    required this.selectedCuisine,
    required this.imgPath,
  }) : super(key: key);

  @override
  State<Ingredient> createState() => _IngredientState();
}

class _IngredientState extends State<Ingredient> {
  String ingredient = "";
  String quantity = "";
  String _log = "";

  // var foodMap = Map();

  List ingredientList = [];
  List quantityList = [];

  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFff8e3c),
        title: Text('レシピの食材 記入'),
      ),
      body: Container(
        width: screenSize.width * 1,
        height: screenSize.height * 1,
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.black),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _controller1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '食材を記入',
                              suffixIcon: IconButton(
                                onPressed: () => _controller1.clear(), //リセット処理
                                icon: Icon(Icons.clear),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                ingredient = value;
                              });
                            },
                          ),
                          SizedBox(height: screenSize.height * 0.015,),
                          TextFormField(
                            controller: _controller2,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '食材の量を記入',
                              suffixIcon: IconButton(
                                onPressed: () => _controller2.clear(), //リセット処理
                                icon: Icon(Icons.clear),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                quantity = value;
                              });
                            },
                          ),
                          SizedBox(height: screenSize.height * 0.015,),
                        ],
                      ),
                    ),
                    Container(
                      width: screenSize.width * 1,
                      height: screenSize.height * 0.05,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              ingredientList.add(ingredient);
                              quantityList.add(quantity);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFff8e3c)),
                          child: Text(
                            "追加",
                          )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(90),
                            bottomRight: Radius.circular(90)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        children: [
                          Container(
                            height: 42,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      '食材',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      '量',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          LimitedBox(
                            maxHeight: 260,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: ingredientList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            ingredientList[index],
                                            textAlign: TextAlign.center,
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            quantityList[index],
                                            textAlign: TextAlign.center,
                                          )),
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: screenSize.width * 1,
                      height: screenSize.height * 0.05,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ingredientList.clear();
                            quantityList.clear();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFff8e3c)),
                        child: Text('リセット'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(_log),
            ],
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
          setState(() {
            if (ingredientList.length != 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MakingAdd(
                            selectedCuisine: widget.selectedCuisine,
                            recipeName: widget.recipeName,
                            imgPath: widget.imgPath,
                            ingredientList: List.of(ingredientList),
                            quantityList: List.of(quantityList),
                          )));
            } else
              (_log = ("食材がありません"));
          });

          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //   return MakingAdd();
          // }));
        },
      ),
    );
  }
}
