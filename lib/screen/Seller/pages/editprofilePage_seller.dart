import 'package:flutter/material.dart';

class EditProfilePageSeller extends StatefulWidget {
  @override
  _EditProfilePageSellerState createState() => _EditProfilePageSellerState();
}

class _EditProfilePageSellerState extends State<EditProfilePageSeller> {
  String selectedProvince = '';
  String selectedDistrict = '';
  String selectedSubdistrict = '';
  String selectedVillage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Implement save functionality
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage('assets/images/photo_profile.png'),
                ),
                SizedBox(height: 16),
                TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Alamat Email',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Column(
                  children: [
                    TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Provinsi',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedProvince = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Kabupaten',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedDistrict = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Kecamatan',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedSubdistrict = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Desa',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedVillage = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Nama Jalan',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Kode Pos',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  style: TextStyle(color: Colors.black),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
