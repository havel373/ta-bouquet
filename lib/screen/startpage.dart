import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'chooseuser.dart';

class startpage extends StatelessWidget {
  const startpage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BOUQUET',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/images/background.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(

                    child: Builder(
                        builder: (context) {
                          return ElevatedButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 45.0),
                                  alignment: AlignmentDirectional.bottomEnd,

                                  backgroundColor: const Color(0xff232323)),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            chooseuser()
                                    )
                                );
                              },
                              child: const Text(
                                "Mulai",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xffffffff),
                                ),
                              )
                          );
                        }
                    )
                )
            )
        )
    );
  }
}

