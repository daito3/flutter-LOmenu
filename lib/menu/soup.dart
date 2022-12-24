import 'package:flutter/material.dart';

class SoupPage extends StatefulWidget {
  const SoupPage({Key? key}) : super(key: key);

  @override
  State<SoupPage> createState() => _SoupPageState();
}

class _SoupPageState extends State<SoupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('汁物')),
      ),
    );
  }
}
