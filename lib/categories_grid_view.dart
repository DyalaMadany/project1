import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project1/products_view.dart';

final categoriesListProvider =
    FutureProvider.autoDispose<List<String>>((ref) async {
  http.Response response =
      await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
  final data = jsonDecode(response.body);
  final categories =
      data.map<String>((category) => category.toString()).toList();
  return categories;
});

class CategoriesGridView extends ConsumerWidget {
  const CategoriesGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Center(
        child: Container(
          child: ref.watch(categoriesListProvider).when(
                data: (categories) => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProviderScope(
                              overrides: [
                                selectedCategoryProvider.overrideWithValue(
                                  categories[index],
                                ),
                              ],
                              child: const ProductListView(),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(categories[index]),
                          height: 200,
                          color: Colors.yellow,
                          alignment: Alignment.center,
                        ),
                      ),
                    );
                  },
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text(error.toString()),
              ),
        ),
      ),
    );
  }
}

final selectedCategoryProvider =
    Provider.autoDispose<String>((ref) => ref.state);
