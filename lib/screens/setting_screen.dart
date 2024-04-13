// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:my_app/screens/about_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/privacy_screen.dart';
import 'package:my_app/screens/profile_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 51, 170, 234),
                Color.fromARGB(255, 142, 151, 253)
              ],
            ),
          ),
          child: ListView(
            children: [
              ListTile(
                title: Text('Account'),
                leading: Icon(Icons.account_circle),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Privacy'),
                leading: Icon(Icons.privacy_tip),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('About'),
                leading: Icon(Icons.info),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(
    home: SettingScreen(),
  ));
}
