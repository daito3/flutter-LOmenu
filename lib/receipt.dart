import 'package:flutter/material.dart';

class Receipt extends StatefulWidget {
  const Receipt({Key? key}) : super(key: key);

  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(child: Text("未実装", style: TextStyle(fontSize: 48),),),

    );
  }
}
