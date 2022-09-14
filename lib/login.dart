 import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project1/rich_text_widget.dart';
import 'package:project1/user_model.dart';

import 'api_client.dart';
import 'categories_grid_view.dart';


 final LoginFormState =
 Provider.autoDispose<UserModel>((ref) => UserModel(username: 'required this.username', password: 'required this.password'));

 final formKey = GlobalKey<FormState>();

 class Login extends ConsumerWidget {
   final String username;
   final void Function() onPressed;

   const Login({
     Key? key,
     required this.username,
     required this.onPressed,
   }) : super(key: key);

  get color => null;



 @override
 Widget build(BuildContext context, WidgetRef ref) {
   final state = ref.watch(LoginFormState);
   return Form(
     key: formKey,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         SizedBox(
           height: 30,
         ),
         Text(
           username,
           style: TextStyle(
             fontSize: 30,
           ),
         ),
         SizedBox(
           height: 30,
         ),
         TextFormField(
           onSaved: (newValue) {
             ref.read(LoginFormState);
           },
           validator: (value) {
             if (value!.isEmpty) {
               return 'Please enter your name';
             }
             return null;
           },
           decoration: InputDecoration(
             contentPadding: EdgeInsets.only(left: 10),
             border: const OutlineInputBorder(
               borderSide: BorderSide(
                 color: Colors.black,
               ),
             ),
             focusedBorder: const OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.black,
                 )),
             hintText: 'UserName',
           ),
         ),
         SizedBox(
           height: 30,
         ),

         Padding(
           padding: EdgeInsets.only(bottom: 15),
           child: TextFormField(

             keyboardType: TextInputType.text,
             onSaved: (newValue) {
               ref
                   .read(LoginFormState);
             },
             decoration: InputDecoration(
               prefixIcon: const Icon(Icons.password_outlined),
               label: const Text(
                 'Password',
                 style: TextStyle(
                   fontSize: 18,
                 ),
               ),
               contentPadding: EdgeInsets.only(left: 10),
               border: const OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.black,
                 ),
               ),
               focusedBorder: const OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.black,
                 ),
               ),
               hintText: 'Password',
             ),
             obscureText: true,
             validator: (value) {
               if (value!.isEmpty) {
                 return 'Please enter password';
               }
               return null;
             },
           ),
         ),

         //
         SizedBox(
           height: 180,
         ),
         ElevatedButton(
           style: ElevatedButton.styleFrom(
             primary: Colors.blue,
             onSurface: Colors.blueGrey,
           ),
           onPressed: null,
           child: Center(
             child: Text('Login'),
           ),
         ),

         SizedBox(
           height: 15,
         ),
         Center(
           child: RichTextWidget(
             textA: 'Already have an account?',
             textB: 'Sign In',
           ),
         ),
     ],
      ),
   );

 }
 }


