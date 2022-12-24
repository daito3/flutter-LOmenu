import 'package:flutter/material.dart';

class MainDishPage extends StatefulWidget {
  const MainDishPage({Key? key}) : super(key: key);

  @override
  State<MainDishPage> createState() => _MainDishPageState();
}

class _MainDishPageState extends State<MainDishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('主菜')),
      ),
    );
  }
}
