import 'package:flutter/material.dart';
import 'package:food_1/food_page.dart';
import 'models/food.dart';

var foodList = [
  Food(name:'ข้าวมันไก่', price: 40, imageUrl: 'tnfood6.jpg'),
  Food(name:'ข้าวหมูกรอบ', price: 45, imageUrl: 'tnfood6.jpg'),
  Food(name:'ผัดไทย', price: 50, imageUrl: 'tnfood6.jpg'),
  Food(name:'ผัดซีอิ๊ว', price: 35, imageUrl: 'tnfood6.jpg'),
  Food(name:'ข้าวขาหมู', price: 40, imageUrl: 'tnfood6.jpg'),
  Food(name:'ข้าวหน้าเป็ด', price: 60, imageUrl: 'tnfood6.jpg'),
  Food(name:'ส้มตำ', price: 40, imageUrl: 'tnfood6.jpg'),
  Food(name:'ข้าวผัด', price: 40, imageUrl: 'tnfood6.jpg'),
  Food(name:'ข้าวกะเพราไก่ไข่ดาว', price: 40, imageUrl: 'tnfood6.jpg'),
];

class FoodListPsge extends StatefulWidget {
  const FoodListPsge({Key? key}) : super(key: key);

  @override
  State<FoodListPsge> createState() => _FoodListPsgeState();
}

class _FoodListPsgeState extends State<FoodListPsge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food List'),),
      body: ListView.builder( ///////คล้ายสร้างลูป//รายการอาหารที่เลื่อนได้
          itemBuilder: (BuildContext context,int i){
            var food = foodList[i];
          return Card( //card=กรอบสี่เหลี่ยมรอบข้อความ
              child: InkWell( //ทำให้กดไปอีกหน้านึงได้ เอาอิ้งมาครอบพาดดิ้งของcard
                onTap: (){ //อีกหน้านึงคือ foodpage
                  
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodPage(food: food)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      //Icon(Icons.fastfood_outlined, size: 80.0,),
                      //Image.network(food.imageUrl, ),
                      Image.asset('assets/images/${food.imageUrl}', width: 100.0,height:100.0,fit: BoxFit.cover,),
                      SizedBox(width: 16.0,),
                      Expanded( //อยู่ในrow จะยืดออกในแนวนอน แต่ถ้าอยู่ใน colum ยืดแนวตั้ง ยืดเต็ม
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, //ชิดซ้าย
                          children: [
                            Text(food.name, style: TextStyle(fontSize: 20.0),),
                            Text('${food.price} บาท'),
                          ],
                        ),
                      ),//ถ้าใส่ Expanded 2 อันจะยืดแบบแบ่งคนละครึ่ง
                      Text('${food.orderCount}') //จะชิ้ดขวาเสมอเพราะอยู่นอก Expanded
                    ],
                  ),
                ),
              ));
      },
      itemCount: foodList.length), //กำหนดจำนวนครั้ง
    );
  }
}
