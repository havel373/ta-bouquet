import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../components/ItemsWidgets.dart';
import 'bungaasli_page.dart';
import 'bungapalsu_page.dart';
import 'package:http/http.dart' as http;

class StorePage extends StatefulWidget {
  final int token;
  const StorePage({Key? key, required this.token}) : super(key: key);
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> with TickerProviderStateMixin {
  TabController? _tabController;

  List<Color> Clrs = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.indigo,
    Colors.orange
  ];
  List produk = [];
  List toko = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.getdata();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  Future<List<dynamic>> getdata() async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await http
          .get(Uri.parse('http://bouquet.pnseirampah-semodal.com/api/produk'));
      print('produk response detail produk : ' + response.body.toString());
      if (response.statusCode == 200) {
        var item = json.decode(response.body)['data'];
        print('toko cek : ' + item.toString());
        setState(() {
          produk = item;
          isLoading = false;
        });
      } else {
        produk = [];
        isLoading = false;
      }
    } catch (e) {
      print(e.toString());
    }
    return produk;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200.0),
            child: AppBar(
              title: null,
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/2.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 130,
                    child: Container(
                      height: 50,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Cari di sini...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 60,
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/images/store_logo.jpg'),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //call data from getData()
                              '${produk[0]['nama_toko']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 20),
                                SizedBox(width: 5),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottom: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Produk'),
                  Tab(text: 'Kategori Produk'),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                child: ItemsWidget(token: widget.token),
              ),
              Column(
                children: [
                  ListTile(
                    title: Text('Bunga Asli'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AsliPage(token: widget.token)),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Bunga Palsu'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PalsuPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
