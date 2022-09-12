import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/WievModel/view_model.dart';

class PizzaDetaylsPage extends StatefulWidget {
  var foodDetiles;
   PizzaDetaylsPage({Key? key, required this.foodDetiles}) : super(key: key);

  @override
  State<PizzaDetaylsPage> createState() => _PizzaDetaylsPageState();
}

class _PizzaDetaylsPageState extends State<PizzaDetaylsPage> {
  bool _isFovorure = false;


  @override
  Widget build(BuildContext context) {
    final _providerWork = Provider.of<CounterViewModel>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.transparent,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isFovorure = !_isFovorure;
                    });
                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.transparent,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child:  Center(
                          child: !_isFovorure
                              ?   const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )
                              : const Icon(Icons.favorite,color: Colors.red,)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children:  [
                Expanded(
                  child: Text(
                    widget.foodDetiles['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "🍕",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "60.00 USE",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Size",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Large 22",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Cheese",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Extra",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Delivery",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "30 min",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: 130,
                    height: 300,
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: NetworkImage(
                            'https://foodish-api.herokuapp.com/images/burger/burger${1+widget.foodDetiles["id"]}.jpg'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                InkWell(
                  onTap: () {
                    _providerWork.incrementCounterRemove();
                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.transparent,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Center(
                          child: Icon(
                            Icons.remove,
                            color: Colors.orange,
                          )),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Consumer<CounterViewModel>(builder: (context, viewModel, child) {
                  return Column(
                    children: [
                      Text(
                        '${viewModel.counter}',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(viewModel.foodList[1]['name'].toString())
                    ],
                  );
                }),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    _providerWork.incrementCounter();
                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.transparent,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content:
                    Text('Buyurtmangiz qaul qilindi')));
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                    child: Text(
                      "Place Order",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
