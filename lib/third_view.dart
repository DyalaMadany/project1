import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project1/categoryDetails.dart';
import 'package:project1/productDetails.dart';
import 'package:project1/products.dart';

import 'package:project1/category.dart';



/*final Product= FutureProvider.autoDispose<List<Products>>((ref) async {
http.Response response = await http
    .get(Uri.parse('https://fakestoreapi.com/products'));
if (response.statusCode == 200) {
final json = jsonDecode(response.body);
return json.map((data) => Products.fromMap(data)).toList();
} else {
  throw 'Something went wrong!';
}
});*/
final productsProvider = ChangeNotifierProvider<ProductsListChangeNotifier>((ref) => ProductsListChangeNotifier());

class ProductsListChangeNotifier extends ChangeNotifier {
  List<Product> products = [];

  ProductsListChangeNotifier() {
    getData();
  }

  Future getData() async {
    products = [];
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    final data = jsonDecode(response.body);
    products =
        data!.map<Product>((product) => Product.fromMap(product)).toList();
    notifyListeners();
  }
}

/*class ProductListView extends ConsumerWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data'),
      ),
      body: data.products.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.products.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      data.products[index].title,
                      style: const TextStyle(fontSize: 18),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data.products[index].price.toString() + '\$',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    leading: Image.network(
                      data.products[index].image,
                      height: 50,
                      width: 50,
                    ),
                  onTap: ()=>_openProductDetails(
                      context,
                      data.products[index]
                    )));
                    }));
                  }

              }*/

class ProductGridView extends ConsumerWidget {
  const ProductGridView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productsProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child : GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10,crossAxisSpacing: 10),

        children: [
          Container(
            child: Text("electronics"),
            height:200,
            color: Colors.red,
            alignment: Alignment.center,

          ),
          Container(
            child: Text("jewelery"),
            height:200,
            color: Colors.yellow,
            alignment: Alignment.center,
          ),
          Container(
            child: Text("men's clothing"),
            height:200,
            color: Colors.blueAccent,
            alignment: Alignment.center,
          ),
          Container(
            child: Text("women's clothing"),
            height:200,
            color: Colors.purpleAccent,
            alignment: Alignment.center,
          ),

        ],)


    ));

}

void _openProductDetails(BuildContext context,Product product){
  Navigator.push(context,
      MaterialPageRoute (builder: (context)=> ProductDetails(product: product )));

  void _openCategoryDetails(BuildContext context,Category category){
    Navigator.push(context,
        MaterialPageRoute (builder: (context)=> CategoryDetails(category: category)));

  }}

}
