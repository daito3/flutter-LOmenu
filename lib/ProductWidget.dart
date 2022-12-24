import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lomenu/Model/ProductListModel.dart';

import 'package:provider/provider.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ChangeNotifierProvider(
          create: (_) => ProductListModel()..getProducts(),
          child: Consumer<ProductListModel>(builder: (context, model, child) {
            final products = model.products;
            return Container(
              child: Column(children: <Widget>[
                Text(products[0].productName),
                Text(products[0].productPrice),
                Text(products[0].productId),
                Text(products[1].productName),
                Text(products[1].productPrice),
                Text(products[1].productId),
              ]),
            );
          })),
    );
  }
}
