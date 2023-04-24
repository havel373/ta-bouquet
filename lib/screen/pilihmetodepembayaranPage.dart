import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PilihanPembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Cara Pembayaran'),
      ),
      body: ListView(
        children: _buildMetodePembayaran(),
      ),
    );
  }

  List<Widget> _buildMetodePembayaran() {
    List<String> metodePembayaran = [
      'Bank Transfer',
      'Kartu Kredit',
      'e-Wallet',
      'Tunai',
    ];

    return metodePembayaran.map<Widget>((metode) {
      return ExpansionTile(
        title: Text(metode),
        children: _buildDetailMetodePembayaran(metode),
      );
    }).toList();
  }

  List<Widget> _buildDetailMetodePembayaran(String metode) {
    // Tambahkan detail metode pembayaran, misalnya daftar bank, jenis kartu kredit, dll.
    // Anda dapat menggantinya dengan data yang sesuai dengan kebutuhan Anda.
    List<String> details = [];
    switch (metode) {
      case 'Bank Transfer':
        details = ['Bank BCA', 'Bank BRI', 'Bank BNI', 'Bank Mandiri'];
        break;
      case 'Kartu Kredit':
        details = ['Visa', 'Mastercard', 'JCB'];
        break;
      case 'e-Wallet':
        details = ['OVO', 'DANA', 'GoPay'];
        break;
      case 'Tunai':
        details = ['COD (Cash on Delivery)'];
        break;
      default:
        break;
    }

    return details.map<Widget>((detail) {
      return ListTile(
        title: Text(detail),
        onTap: () {
          // Tindakan saat metode pembayaran dipilih, misalnya navigasi ke halaman berikutnya
        },
      );
    }).toList();
  }
}