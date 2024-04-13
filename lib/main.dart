// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:my_app/mahasiswa/mahasiswa/mahasiswa_page.dart';
import 'package:my_app/screens/CRUD.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/registration_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/routes/books_screen.dart';
import 'package:my_app/screens/task_detail_screen.dart'; // Import TaskDetailScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyTask',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/home': (context) => const HomeScreen(),
        '/addtypes': (context) => const AddTypes(),
        '/booksscreen': (context) => const BooksScreen()
      },
    );
  }
}
