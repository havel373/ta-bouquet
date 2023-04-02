import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:card_swiper/card_swiper.dart';

class Carrusel extends StatelessWidget {
  Carrusel({super.key});

  List<String> images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
      width: double.infinity,
      height: 220,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Swiper(
        pagination: SwiperPagination(
          builder: new DotSwiperPaginationBuilder(
            color: Colors.grey[400],
            activeColor: Color.fromARGB(255, 235, 122, 56),
          ),
        ),
        control: new SwiperControl(
          color: Color.fromARGB(255, 235, 122, 56),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            // color: Colors.white, // I can not add to colos I just can add one color, that is, inside our ouside of the "decoration"
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              images[index],
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: images.length,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}
