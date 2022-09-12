import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/FoodApliceytion/models/foo_model.dart';
import 'package:http/http.dart' as http;

class CounterViewModel extends ChangeNotifier {
  List foodList = [];

  int countery = 0;

  int get counter => countery;

  incrementCounter() {
    countery++;
    notifyListeners();
    getUsers();
  }

  incrementCounterRemove() {
    if (countery > 0) countery--;
    notifyListeners();
  }

  Future<List<dynamic>?> getUsers() async {
    try {
      var url = Uri.parse('https://burgers1.p.rapidapi.com/burgers');
      var response = await http.get(url, headers: {
        'X-RapidAPI-Key': '8be2ecc607msh598077496d9a17ap126369jsnfaf826d76475',
        'X-RapidAPI-Host': 'burgers1.p.rapidapi.com'
      });
      if (response.statusCode == 200) {
        List<dynamic> _model = jsonDecode(response.body);
        foodList = _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  itemList(itemList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var itemList = <String>["item1", "item2", "item3"];
    final res = prefs.setStringList('items', itemList);
    return res;
  }


}
