import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project1/category.dart';


class CategoryDetails extends StatelessWidget {
  const CategoryDetails({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget _buildCategoryList(List<Category> categories) {
    return Container(
        height: 120,
        alignment: Alignment.centerLeft,
        child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    itemCount: categories.length,
    itemBuilder: (context, index) {
    var data = categories[index];
    return SizedBox(
    width: 100,
    child: Padding(
    padding: const EdgeInsets.only(left: 10),
    child: InkWell(
    onTap: () {
      _openCategoryDetails(BuildContext context,Category category){
      Navigator.push(context,
      MaterialPageRoute (builder: (context)=> CategoryDetails(category: category)));}

    }
    )));
    }));


}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
void _openCategoryDetails(BuildContext context,Category category){
  Navigator.push(context,
      MaterialPageRoute (builder: (context)=> CategoryDetails(category: category)));

}
