import 'package:flutter/material.dart';
import 'models/food.dart';

class FoodPage extends StatelessWidget {
  final Food food;            ////

  const FoodPage({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food.name),),
      body: Column(
        children: [
          Stack( //ทำให้มันซ้อนกัน
            children: [
              Image.asset('assets/images/${food.imageUrl}'),
              Align(alignment: Alignment.center,child: Text('${food.price} บาท')),
            ],
          )

        ],
      ),
    );
  }
}
