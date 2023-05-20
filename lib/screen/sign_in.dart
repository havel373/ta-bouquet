import 'dart:convert';
import 'package:ta/components/MainNavigation.dart';
import 'package:ta/screen/HomePage.dart';
import 'package:ta/screen/sign_up.dart';
import 'package:ta/screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ta/themes/color.dart';

import 'Seller/components/sellerNavigation.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<loginpage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    try {
      Response response = await post(
          Uri.parse('http://bouquet.pnseirampah-semodal.com/api/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['authorization']['access_token']);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Login Successfully'),
                content: Text('Welcome ${data['user']['name']}'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SellerNavigation(
                                  token: data['user']['id'],
                                )),
                      );
                    },
                  ),
                ],
              );
            });
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void register(String name, email, password) async {
    try {
      Response response = await post(
          Uri.parse('http://bouquet.pnseirampah-semodal.com/api/register'),
          body: {
            'name': name,
            'email': email,
            'password': password,
            'role_id': '2'
          });
      print(name);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['authorization']['access_token']);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Register Successfully'),
                content: Text('Welcome ${data['user']['name']}'),
              );
            });
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height - 70,
            alignment: Alignment.center,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 5),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                hintText: "Email",
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 5),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: "Password",
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    //make text and can be clicked to redirect sign up page
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        'Belum punya akun? Daftar disini',
                        style: TextStyle(
                            color: Color.fromARGB(255, 77, 0, 227),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      login(emailController.text.toString(),
                          passwordController.text.toString());
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text('Login',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
