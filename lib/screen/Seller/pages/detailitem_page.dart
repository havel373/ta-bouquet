import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailItemPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
           child: Image.asset('assets/images/2.png'),
          ),
          SizedBox(height: 17),
          Text("Nama Produk"),
          SizedBox(height: 10),
          Text("Harga disini"),
          SizedBox(height: 5),
          Text("Rating disini"),
          SizedBox(height: 17),
          Text("Deskripsi disini"),
          Container(
            child: Row(
              children: [
                ElevatedButton(onPressed: (){}, child: Text("Edit")),
                ElevatedButton(onPressed: (){}, child: Text("Hapus")),
              ],

            ),
          ),
        ],
      ),

    );
  }
}