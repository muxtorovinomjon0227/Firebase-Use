import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/WievModel/view_model.dart';

class TodoAppHomePge extends StatefulWidget {
  TodoAppHomePge({Key? key}) : super(key: key);

  @override
  State<TodoAppHomePge> createState() => _TodoAppHomePgeState();
  List itemList1 = [];
}

TextEditingController _editTextController = TextEditingController();
List<String> textList = [];
List itemList1 = [];

class _TodoAppHomePgeState extends State<TodoAppHomePge> {
  @override
  void initState() {
    super.initState();
    getList();
  }

  getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final rese = prefs.getStringList("items");
    itemList1 = rese!;
    print(rese);
  }

  @override
  Widget build(BuildContext context) {
    final _providerWork = Provider.of<CounterViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TodoText with Shared Preference",
          style: TextStyle(color: Colors.lightGreen, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _editTextController,
                    decoration: const InputDecoration(
                        labelText: "Enter text",

                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      textList.add(_editTextController.text);
                      _editTextController.clear();
                      _providerWork.itemList(textList);
                      getList();
                      setState(() {});
                    },
                    child: const Text("Add")),
              ],
            ),
            Expanded(
              child: Consumer<CounterViewModel>(
                  builder: (context, viewModel, child) {
                return ListView.builder(
                    itemCount: itemList1.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Card(
                          color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text((index + 1).toString(),style: const TextStyle(fontSize: 18,color: Colors.blue),),
                                  Expanded(child: Text(itemList1[index].toString(),style: const TextStyle(fontSize: 16),)),
                                ],
                              ),
                            )),
                      );
                    });
              }),
            )
          ],
        ),
      ),
    );
  }
}
