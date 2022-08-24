import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project1/products.dart';


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
final product=ChangeNotifierProvider<items>((ref)=>items());
class items extends ChangeNotifier{
  List<Products>listProducts=[];
  get item{
    getData();
  }
  Future getData()async{
    listProducts=[];
    http.Response response= await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(response.body);
    for(int i=0;i < response.body.length; i++){

      listProducts.add(Products.fromMap(item));
    }
    print(listProducts.length);
    notifyListeners();
  }
}

class ThirdView extends ConsumerWidget {
  const ThirdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data =ref.watch(product);
    return Scaffold(
      appBar: AppBar(title: Text('Fetch Data'),),
      body: data.listProducts.isEmpty?
          Center(
            child: CircularProgressIndicator(),)
          : ListView.builder(
          itemCount: data.listProducts.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text(data.listProducts[index].title,
                style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(data.listProducts[index].toString(),
                  style: TextStyle(fontSize: 16),
                ),
                leading: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(data.listProducts[index].id.toString(),
                  ),
                ),
              ),
            );
      }),

        );

  }
}