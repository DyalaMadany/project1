import 'package:flutter/material.dart';
import 'package:project1/products.dart';

class ProductDetails extends StatelessWidget{
  const ProductDetails({Key? key, required this.product}) : super(key: key);
final Product product;
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as ProductDetails;

    return Scaffold(
      appBar: AppBar(title: Text('Product Details'),));

  }}
