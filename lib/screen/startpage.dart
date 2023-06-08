import 'package:flutter/material.dart';
import 'package:ta/core/session/session_manager.dart';
import 'package:ta/screen/sign_in.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Adding session manager
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        SessionManager.initialize(context);
      }
    });
  }

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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Builder(builder: (context) {
              return ElevatedButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 45.0),
                      alignment: AlignmentDirectional.bottomEnd,
                      backgroundColor: const Color(0xff314437)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginpage()));
                  },
                  child: const Text(
                    "Mulai",
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xffffffff),
                    ),
                  ));
            }),
          ),
        ),
      ),
    );
  }
}
