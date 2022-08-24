/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project1/user_model.dart';

final allUsers = FutureProvider.autoDispose<List<UserModel>>((ref) async {
  http.Response response = await http
      .get(Uri.parse('http://api.fakeshop-api.com/users/getAllUsers'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return json.map((data) => UserModel.fromMap(data)).toList();
  } else {
    throw 'Something went wrong!';
  }
});
// final allUsersParser = Provider.autoDispose<AsyncValue<List<UserModel>>>((ref) {
//   final usersState = ref.watch(allUsers);
//   usersState.whenData((value) => value.)
//   return ;
// });

// Future<String>getAllUsers()async{
//    http.Response response =await http.get(Uri.parse('http://api.fakeshop-api.com/users/getAllUsers'));
//
//    return jsonDecode(response.body);
// }
class SecondView extends ConsumerWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(allUsers);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: data.when(
            data: (users) => ListView.builder(itemCount: users.length,itemBuilder: (context, index) {
              return Text(users[index].name);
            },),
            loading: () => CircularProgressIndicator(),
            error: (error, stack) => Text(error.toString()),
          ),
        ),
      ),
    );
  }
}
*/