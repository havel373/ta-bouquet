import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifikasiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: NotifikasiPage(title: 'Notifikasi'),
    );
  }
}

class NotifikasiPage extends StatefulWidget {
  NotifikasiPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  List<Notifikasi> notifikasiList = [
    Notifikasi('Notifikasi 1', false),
    Notifikasi('Notifikasi 2', false),
    Notifikasi('Notifikasi 3', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black38, // This is the background color
              onPrimary: Colors.white, // This is the color of text
            ),
            child: Text('Tandai semua sudah dibaca',
                style: TextStyle(color: Colors.white)),
            onPressed: () {
              setState(() {
                notifikasiList.forEach((notifikasi) {
                  notifikasi.isRead = true;
                });
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notifikasiList.length,
        itemBuilder: (context, index) {
          return Card(
            color: notifikasiList[index].isRead ? Colors.green[100] : Colors.white,
            child: ListTile(
              title: Text(notifikasiList[index].text),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    notifikasiList.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class Notifikasi {
  Notifikasi(this.text, this.isRead);

  String text;
  bool isRead;
}