import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/TodoExempale/DataBaseHelper/MobailUi/add_todo_page.dart';
import 'package:untitled/TodoExempale/modle/task_model.dart';
import 'package:untitled/WievModel/view_model.dart';

import '../database_helper.dart';

class TodHomePage extends StatefulWidget {
  const TodHomePage({Key? key}) : super(key: key);

  @override
  State<TodHomePage> createState() => _TodHomePageState();
}


class _TodHomePageState extends State<TodHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Exemple"),
      ),
      body: Consumer<CounterViewModel>(builder: (context, data, child) {
        return FutureBuilder(
            future: DatabaseHelper.intance.getTasks(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
              return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data![index].title.toString()),
                        ],
                      ),
                    );
                  });
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddToDoPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


