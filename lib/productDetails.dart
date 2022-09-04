import 'package:flutter/material.dart';
import 'package:project1/products.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as ProductDetails;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product.image),
                const SizedBox(height: 16),
                Text(product.title, style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor)),
                const SizedBox(height: 16),
                Text(product.description),
                const SizedBox(height: 16),
                Align(alignment: Alignment.centerRight,child: Text('Price: '+product.price.toString() + '\$', style: TextStyle(fontSize: 20, color:Colors.grey.shade700,fontWeight: FontWeight.bold))),
                Text(product.category),
                const SizedBox(height: 16,)

                



              ],
            ),
          ),
        ),
      ),
    );
  }
}