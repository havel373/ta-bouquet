import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class CarruselLoanding extends StatelessWidget {
  const CarruselLoanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.shade200,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(
                  width: 3,
                ),
      
                Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(
                  width: 3,
                ),
      
                Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(
                  width: 3,
                ),
      
                Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(
                  width: 3,
                ),
      
                Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(
                  width: 3,
                ),
      
      
              ],
            ),
          ],
        ),
      ),
    );
  }
}
