import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 51, 170, 234),
              Color.fromARGB(255, 142, 151, 253)
            ], // Sesuaikan dengan warna latar belakang pada HomeScreen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    'assets/images/user.png'), // Ganti dengan path gambar profil Anda
              ),
              SizedBox(height: 20),
              ProfileTextField(
                  label: 'Nama', initialValue: 'Bhathiya Dharmawan'),
              ProfileTextField(
                  label: 'Email', initialValue: 'bhathiya@gmail.com'),
              ProfileTextField(label: 'Nomor WA', initialValue: '085739374205'),
              ProfileTextField(
                  label: 'Instagram', initialValue: '@bhathiya1221'),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String label;
  final String initialValue;

  const ProfileTextField(
      {Key? key, required this.label, required this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        initialValue: initialValue,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
