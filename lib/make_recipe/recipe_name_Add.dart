import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lomenu/make_recipe/ingredient_Add_Test.dart';
import 'package:path_provider/path_provider.dart';

import 'ingredient_Add_Test.dart';

class RecipeName extends StatefulWidget {
  const RecipeName({Key? key}) : super(key: key);

  @override
  State<RecipeName> createState() => _RecipeNameState();
}

class _RecipeNameState extends State<RecipeName> {
  String recipeName = "";
  String selectedCuisine = "主菜";
  List recipeList = [];
  final lists = <String>["主菜", "副菜", "汁物", "ご飯物", "デザート"];

  // File? _imageFile;
  Image? _img;
  String _imgPath = "";
  Text? _text;
  late String downloadUrl = "";

  void _upload() async {
    // imagePickerで画像を選択する
    try {
      XFile? pickerFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      // _imageFile = File(pickerFile!.path);
      File file = File(pickerFile!.path);

      RegExp exp = RegExp('/((?:.(?!/))+\$)');
      String imageId = exp.firstMatch(file.path)?[1] as String;
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child("image/food/$imageId")
          .putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => setState(() {
            _text = const Text("UploadDone");
          }));
      _imgPath = imageId;
      print(_imgPath);

      setState(() {
        downloadUrl = taskSnapshot.ref.getDownloadURL() as String;
        print(downloadUrl);
      });



    } catch (e) {
      print("----------");
      print(e);
      print("----------");
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFff8e3c),
        title: Text('レシピを作成'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              // レシピの写真
              Text(
                '料理の写真',
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              Stack(
                children: [
                  Container(
                    width: screenSize.width * 1,
                    height: screenSize.height * 0.25,
                    child: downloadUrl != ""
                        ? Image.network(downloadUrl)
                        : Container(
                      color: Colors.grey[400],
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, //色
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenSize.width * 1,
                    height: screenSize.height * 0.25,
                    child: ElevatedButton(
                      // onPressed: (){},
                      onPressed: _upload, //変更点
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey.withOpacity(0.1)),
                      child: Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              // レシピの名前
              Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                // color: Colors.orange,
                child: Column(
                  children: [
                    Text(
                      '料理名',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: '例：ピーマンの肉詰',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onChanged: (String value) {
                        setState(() {
                          recipeName = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Container(
                      width: screenSize.width * 1,
                      child: Row(
                        children: [
                          Text(
                            'カテゴリー',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(
                            width: screenSize.width * 0.1,
                          ),
                          DropdownButton<String>(
                            value: selectedCuisine,
                            items: lists.map((item) {
                              return DropdownMenuItem(
                                  value: item,
                                  child: new Text(
                                    item,
                                    style: TextStyle(fontSize: 24),
                                  ));
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedCuisine = value!;
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFff8e3c),
        onPressed: () async {
          print(selectedCuisine);
          print(recipeName);
          print(_imgPath);

          if (recipeName != "") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Ingredient(
                          selectedCuisine: selectedCuisine,
                          recipeName: recipeName,
                          imgPath: _imgPath,
                        )));
          }
        },
        child: Text(
          '記録',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
