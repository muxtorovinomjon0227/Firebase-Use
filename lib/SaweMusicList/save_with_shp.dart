import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePageShared extends StatefulWidget {
  const HomePageShared({Key? key}) : super(key: key);

  @override
  State<HomePageShared> createState() => _HomePageSharedState();
}

class _HomePageSharedState extends State<HomePageShared> {
  List<List<GraphInfo>> list = [];

  @override
  void initState() {
    // addToSP(defaultList).then((_) => getSP());
    super.initState();
  }

  Future<void> addToSP(List<List<GraphInfo>> tList) async { /// ======> Bu yerda saqlash
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('graphLists', jsonEncode(tList));
  }



  void getSP() async {  ///====>  Bu yerda olisg
    final prefs = await SharedPreferences.getInstance();

    final List<dynamic> jsonData =
    jsonDecode(prefs.getString('graphLists') ?? '[]');
    list = jsonData.map<List<GraphInfo>>((jsonList) {
      return jsonList.map<GraphInfo>((jsonItem) {
        return GraphInfo.fromJson(jsonItem);
      }).toList();
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           const  SizedBox(height: 200),
            list.isNotEmpty
                ? Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: list.map((subList) {
                  return subList.isNotEmpty
                      ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: subList.map((x) => Text(x.title)).toList(),
                  )
                      : const Text('Empty subList');
                }).toList(),
              ),
            )
                : const Text('NOTHING'),
            IconButton(onPressed: (){
               addToSP(defaultList).then((_) => getSP());

            }, icon: Icon(Icons.add
            )),
          ],
        ),
      ),
    );
  }
}

// MODEL

class GraphInfo {
  int? id;
  String title;
  String xAxis;
  String yAxis;

  GraphInfo({
    this.id,
    required this.title,
    required this.xAxis,
    required this.yAxis,
  });

  factory GraphInfo.fromJson(Map<String, dynamic> json) {
    return GraphInfo(
        id: json["id"],
        title: json["title"],
        xAxis: json["xAxis"],
        yAxis: json["yAxis"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "xAxis": xAxis,
      "yAxis": yAxis,
    };
  }

  @override
  String toString() => '{name: $title, x: $xAxis, y: $yAxis}';
}

// DATA

final List<List<GraphInfo>> defaultList = [ /// ==== >   Bu yerda Jsonga o'grib olish
  [
    GraphInfo(title: 'Graph 1', xAxis: "10", yAxis: "15"),
    GraphInfo(title: 'Graph 1', xAxis: "15", yAxis: "20"),
  ],
  [
    GraphInfo(title: 'Graph 2', xAxis: "20", yAxis: "20"),
    GraphInfo(title: 'Graph 2', xAxis: "25", yAxis: "25"),
  ],
];