// ignore_for_file: avoid_print, prefer_const_constructors, unused_local_variable, unused_field, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/task_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Task> _allTasks;
  @override
  void initState() {
    super.initState();
    _allTasks = <Task>[];
    _allTasks.add(Task.create(name: 'Deneme Task', creatAt: DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            _showAddTaskBottomSheet(context);
          },
          child: const Text(
            'Bugün Neler Yapacaksin?',
            style: TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              _showAddTaskBottomSheet(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _allTasks.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                var _oankiListeElemani = _allTasks[index];
                return Dismissible(
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Bu görev silindi')
                    ],
                  ),
                  key: Key(_oankiListeElemani.id),
                  onDismissed: (direction) {
                    _allTasks.removeAt(index);
                    setState(() {});
                  },
                  child: TaskItem(task: _oankiListeElemani),
                );
              },
              itemCount: _allTasks.length,
            )
          : Center(
              child: Text('Hadi görev ekle'),
            ),
    );
  }

  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          width: MediaQuery.of(context).size.width,
          child: ListTile(
            title: TextField(
              autofocus: true,
              onSubmitted: ((value) {
                Navigator.of(context).pop();
                if (value.length > 2) {
                  DatePicker.showTimePicker(context, showSecondsColumn: false,
                      onConfirm: (time) {
                    var yenieklenecekGorev =
                        Task.create(name: value, creatAt: time);
                    _allTasks.add(yenieklenecekGorev);
                    setState(() {});
                  });
                }
              }),
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  hintText: 'Görev Nedir?', border: InputBorder.none),
            ),
          ),
        );
      },
    );
  }
}
