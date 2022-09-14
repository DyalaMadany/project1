import 'package:flutter/material.dart';
import 'package:project1/categories_grid_view.dart';
import 'package:project1/login.dart';
import 'package:project1/productDetails.dart';
import 'package:project1/products_view.dart';



const initialRoute = '/login';

Map<String, Widget Function(BuildContext)> routes =  {
  '/login' : (context) =>  Login(username: '', onPressed: () {  },),
  '/categories_grid_view' : (context) => const CategoriesGridView(),
  '/product_list_view' : (context) => const ProductListView(),
  '/product_details' : (context) =>  const ProductDetails(),
};

