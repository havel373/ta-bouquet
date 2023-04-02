import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({super.key});

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  var products_list = [
    {
      "name": "Mawar Merah",
      "image": "assets/images/1.png",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
      "price": 200000
    },
    {
      "name": "Mawar Putih",
      "image": "assets/images/2.png",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "price": 200000
    },
    {
      "name": "Mawar",
      "image": "assets/images/3.png",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "price": 200000
    },
    {
      "name": "Coklat Dairy",
      "image": "assets/images/4.png",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "price": 200000
    },
    {
      "name": "Coklat Silverqueen",
      "image": "assets/images/5.png",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "price": 200000
    },
    {
      "name": "Lolipop 1",
      "image": "assets/images/6.png",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "price": 200000
    },
    {
      "name": "Lolipop 2",
      "image": "assets/images/7.png",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "price": 200000
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.60,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products_list.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // this was before
          margin: const EdgeInsets.fromLTRB(10,0,10,16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.all(5),
              //       decoration: BoxDecoration(
              //         color: Color.fromARGB(255, 235, 122, 56), //0xFF4C53A2
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: Text(
              //         '-50%',
              //         style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //     Icon(
              //       Icons.favorite_border,
              //       color: Colors.red,
              //     ),
              //   ],
              // ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'itemPage');
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "${products_list[index]['image']}",
                    height: 90,
                    width: 90,
                  ),
                ),
              ),
              Container(
                height: 30,
                padding: EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Text(
                    "${products_list[index]['name']}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 50,
                child: SingleChildScrollView(
                  child: Text(
                    "${products_list[index]['description']}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${products_list[index]['price']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart_checkout,
                      color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
