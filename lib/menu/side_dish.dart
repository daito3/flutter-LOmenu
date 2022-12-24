import 'package:flutter/material.dart';

class SideDishPage extends StatefulWidget {
  const SideDishPage({Key? key}) : super(key: key);

  @override
  State<SideDishPage> createState() => _SideDishPageState();
}

class _SideDishPageState extends State<SideDishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('主菜')),
      ),
    );
  }
}
