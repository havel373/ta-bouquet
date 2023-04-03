import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  var products_list = [
    {
      "name": "Mawar Merah",
      "image": "assets/images/1.png",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
      "price": 120000
    },
    {
      "name": "Mawar Putih",
      "image": "assets/images/2.png",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "price": 90
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2.5,
      ),
      itemCount: products_list.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext ctx, index) {
        return Column(
          children: [
            Container(
              height: 110,
              margin: EdgeInsets.symmetric(
                  horizontal: 15), // before it was this -> , vertical: 10
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    child: Radio(
                      value: "",
                      groupValue: '',
                      activeColor: Color.fromARGB(255, 0, 0, 0),
                      onChanged: (index) {},
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 55,
                    margin: EdgeInsets.only(right: 15),
                    child: Image.asset("${products_list[index]['image']}"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.blue,
                          width: 80,
                          height: 20,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "${products_list[index]['name']}",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Rp.120000",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
