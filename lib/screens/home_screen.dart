// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:my_app/mahasiswa/mahasiswa/mahasiswa_page.dart';
import 'package:my_app/models/task.dart';
import 'package:my_app/screens/about_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/news_screen.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/setting_screen.dart';
import 'package:my_app/screens/task_detail_screen.dart'; // Import MahasiswaScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Board> _boards = []; // List untuk menyimpan objek board

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyTask'),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white, // Ubah latar belakang drawer menjadi hitam
          child: ListView(
            children: [
              DrawerHeader(
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ), // Navigate to ProfileScreen
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          'assets/images/user.png',
                        ), // Placeholder image, you can replace it with your own image
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Bhathiya Dharmawan', // Replace with user's name
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text('LATIHAN 1 [API]',
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MahasiswaScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('LATIHAN 2 [CRUD]',
                    style: TextStyle(
                        color: Colors
                            .black)), // Ubah nama menu 1 menjadi 'Mahasiswa'
                onTap: () {
                  Navigator.pushNamed(context, '/addtypes');
                },
              ),
              ListTile(
                title: Text('Setting', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('About', style: TextStyle(color: Colors.black)),
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
                title: Text('LOGOUT',
                    style: TextStyle(
                        color: Colors
                            .black)), // Ubah nama menu 1 menjadi 'Mahasiswa'
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 51, 170, 234),
              Color.fromARGB(255, 142, 151, 253)
            ], // Example gradient colors
          ),
        ),
        child: ListView.builder(
          itemCount: _boards.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 120,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _boards[index].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_boards[index].task != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TaskDetailScreen(task: _boards[index].task!),
                          ),
                        );
                      } else {
                        // Handle case when task is null
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text('Task is not available.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            // Warna saat tombol ditekan
                            return const Color.fromARGB(255, 51, 170, 234);
                          }
                          // Warna saat tombol tidak ditekan
                          return const Color.fromARGB(255, 255, 255, 255);
                        },
                      ),
                    ),
                    child: Text('Cek', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Background warna putih
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            if (index == 1) {
              // Tampilkan dialog untuk menambahkan board
              _showAddBoardDialog();
            } else {
              _selectedIndex = index;
            }
          });
        },
        selectedItemColor: Color.fromARGB(255, 51, 170, 234),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        mouseCursor: MaterialStateMouseCursor.clickable,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }

  // Fungsi untuk menampilkan dialog tambah board
  Future<void> _showAddBoardDialog() async {
    String title = ''; // Judul board yang diisi pengguna

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambahkan Board'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  onChanged: (value) => title = value,
                  decoration: InputDecoration(
                    labelText: 'Judul Board',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                // Buat objek Task baru dengan judul yang dimasukkan
                Task newTask = Task(title);

                // Tambahkan board ke dalam list boards
                setState(() {
                  _boards.add(Board(title: title, task: newTask));
                });
                Navigator.of(context).pop();
              },
              child: Text('Tambah'),
            ),
          ],
        );
      },
    );
  }
}

// Class untuk merepresentasikan board
class Board {
  final String title;
  final Task? task; // Tambahkan properti task

  Board({required this.title, this.task});
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
