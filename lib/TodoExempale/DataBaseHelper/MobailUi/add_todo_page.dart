import 'package:flutter/material.dart';
import 'package:untitled/TodoExempale/modle/task_model.dart';

import '../database_helper.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({Key? key}) : super(key: key);

  @override
  State<AddToDoPage> createState() => _AddToDoPageState();
}

TextEditingController _addTextController = TextEditingController();
TextEditingController _addTextController2 = TextEditingController();

class _AddToDoPageState extends State<AddToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _addTextController,
              decoration: InputDecoration(
                labelText: "add text",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _addTextController2,
              decoration: InputDecoration(
                labelText: "add lable",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              createTask();
            }, child: const Text("Add"))
          ],
        ),
      ),
    );
  }
  void createTask() async {
    Task newTask = Task(
        _addTextController.text, "description1", DateTime.now(), "07:47", "19:00");

    var res = await DatabaseHelper.intance.insert(newTask);
    print("Shu yerda task chiqishi kerak ${res.toString()}");

    Navigator.pop(context);
  }
}
