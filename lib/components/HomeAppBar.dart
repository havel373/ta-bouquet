
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> data;
  const HomeAppBar({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15), // before it as 25
      child: Row(children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Text(
            'DEL BOUQUET APP',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
            ),
          ),
        ),
        const Spacer(),
      ]),
    );
  }
}
