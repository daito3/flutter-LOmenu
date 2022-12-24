import 'package:flutter/material.dart';

class TipPage extends StatefulWidget {
  const TipPage({Key? key}) : super(key: key);

  @override
  State<TipPage> createState() => _TipPageState();
}

class _TipPageState extends State<TipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ヒント'),
          backgroundColor: const Color(0xFFff8e3c),
        ),
        body: Container());
  }
}
