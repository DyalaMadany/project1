import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project1/products.dart';


final Product= FutureProvider.autoDispose<List<Products>>((ref) async {
http.Response response = await http
    .get(Uri.parse('https://fakestoreapi.com/products'));
if (response.statusCode == 200) {
final json = jsonDecode(response.body);
return json.map((data) => Products.fromMap(data)).toList();
} else {
  throw 'Something went wrong!';
}
});









class ThirdView extends ConsumerWidget {
  const ThirdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(Product);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: data.when(
            data: (products) => ListView.builder(itemCount: products.length,itemBuilder: (context, index) {
              return Text(products[index].name);
            },),
            loading: () => CircularProgressIndicator(),
            error: (error, stack) => Text(error.toString()),
          ),
        ),
      ),
    );
  }
}