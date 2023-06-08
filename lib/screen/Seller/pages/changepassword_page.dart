import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String _errorMessage = '';

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateAndSave() {
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (password.length < 8) {
      setState(() {
        _errorMessage = 'Password harus minimal 8 karakter.';
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        _errorMessage = 'Konfirmasi password tidak sesuai.';
      });
      return;
    }

    // Enkripsi password sebelum disimpan
    String encryptedPassword = sha256.convert(utf8.encode(password)).toString();

    // Simpan password ke database atau lakukan aksi lainnya

    // Reset field dan error message
    _passwordController.clear();
    _confirmPasswordController.clear();
    setState(() {
      _errorMessage = '';
    });

    // Tampilkan snackbar atau dialog sukses
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Kata Sandi berhasil diubah')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Ubah Kata Sandi',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Konfirmasi Password',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _validateAndSave,
              child: Text(
                'Simpan',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
