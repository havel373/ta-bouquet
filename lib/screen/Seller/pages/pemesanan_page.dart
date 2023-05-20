import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PemesananApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PemesananPage(title: 'Halaman Status Pemesanan'),
    );
  }
}

class PemesananPage extends StatefulWidget {
  PemesananPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PemesananPageState createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Dikirim'),
              Tab(text: 'Selesai'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PesananTab('Diproses'),
            PesananTab('Selesai'),
          ],
        ),
      ),
    );
  }
}

class PesananTab extends StatefulWidget {
  final String status;

  PesananTab(this.status);

  @override
  _PesananTabState createState() => _PesananTabState();
}

class _PesananTabState extends State<PesananTab> {
  List<Pesanan> pesananList = [];

  @override
  void initState() {
    super.initState();

    pesananList = List.generate(3, (index) {
      return Pesanan(
        'Item ${index + 1}',
        10000 * (index + 1),
        'Alamat Pengiriman ${index + 1}',
        DateTime.now(),
        widget.status,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pesananList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(pesananList[index].nama),
            subtitle: Text(
              'Harga: ${pesananList[index].harga}\n'
                  'Alamat: ${pesananList[index].alamat}\n'
                  'Jam: ${pesananList[index].jam.toString()}\n'
                  'Status: ${pesananList[index].status}',
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  pesananList.removeAt(index);
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class Pesanan {
  Pesanan(this.nama, this.harga, this.alamat, this.jam, this.status);

  String nama;
  int harga;
  String alamat;
  DateTime jam;
  String status;
}