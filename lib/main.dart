import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart'as http;
//import 'package:project1/second_view.dart';
import 'package:project1/third_view.dart';
final myProvider = Provider<String>((ref) {
  return 'name';
});

final ageProvider = StateProvider<int>((ref) {
  return 0;

});
final stringProvider = Provider<String>((ref) {
  return 'Hello World!' ;
});
final mystringProvider = Provider((ref)=>'Hello World!');
final counterProvider = StateProvider((ref)=>0);
final countProvider = Provider<int>((ref) {
  return 0 ;
});



void main() {
  runApp(
    ProviderScope(child:const MyApp()),);
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hi Dyala',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ProductGridView(),
    );
  }
}
