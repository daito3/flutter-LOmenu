import 'package:flutter/material.dart';

class Fishform extends StatefulWidget {
  const Fishform({Key? key}) : super(key: key);

  @override
  State<Fishform> createState() => _FishformState();
}

class _FishformState extends State<Fishform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/a.png'),
      ),
    );

  }
}
