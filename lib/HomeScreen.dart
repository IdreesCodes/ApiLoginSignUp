import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var tok;
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =   TextEditingController();
  void login (String email, password) async {

    try{
      Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body: {
          'email': email,
          'password' : password,
        }
      );
      if(response.statusCode ==200)
      
        {
          var data = jsonDecode(response.body.toString());
        print(data['token']);
          tok = data['token'.toString()];
        }
      else {
        print('Failed');
      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextFormField(
              controller: emailController,

        decoration: const InputDecoration(

          hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,

              decoration: const InputDecoration(

                hintText: 'Password',
              ),

            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: (){
                login(emailController.text.toString(), passwordController.text.toString());
                if(tok== 'QpwL5tke4Pnpja7X4')
                  {
                    Navigator.push
                      (context, MaterialPageRoute(builder: (context) =>Dashboard())
                    );
                  }
                else {
                  initState(){
                    Text('ooo');
                  }
                }


              },
              child: Container(
                height: 50,
                decoration:  BoxDecoration(
                   color: Colors.green,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text('Sign up ')),
              ),
            )
            ,
          ],
        ),
      ),

    );
  }
}
