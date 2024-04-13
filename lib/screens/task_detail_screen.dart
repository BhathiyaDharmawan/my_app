import 'package:flutter/material.dart';
import 'package:my_app/models/task.dart';

class TaskDetailScreen extends StatefulWidget {
  final Task task;

  const TaskDetailScreen({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  bool _isAddingTask = false;
  late TextEditingController _taskNameController;
  late TextEditingController _deadlineController;
  List<TaskItem> todoList = [];

  @override
  void initState() {
    super.initState();
    _taskNameController = TextEditingController();
    _deadlineController = TextEditingController();
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _deadlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 51, 170, 234),
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _isAddingTask = true;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 51, 170, 234),
              Color.fromARGB(255, 142, 151, 253)
            ],
            stops: [0.0, 0.7],
          ),
        ),
        child: Center(
          child: _isAddingTask
              ? _buildTaskForm()
              : todoList.isEmpty
                  ? Text(
                      'ISI LIST TUGAS TERLEBIH DAHULU!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  : _buildTaskList(),
        ),
      ),
    );
  }

  Widget _buildTaskForm() {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _taskNameController,
              decoration: InputDecoration(
                labelText: 'Task Name',
                labelStyle:
                    TextStyle(color: Colors.black), // Ubah warna teks label
              ),
              style: TextStyle(color: Colors.black), // Ubah warna teks input
            ),
            SizedBox(height: 16),
            TextField(
              controller: _deadlineController,
              decoration: InputDecoration(
                labelText: 'Deadline (DD/MM/YYYY)',
                labelStyle:
                    TextStyle(color: Colors.black), // Ubah warna teks label
              ),
              style: TextStyle(color: Colors.black), // Ubah warna teks input
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Tambahkan tugas ke dalam daftar tugas
                  todoList.add(
                    TaskItem(
                      name: _taskNameController.text,
                      deadline: _deadlineController.text,
                      isCompleted: false,
                    ),
                  );
                  // Bersihkan nilai controller setelah menambahkan tugas
                  _taskNameController.clear();
                  _deadlineController.clear();
                  // Keluar dari mode tambah tugas
                  _isAddingTask = false;
                });
              },
              child: Text(
                'Add Task',
                style: TextStyle(color: Colors.black), // Ubah warna teks tombol
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white), // Ubah warna latar belakang tombol
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            todoList[index].name,
            style: TextStyle(color: Colors.white), // Ubah warna teks
          ),
          subtitle: Text(
            todoList[index].deadline,
            style: TextStyle(color: Colors.white), // Ubah warna teks
          ),
          trailing: Checkbox(
            value: todoList[index].isCompleted,
            onChanged: (value) {
              setState(() {
                // Ubah nilai isChecked saat kotak ditekan
                todoList[index].isCompleted = value ?? false;
              });
            },
          ),
        );
      },
    );
  }
}

class TaskItem {
  final String name;
  final String deadline;
  bool isCompleted;

  TaskItem({
    required this.name,
    required this.deadline,
    this.isCompleted = false,
  });
}
