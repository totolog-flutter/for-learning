import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(this.product);
  // final String id;
  // final String title;
  // final String imageUrl;
  // const ProductItem(
  //   this.id,
  //   this.title,
  //   this.imageUrl,
  // );

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
        title: Text(
          product.title,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ),
    );
  }
}
