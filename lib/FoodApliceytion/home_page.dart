import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/FoodApliceytion/pizza_detayles_page.dart';
import 'package:untitled/WievModel/view_model.dart';

import 'AllFood/aff_food_page.dart';

class FoodAppHomePage extends StatefulWidget {
  FoodAppHomePage({Key? key}) : super(key: key);


  @override
  State<FoodAppHomePage> createState() => _FoodAppHomePageState();
}

class _FoodAppHomePageState extends State<FoodAppHomePage> {
  int _pageIndex = 0;


  @override
  void initState() {
    super.initState();
    setState(() {
      getResaulr(context);
    });
  }

  getResaulr(BuildContext context) {
    final _providerWork = Provider.of<CounterViewModel>(context, listen: false);
    _providerWork.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterViewModel>(builder: (context, viewModel, child) {
      return GestureDetector(
        onTap: () {
          FocusScopeNode currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus) {
            currentScope.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 5, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.menu,
                          size: 30,
                        )),
                    const Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            8.0),
                                        child: Image.network(
                                          "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        width: 40,
                        margin: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const Image(
                            image: NetworkImage(
                                'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Tasty Pizza",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Flexible(
                  flex: 1,
                  child: TextField(
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        hintText: 'Search',
                        hintStyle:
                        const TextStyle(color: Colors.black45, fontSize: 18),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          child: const Icon(Icons.search, size: 30),
                          width: 10,
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _pageIndex == 0
                        ? Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      width: 80,
                      height: 40,
                      child: const Center(
                          child: Text(
                            "All",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                        : InkWell(
                        onTap: () {
                          setState(() {
                            _pageIndex = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: 80,
                          height: 40,
                          child: const Center(
                              child: Text(
                                "All",
                                style: TextStyle(color: Colors.black),
                              )),
                        )),
                    _pageIndex == 1
                        ? Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      width: 80,
                      height: 40,
                      child: const Center(
                          child: Text(
                            "Pizza",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                        : InkWell(
                        onTap: () {
                          setState(() {
                            _pageIndex = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: 80,
                          height: 40,
                          child: const Center(
                              child: Text(
                                "Pizza",
                                style: TextStyle(color: Colors.black),
                              )),
                        )),
                    _pageIndex == 2
                        ? Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      width: 80,
                      height: 40,
                      child: const Center(
                          child: Text(
                            "Food",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                        : InkWell(
                        onTap: () {
                          setState(() {
                            _pageIndex = 2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: 80,
                          height: 40,
                          child: const Center(
                              child: Text(
                                "Food",
                                style: TextStyle(color: Colors.black),
                              )),
                        )),
                    _pageIndex == 3
                        ? Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      width: 80,
                      height: 40,
                      child: const Center(
                          child: Text(
                            "Drink",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                        : InkWell(
                      onTap: () {
                        setState(() {
                          _pageIndex = 3;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        width: 80,
                        height: 40,
                        child: const Center(
                            child: Text(
                              "Drink",
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ),
                  ],
                ),
                 _pageIndex == 0
                    ? _buildCard(context)
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      );
    } );
  }
}

Widget _buildCard(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.64,
    child: Consumer<CounterViewModel>(builder: (context, viewModel, child) {
      return viewModel.foodList.isEmpty ? const Center(child: CircularProgressIndicator(
        strokeWidth: 2,
      )) : ListView.builder(
          itemCount: viewModel.foodList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    var foodDetiles = viewModel.foodList[index];
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PizzaDetaylsPage(foodDetiles: foodDetiles,)));

                  },
                  child: Card(
                    color: Colors.transparent,
                    elevation: 8,
                    shadowColor: Colors.black,
                    child: Stack(children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        height: 150,
                        width: 360,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 40, top: 20, bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    viewModel.foodList[index]["restaurant"],
                                    style: TextStyle(
                                        color: Colors.orangeAccent, fontSize: 18),
                                  ),
                                  SizedBox(height: 6),
                                  const Text(
                                    "Supper value",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  const  SizedBox(height: 6),
                                  Expanded(
                                    child: Text(
                                      viewModel.foodList[index]["name"],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: Container(
                                width: 130,
                                height: 300,
                                margin: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image(
                                    image: NetworkImage(
                                        'https://foodish-api.herokuapp.com/images/burger/burger${1+viewModel.foodList[index]["id"]}.jpg'),
                                  ),
                                ),
                              ),
                            ),

                            // const Text("🍕",style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )),
                                height: 50,
                                width: 150,
                                child: const Center(child: Text("60.00 USE")),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "5.0",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              ],
            );
          });
    }),
  );
}

