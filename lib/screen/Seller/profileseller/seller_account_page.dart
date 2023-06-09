import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ta/screen/Seller/pages/pemesanan_page.dart';
import 'package:ta/screen/profiles/page/editprofilePage.dart';
import 'package:ta/themes/color.dart';

import '../pages/addproduct_page.dart';
import '../pages/changepassword_page.dart';
import '../pages/editprofilePage_seller.dart';

class SelleraccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xFFCCD2E3);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 73),
              child: const Text(
                "Akun",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Oxygen',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 19),
            Container(
              padding: EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  Container(
                    width: 59,
                    height: 59,
                    child: Image.asset('assets/images/photo_profile.png',
                        fit: BoxFit.contain),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("Desi",
                            style: TextStyle(color: Colors.black),),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>EditProfilePageSeller()),
                              );
                            },
                            child: Text("Edit Profile"),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Divider(
              color: Colors.black,
              height: 32.0,
              thickness: 1.0,
              indent: 16.0,
              endIndent: 16.0,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 22),
                    child: Row(
                      children: [
                        Container(
                          width: 22,
                          height: 24,
                          child: Image.asset('assets/images/icon_pesanan.png',
                            fit: BoxFit.contain,),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 13),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>PemesananApp()),
                              );
                            },
                            child: const Text("Status Pesanan",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Oxygen',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 45),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: const Text("Dikirim",
                                  style: TextStyle(
                                      fontFamily: 'Oxygen',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 36,
                                height: 34,
                                child: Image.asset('assets/images/icon_dikirim.png'),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: const Text("Diterima",
                                  style: TextStyle(
                                      fontFamily: 'Oxygen',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 36,
                                height: 34,
                                child: Image.asset('assets/images/icon_diterima.png'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 32.0,
              thickness: 1.0,
              indent: 16.0,
              endIndent: 16.0,
            ),
            SizedBox(height: 33),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 257,
                    height: 41,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>AddProductPage()),
                        );
                      },
                      child: Text("Tambah Produk",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(
                            255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  SizedBox(height: 17),
                  Container(
                    width: 257,
                    height: 41,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>ChangePasswordPage()),
                        );
                      },
                      child: Text("Ubah Sandi",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(
                            255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  SizedBox(height: 17),
                  Container(
                    width: 257,
                    height: 41,
                    child: ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text("Keluar",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(
                            255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
