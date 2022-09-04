import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project1/categories_grid_view.dart';
import 'package:project1/productDetails.dart';
import 'package:project1/product.dart';

final productsListProvider =
    FutureProvider.autoDispose.family<List<Product>,String>((ref,cat) async {
  http.Response response =
      await http.get(Uri.parse('https://fakestoreapi.com/products/category/$cat'));
  final data = jsonDecode(response.body);
  return data!.map<Product>((product) => Product.fromMap(product)).toList();
});

class ProductListView extends ConsumerWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String cat = ref.watch(selectedCategoryProvider);
    final state = ref.watch(productsListProvider(cat));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data'),
        ),
        body: state.when(
          data: (products) => ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                        title: Text(
                          products[index].title,
                          style: const TextStyle(fontSize: 18),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            products[index].price.toString() + '\$',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        leading: Image.network(
                          products[index].image,
                          height: 50,
                          width: 50,
                        ),
                        onTap: () =>
                            _openProductDetails(context, products[index])));
              }),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Text(error.toString()),
        ));
  }

  void _openProductDetails(BuildContext context, Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetails(product: product)));
  }
}
