import 'dart:math';

import 'package:flutter/material.dart';

class Item {
  final int id;
  final TextEditingController controller;
  final String text;

  Item({
    required this.id,
    required this.text,
    required this.controller,
  });

  factory Item.create(String text) {
    return Item(
      id: Random().nextInt(99999),
      text: text,
      controller: TextEditingController(text: text),
    );
  }

  Item change(String text) {
    return Item(id: this.id, text: text, controller: this.controller);
  }

  void dispose() {
    controller.dispose();
  }

  @override
  String toString() {
    return text;
  }
}