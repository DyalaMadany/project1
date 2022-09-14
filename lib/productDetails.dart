import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project1/product.dart';
import 'package:project1/products_view.dart';

class ProductDetails extends ConsumerWidget {
  const ProductDetails({
    Key? key,
  }) : super(key: key);

  // final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(detailsProduct);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.image),
            const SizedBox(height: 16),
            Text(product.title,
                style: const TextStyle(fontSize: 20, color: Colors.black)),
            const SizedBox(height: 16),
            const Text('product.description'),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Price: ' + product.price.toString() + '\$',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(product.category),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
