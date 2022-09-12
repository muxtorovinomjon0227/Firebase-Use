import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/WievModel/view_model.dart';

class AllFoodPage extends StatefulWidget {
  const AllFoodPage({Key? key}) : super(key: key);

  @override
  State<AllFoodPage> createState() => _AllFoodPageState();
}

class _AllFoodPageState extends State<AllFoodPage> {
  @override
  Widget build(BuildContext context) {
    return
       Consumer<CounterViewModel>(builder: (context, viewModel, child) {
        return ListView.builder(
          itemCount: viewModel.foodList.length,
            itemBuilder: (BuildContext context, int index){
          return Column(
            children: [
              Card(
                color: Colors.transparent,
                elevation: 8,
                shadowColor: Colors.black,
                child: Stack(
                    children: [
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
                            color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40,top: 20,bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("50% OFF",style: TextStyle(color: Colors.orangeAccent,fontSize: 18),),
                                  SizedBox(height: 6),
                                  Text("Supper value",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                  SizedBox(height: 6),
                                  Text("Chicken Tikka",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            const  SizedBox(width: 50),
                            Image.asset("assets/img_pizza.png")
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
                                    )
                                ),
                                height: 50,
                                width: 150,
                                child: const Center(child: Text("60.00 USE")),
                              ),
                            ],
                          ),
                          Padding(
                            padding:  const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                            child: Row(
                              children: const [
                                Icon(Icons.star,color: Colors.grey,),
                                Text("5.0",style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ],
          );
        });
      });
  }
}
