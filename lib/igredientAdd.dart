import 'package:flutter/material.dart';
import 'igredientItem.dart';

class IgredientAdd extends StatefulWidget {
  @override
  _IgredientAddState createState() => _IgredientAddState();
}

class _IgredientAddState extends State<IgredientAdd> {
  List<Item> items = [];

  @override
  void dispose() {
    items.forEach((element) {
      element.dispose();
    });

    super.dispose();
  }

  void add() {
    setState(() {
      items.add(Item.create(""));
    });
  }

  void remove(int id) {
    final removedItem = items.firstWhere((element) => element.id == id);
    setState(() {
      items.removeWhere((element) => element.id == id);
    });

    // itemのcontrollerをすぐdisposeすると怒られるので
    // 少し時間をおいてからdipose()
    Future.delayed(Duration(seconds: 1)).then((value) {
      removedItem.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Container(
          child: ListView(
            children: [
              Text('材料'),
              Text(items.toString()),
              ...items.map((item) => textFieldItem(item)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  add();
                },
                child: Text("テキスト 追加"),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {

                  },
                  child: Text("食材 追加")
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldItem(
    Item item,
  ) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: item.controller,
            onChanged: (text) {
              setState(() {
                items = items
                    .map((e) => e.id == item.id ? item.change(text) : e)
                    .toList();
              });
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            remove(item.id);
          },
        )
      ],
    );
  }
}
